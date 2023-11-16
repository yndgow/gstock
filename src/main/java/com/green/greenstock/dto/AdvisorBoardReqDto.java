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
public class AdvisorBoardReqDto {

    private int advisorBoardId;
    private String title;
    private String content;
    private int parent;
    private int advisorId;
    private int userId;

    public static AdvisorBoardEntity toEntity(AdvisorBoardReqDto advisorBoardReqDto) {

        return AdvisorBoardEntity
                .builder()
                .advisorBoardId(advisorBoardReqDto.getAdvisorBoardId())
                .title(advisorBoardReqDto.getTitle())
                .content(advisorBoardReqDto.getContent())
                .parent(advisorBoardReqDto.getParent())
                .build();
    }
}
