package com.green.greenstock.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.greenstock.dto.AdvisorBoardReqDto;
import com.green.greenstock.dto.AdvisorBoardReplyResDto;
import com.green.greenstock.dto.AdvisorBoardResDto;
import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.dto.AdvisorResDto;
import com.green.greenstock.dto.AdvisorSubCountResDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.PageNotFoundException;
import com.green.greenstock.repository.entity.AdvisorBoardEntity;
import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.ImageEntity;
import com.green.greenstock.repository.entity.SubscribeToAdvisorEntity;
import com.green.greenstock.repository.entity.UserEntity;
import com.green.greenstock.repository.interfaces.AdvisorBoardEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorBoardRepository;
import com.green.greenstock.repository.interfaces.AdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.ImageEntityRepository;
import com.green.greenstock.repository.interfaces.SubscribeToAdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.UserEntityRepository;
import com.green.greenstock.repository.model.Advisor;
import com.green.greenstock.repository.model.AdvisorBoard;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdvisorService {

    private final AdvisorEntityRepository advisorEntityRepository;
    private final AdvisorBoardEntityRepository advisorBoardEntityRepository;
    private final ImageEntityRepository imageEntityRepository;
    private final AdvisorRepository advisorRepository;
    private final SubscribeToAdvisorEntityRepository subscribeToAdvisorEntityRepository;
    private final UserEntityRepository userEntityRepository;
    private final AdvisorBoardRepository advisorBoardRepository;

    @Value("${spring.servlet.multipart.location}")
    private String filePath;

    /**
     * 전문가 리스트 가져오기(승인(2)된 유저만)
     * 
     * @param status
     * @return 전문가리스트
     */
    @Transactional
    public List<AdvisorSubCountResDto> findByAdvisorSubCount(String orderBy) {
        return advisorRepository.findByAdvisorSubCount(orderBy);
    }

    /**
     * 닉네임으로 전문가 한명 가져오기
     * 
     * @param nickName
     * @return 전문가 한명
     */
    @Transactional
    public AdvisorResDto findByAdvisorNickName(String nickName) {
        AdvisorResDto advisorResDto = new AdvisorResDto();
        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);
        if (advisorEntity == null) {
            throw new PageNotFoundException("전문가를 찾을 수 없습니다.", "/advisor/list");
        }
        return advisorResDto.fromEntity(advisorEntity);
    }

    @Transactional
    public int findCountByNickname(String nickname) {
        return advisorRepository.findCountByAdvisorNickname(nickname);
    }

    /**
     * 전문가 신청하기
     * 
     * @param advisorReqDto
     */
    @Transactional
    public void saveAdvisor(AdvisorReqDto advisorReqDto) {
        // dto-entity변환
        AdvisorEntity advisorEntity = AdvisorEntity.toEntity(advisorReqDto);
        AdvisorEntity savedAdvisorEntity = advisorEntityRepository.save(advisorEntity);

        // 이미지 저장
        MultipartFile multipartFile = advisorReqDto.getProfilePhoto();

        // 이미지 업로드
        ImageEntity imageEntity = uploadImage(multipartFile);

        if (imageEntity.getImgId() == 0) {
            throw new CustomRestfulException("신청이 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // 이미지 테이블 번호 넣기
        savedAdvisorEntity.setImageEntity(imageEntity);

    }

    /**
     * 이미지 업로드
     * 
     * @param multipartFile
     * @return ImageEntity
     */
    @Transactional
    public ImageEntity uploadImage(MultipartFile multipartFile) {

        // 중복 파일 이름 방지
        String oriFileName = multipartFile.getOriginalFilename(); // 파일 원본 이름 가져오기
        String uuidStr = UUID.randomUUID().toString(); // 랜덤문자 가져오기
        LocalDate now = LocalDate.now(); // 현재시간 가져오기
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd"); // 시간 포맷 지정
        String formatedNow = now.format(dateTimeFormatter); // 시간 포맷 변환
        String newFileName = uuidStr;
        if (oriFileName != null) {
            int extIndex = oriFileName.indexOf("."); // . 인덱스 가져오기
            String ext = oriFileName.substring(extIndex); // .확장자 가져오기
            newFileName += ext; // 시간_UUID.확장자
        }
        String newDatefolderPath = filePath + formatedNow + File.separator; // 기존 폴더/연월일/
        // 폴더 확인 없으면 업로드 날짜(yyyyMMdd)로 폴더 생성
        File folder = new File(newDatefolderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        Path path = Paths.get(newDatefolderPath, newFileName); // 파일 생성(경로 + 파일)
        // 파일 업로드!
        try {
            Files.write(path, multipartFile.getBytes());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        // 경로 + 파일 이름(경로/파일이름)
        String newImagePathAndName = formatedNow + File.separator + newFileName;

        // 이미지 테이블에 저장
        return imageEntityRepository.save(
                ImageEntity
                        .builder()
                        .imgName(newImagePathAndName)
                        .build());
    }

    public Advisor findAdvisorById(int advisorId) {
        return advisorRepository.findById(advisorId);

    }

    /**
     * 전문가 구독하기 기능
     * 
     * @param advisorId
     * @param userId
     */
    @Transactional
    public void saveSubscribeToAdvisor(int advisorId, int userId) {
        AdvisorEntity advisorEntity = advisorEntityRepository.findById(advisorId)
                .orElseThrow(() -> new CustomRestfulException("존재하지 않는 전문가입니다.", HttpStatus.BAD_REQUEST));
        UserEntity userEntity = userEntityRepository.findById(userId)
                .orElseThrow(() -> new CustomRestfulException("존재하지 않는 사용자입니다.", HttpStatus.BAD_REQUEST));

        SubscribeToAdvisorEntity entity = SubscribeToAdvisorEntity
                .builder()
                .advisorEntity(advisorEntity)
                .userEntity(userEntity)
                .build();

        subscribeToAdvisorEntityRepository.save(entity);

    }

    // 구독 유효성 체크
    @Transactional
    public boolean validateSubscribeToAdvisor(String nickName, int userId) {

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);
        UserEntity userEntity = userEntityRepository.findById(userId)
                .orElseThrow(() -> new CustomRestfulException("아이디를 찾을수 없습니다.", HttpStatus.BAD_REQUEST));
        SubscribeToAdvisorEntity subscribeToAdvisorEntity = subscribeToAdvisorEntityRepository
                .findByAdvisorEntityAndUserEntity(advisorEntity, userEntity);
        return subscribeToAdvisorEntity != null;
    }

    // 전문가 상담 게시판 리스트(일반 글)
    @Transactional
    public Page<AdvisorBoardResDto> findByAdvisorEntityAndParent(String nickName, int parent, Pageable pageable) {

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);

        Page<AdvisorBoardEntity> advisorBoardEntities = advisorBoardEntityRepository
                .findByAdvisorEntityAndParent(advisorEntity, parent, pageable);

        return advisorBoardEntities.map(AdvisorBoardResDto::fromEntity);
    }

    // 전문가 상담게시판 글 한개 보기
    @Transactional
    public AdvisorBoardResDto findByAdvisorBoardId(int advisorBoardId) {
        // 대상 엔티티 찾기
        AdvisorBoardEntity advisorBoardEntity = advisorBoardEntityRepository.findByAdvisorBoardId(advisorBoardId);
        // 조회수 증가
        int originViews = advisorBoardEntity.getViews();
        advisorBoardEntity.setViews(originViews + 1);
        // 이전글 다음글 가져오기
        String localDateTime = advisorBoardEntity.getCreatedAt().toString();
        int advisorId = advisorBoardEntity.getAdvisorEntity().getAdvisorId();
        AdvisorBoard prevBoard = advisorBoardRepository.findPrevBoard(advisorId, localDateTime);
        AdvisorBoard nextBoard = advisorBoardRepository.findNextBoard(advisorId, localDateTime);
        // 엔티티 dto 변환
        AdvisorBoardResDto advisorBoardResDto = AdvisorBoardResDto.fromEntity(advisorBoardEntity);
        advisorBoardResDto.setPrevBoard(prevBoard);
        advisorBoardResDto.setNextBoard(nextBoard);
        return advisorBoardResDto;
    }

    /**
     * 댓글목록 불러오기
     * 
     * @param parent
     * @param pageable
     * @return dto로 변환하여 반환
     */
    @Transactional
    public Page<AdvisorBoardReplyResDto> findByParent(int parent, Pageable pageable) {
        Page<AdvisorBoardEntity> replyEntities = advisorBoardEntityRepository.findByParent(parent,
                pageable);
        return replyEntities.map(AdvisorBoardReplyResDto::fromEntity);
    }

    // 글, 댓글 등록
    @Transactional
    public AdvisorBoardEntity saveAdvisorBoard(AdvisorBoardReqDto advisorBoardReqDto) {

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorId(advisorBoardReqDto.getAdvisorId());
        UserEntity userEntity = userEntityRepository.findById(advisorBoardReqDto.getUserId())
                .orElseThrow(() -> new CustomRestfulException("아이디를 찾을수 없습니다.", HttpStatus.BAD_REQUEST));

        AdvisorBoardEntity advisorBoardEntity = AdvisorBoardReqDto.toEntity(advisorBoardReqDto);
        advisorBoardEntity.setAdvisorEntity(advisorEntity);
        advisorBoardEntity.setUserEntity(userEntity);

        return advisorBoardEntityRepository.save(advisorBoardEntity);

    }

    /**
     * 구독자 삭제하기
     * 
     * @param advisorId
     * @param userId
     */
    @Transactional
    public void deleteSubscribeToAdvisorEntity(int advisorId, int userId) {
        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorId(advisorId);
        UserEntity userEntity = userEntityRepository.findById(userId)
                .orElseThrow(() -> new CustomRestfulException("아이디를 찾을수 없습니다.", HttpStatus.BAD_REQUEST));
        SubscribeToAdvisorEntity subscribeToAdvisorEntity = subscribeToAdvisorEntityRepository
                .findByAdvisorEntityAndUserEntity(advisorEntity, userEntity);
        subscribeToAdvisorEntityRepository.delete(subscribeToAdvisorEntity);
    }

    /**
     * 구독 만료 삭제
     * 매일 00시 정각 min > hour > day(일) > month > weekday
     */
    @Transactional
    @Scheduled(cron = "0 0 0 * * *")
    public void validateAndDeleteSubscribe() {
        log.info("매일 자정 구독 만료 확인이 실행되었습니다.");
        List<SubscribeToAdvisorEntity> subscribeToAdvisorEntities = subscribeToAdvisorEntityRepository.findAll();
        LocalDateTime now = LocalDateTime.now();
        for (SubscribeToAdvisorEntity subscribeToAdvisorEntity : subscribeToAdvisorEntities) {
            LocalDateTime expTime = subscribeToAdvisorEntity.getExpirationTime();
            if (now.isAfter(expTime)) { // 현재시간과 비교하여 구독시간이 지났다면
                subscribeToAdvisorEntityRepository.delete(subscribeToAdvisorEntity);
                log.info("구독만료로 삭제된 아이디 : {}", subscribeToAdvisorEntity.getSubId());
            }
        }
    }

    // 전문가 글 삭제
    @Transactional
    public int deleteAdvisorBoard(int advisorBoardId) {
        // 게시글 또는 댓글 찾기
        AdvisorBoardEntity advisorBoardEntity = advisorBoardEntityRepository.findByAdvisorBoardId(advisorBoardId);

        // 게시글이고 댓글이 있다면 삭제
        List<AdvisorBoardEntity> advisorBoardEntities = advisorBoardEntityRepository.findByParent(advisorBoardId);
        if (advisorBoardEntities.size() != 0) {
            advisorBoardEntityRepository.deleteAll(advisorBoardEntities);
        }

        // 게시글 또는 댓글 삭제
        int result = 0;
        if (advisorBoardEntity != null) {
            advisorBoardEntityRepository.delete(advisorBoardEntity);
            result = 1;
        }
        return result;
    }

    // 게시글 수정
    @Transactional
    public void updateAdvisorBoard(AdvisorBoardReqDto advisorBoardReqDto) {
        int advisorBoardId = advisorBoardReqDto.getAdvisorBoardId();
        AdvisorBoardEntity advisorBoardEntity = advisorBoardEntityRepository.findByAdvisorBoardId(advisorBoardId);
        advisorBoardEntity.setTitle(advisorBoardReqDto.getTitle());
        advisorBoardEntity.setContent(advisorBoardReqDto.getContent());
    }

    // 전문가 신청, 이미 전문가인지 확인
    public AdvisorEntity findByUserEntity(Integer id) {
        UserEntity userEntity = userEntityRepository.findById(id)
                .orElseThrow(() -> new CustomRestfulException("아이디를 찾을수 없습니다.", HttpStatus.BAD_REQUEST));
        return advisorEntityRepository.findByUserEntity(userEntity);
    }

}
