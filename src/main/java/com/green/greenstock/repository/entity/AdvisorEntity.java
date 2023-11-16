package com.green.greenstock.repository.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.green.greenstock.dto.AdvisorReqDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "advisor")
@EntityListeners(AuditingEntityListener.class)
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int advisorId;
    // private int userId;

    @Column(nullable = false)
    private String advisorFullName;

    @Column(columnDefinition = "varchar(50) unique", nullable = false)
    private String advisorNickName;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String career;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String introduction;

    @Column(columnDefinition = "tinyint default 0")
    private int specialization;

    @Column(columnDefinition = "int default 0")
    private int subscriptionCost;

    @Builder.Default
    @Column(columnDefinition = "tinyint default 1")
    private int status = 1;

    @CreatedDate
    @Column(columnDefinition = "DATETIME(0) default CURRENT_TIMESTAMP")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "advisorEntity")
    private List<AdvisorBoardEntity> advisorBoards;

    @OneToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private UserEntity userEntity;

    @OneToOne
    @JoinColumn(name = "imgId", referencedColumnName = "imgId")
    private ImageEntity imageEntity;

    public static AdvisorEntity toEntity(AdvisorReqDto advisorDto) {
        return AdvisorEntity
                .builder()
                .advisorFullName(advisorDto.getFullName())
                .advisorNickName(advisorDto.getNickName())
                .career(advisorDto.getCareer())
                .introduction(advisorDto.getIntroduction())
                .specialization(advisorDto.getSpecialization())
                .userEntity(UserEntity.builder().id(advisorDto.getUserId()).build())
                .build();
    }

}
