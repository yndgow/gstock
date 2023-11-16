package com.green.greenstock.repository.model;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvisorBoard {

    private int advisorBoardId;
    private int advisorId;
    private int userId;
    private String title;
    private String content;
    private int parent; // 댓글여부
    private LocalDateTime createAt;
    private int views; // 조회수

}
