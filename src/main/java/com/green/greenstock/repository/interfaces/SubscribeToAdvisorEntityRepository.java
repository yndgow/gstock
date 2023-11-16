package com.green.greenstock.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.SubscribeToAdvisorEntity;
import com.green.greenstock.repository.entity.UserEntity;

public interface SubscribeToAdvisorEntityRepository extends JpaRepository<SubscribeToAdvisorEntity, Integer> {
    SubscribeToAdvisorEntity findByAdvisorEntityAndUserEntity(AdvisorEntity advisorEntity, UserEntity userEntity);
}
