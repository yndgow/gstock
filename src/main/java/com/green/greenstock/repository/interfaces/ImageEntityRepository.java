package com.green.greenstock.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.entity.ImageEntity;

public interface ImageEntityRepository extends JpaRepository<ImageEntity, Integer>{
    
}
