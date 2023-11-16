package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.entity.AdvisorBoardEntity;
import com.green.greenstock.repository.entity.AdvisorEntity;

public interface AdvisorBoardEntityRepository extends JpaRepository<AdvisorBoardEntity, Integer> {

    AdvisorBoardEntity findByAdvisorBoardId(int advisorBoardId);

    Page<AdvisorBoardEntity> findByAdvisorEntityAndParent(AdvisorEntity advisorEntity, int parent, Pageable pageable);

    Page<AdvisorBoardEntity> findByParent(int parent, Pageable pageable);

    List<AdvisorBoardEntity> findByParent(int parent);
}
