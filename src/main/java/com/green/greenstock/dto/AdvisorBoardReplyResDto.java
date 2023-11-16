package com.green.greenstock.dto;

import com.green.greenstock.repository.entity.AdvisorBoardEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorBoardReplyResDto {

    private int advisorBoardId;
    private String content;
    private String createdAt;
    private int userId;
    private String userName;

    public static AdvisorBoardReplyResDto fromEntity(AdvisorBoardEntity advisorBoardEntity) {
        return AdvisorBoardReplyResDto.builder()
                .advisorBoardId(advisorBoardEntity.getAdvisorBoardId())
                .content(advisorBoardEntity.getContent())
                .createdAt(advisorBoardEntity.getCreatedAt().toString())
                .userId(advisorBoardEntity.getUserEntity().getId())
                .userName(advisorBoardEntity.getUserEntity().getUserName())
                .build();
    }
}
