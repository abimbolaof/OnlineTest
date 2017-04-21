package com.pm.onlinetest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pm.onlinetest.domain.User;
import com.pm.onlinetest.repository.UserRepository;
import com.pm.onlinetest.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository userRepository;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
  	public void save(User user) {

  		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();   		
  		String encodedPassword = passwordEncoder.encode(user.getPassword());
  		user.setPassword(encodedPassword);
  		
  		userRepository.save(user);
	}

	@Override
	public List<User> findAll() {	
		return (List<User>) userRepository.findAll();
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}
}