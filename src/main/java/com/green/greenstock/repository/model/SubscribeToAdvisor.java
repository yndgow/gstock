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
public class SubscribeToAdvisor {
    
    private int subId;
    private int userId;
    private int advisorId;
    private LocalDateTime subscribeTime;
    private LocalDateTime expirationTime;
    
}
