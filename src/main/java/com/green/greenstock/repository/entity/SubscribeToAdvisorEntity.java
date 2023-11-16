package com.green.greenstock.repository.entity;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "subscribe_to_advisor")
@EntityListeners(AuditingEntityListener.class)
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class SubscribeToAdvisorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int subId;

    @CreatedDate
    @Column(columnDefinition = "DATETIME(0) default CURRENT_TIMESTAMP")
    private LocalDateTime subscribeTime;

    @Column(columnDefinition = "DATETIME(0)")
    private LocalDateTime expirationTime;

    @OneToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private UserEntity userEntity;

    @OneToOne
    @JoinColumn(name = "advisorId", referencedColumnName = "advisorId")
    private AdvisorEntity advisorEntity;

    @PrePersist
    private void setDefaultExpirationTime() {
        // 현재 시각에서 1달을 더하여 expirationTime 필드에 설정
        this.expirationTime = LocalDateTime.now().plus(1, ChronoUnit.MONTHS);
    }
}
