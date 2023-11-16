package com.green.greenstock.dto;

import com.green.greenstock.repository.entity.AdvisorBoardEntity;
import com.green.greenstock.repository.model.AdvisorBoard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorBoardResDto {

    private int advisorBoardId;
    private String title;
    private String content;
    private int parent;
    private String createdAt;
    private int userId;
    private String userName;
    private int advisorId;
    private String advisorNickname;
    private int views;
    private String image;
    private AdvisorBoard prevBoard;
    private AdvisorBoard nextBoard;

    public static AdvisorBoardResDto fromEntity(AdvisorBoardEntity advisorBoardEntity) {

        return AdvisorBoardResDto
                .builder()
                .advisorBoardId(advisorBoardEntity.getAdvisorBoardId())
                .title(advisorBoardEntity.getTitle())
                .content(advisorBoardEntity.getContent())
                .parent(advisorBoardEntity.getParent())
                .createdAt(advisorBoardEntity.getCreatedAt().toString())
                .userId(advisorBoardEntity.getUserEntity().getId())
                .userName(advisorBoardEntity.getUserEntity().getUserName())
                .advisorId(advisorBoardEntity.getAdvisorEntity().getAdvisorId())
                .advisorNickname(advisorBoardEntity.getAdvisorEntity().getAdvisorNickName())
                .views(advisorBoardEntity.getViews())
                .image(advisorBoardEntity.getAdvisorEntity().getImageEntity().getImgName())
                .build();

    }

}
