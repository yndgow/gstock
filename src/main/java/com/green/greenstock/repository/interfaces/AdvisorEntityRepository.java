package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.UserEntity;

public interface AdvisorEntityRepository extends JpaRepository<AdvisorEntity, Integer> {

    List<AdvisorEntity> findByStatus(int status);

    AdvisorEntity findByAdvisorNickName(String advisorNickName);

    AdvisorEntity findByAdvisorId(int advisorId);

    AdvisorEntity findByUserEntity(UserEntity userEntity);

    

}
