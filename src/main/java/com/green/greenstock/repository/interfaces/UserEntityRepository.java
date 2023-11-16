package com.green.greenstock.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.greenstock.repository.entity.UserEntity;

public interface UserEntityRepository extends JpaRepository<UserEntity, Integer>{
    
}
