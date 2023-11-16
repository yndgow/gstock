package com.green.greenstock.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.interfaces.UserRepository;
import com.green.greenstock.repository.model.User;

@EnableScheduling
@Service
public class SuspensionService {
    @Autowired
    private UserRepository userRepository;

    @Scheduled(fixedRate = 24 * 60 * 60 * 1000) // 매일 실행 (24시간 간격)
    public void checkAndReleaseSuspensions() {
        List<User> suspendedUsers = userRepository.findBySuspended(true);
        Date currentDate = new Date();
        for (User user : suspendedUsers) {
            if (user.getSuspensionEndDate().before(currentDate)) {
                // 정지 기간이 만료된 경우 정지 상태 해제
                user.setSuspended(false);
                user.setSuspensionEndDate(null);
                userRepository.modifyUserInfo(user);
            }
        }
    }
    
    public void suspendUser(String userName, int suspendedDate) {
        User user = userRepository.findUserName(userName);
        if (user == null) {
           throw new CustomRestfulException("잘못된 요청입니다.", HttpStatus.BAD_REQUEST);
        }
        
        Date currentDate = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        
        calendar.add(Calendar.DAY_OF_MONTH, suspendedDate);
        
        Date suspendedEndDate = calendar.getTime();
        
        user.setSuspended(true);
        user.setSuspensionEndDate(suspendedEndDate);
        userRepository.modifyUserInfo(user);
    }

    public void unsuspendUser(String userName) {
        User user = userRepository.findUserName(userName);
        if (user != null) {
            user.setSuspended(false);
            userRepository.modifyUserInfo(user);
        }
    }

}
