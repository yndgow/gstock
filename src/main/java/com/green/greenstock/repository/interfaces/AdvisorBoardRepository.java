package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.repository.model.AdvisorBoard;

@Mapper
public interface AdvisorBoardRepository {

    AdvisorBoard findById(int id);

    List<AdvisorBoard> findAll();

    // 다음글
    AdvisorBoard findNextBoard(@Param("advisorId") int advisorId, @Param("dateTime") String dateTime);

    // 이전글
    AdvisorBoard findPrevBoard(@Param("advisorId") int advisorId, @Param("dateTime") String dateTime);
}
