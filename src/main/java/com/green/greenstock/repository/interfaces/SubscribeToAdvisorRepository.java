package com.green.greenstock.repository.interfaces;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.repository.model.SubscribeToAdvisor;

@Mapper
public interface SubscribeToAdvisorRepository {
    SubscribeToAdvisor findByAdvisorIdAndUserId(@Param("advisorId") int advisorId, @Param("userId") int userId);
}
