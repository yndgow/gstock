package com.green.greenstock.repository.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Entity
@Table(name = "user_tb")
@Data
@AllArgsConstructor
@Builder
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String userName;
	private String password;
	private String email;
	private String tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private Timestamp regDate;
	private Integer roletypeId;
	private boolean suspended;
	private Date suspensionEndDate;

	public UserEntity() {
		this.suspended = false;
	}

	@OneToMany(mappedBy = "userEntity")
	private List<AdvisorBoardEntity> advisorBoards;

}