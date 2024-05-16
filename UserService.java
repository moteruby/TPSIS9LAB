package com.emotionrecognition.EmotionRecognition.services;

import com.emotionrecognition.EmotionRecognition.models.User;
import com.emotionrecognition.EmotionRecognition.models.enums.Role;
import com.emotionrecognition.EmotionRecognition.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
//
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public boolean createUser(User user) {
        String email = user.getEmail();
        String phone = user.getPhoneNumber();
        if (userRepository.findByEmail(email) != null) return false;
        if (userRepository.findByPhoneNumber((phone)) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        userRepository.save(user);
        return true;
    }

    public Optional<User> getUserById(Long UserId){
        Optional<User> user = userRepository.findById(UserId);
        return user;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
            } else {
                user.setActive(true);
            }
        }
        userRepository.save(user);
    }

    public void toggleUserStatus(Long id) {
        userRepository.findById(id).ifPresent(user -> {
            user.setActive(!user.isActive());
            userRepository.save(user);
        });
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public void deleteUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        userRepository.delete(user);
    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void updateUserRoles(User user, Map<String, String> form) {
        user.getRoles().clear();
        form.keySet().stream()
                .filter(key -> Arrays.stream(Role.values()).anyMatch(role -> role.name().equals(key)))
                .map(Role::valueOf)
                .forEach(user.getRoles()::add);
        userRepository.save(user);
    }

    public void activateUser(Long id) {
        userRepository.findById(id).ifPresent(user -> {
            user.setActive(true);
            userRepository.save(user);
        });
    }

    public List<User> getActiveUsers() {
        return userRepository.findAll().stream()
                .filter(User::isActive)
                .collect(Collectors.toList());
    }

    public void updateUserInfo(Long id, String email, String phoneNumber, String name) {
        userRepository.findById(id).ifPresent(user -> {
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setName(name);
            userRepository.save(user);
        });
    }

    public void updateUserRolesSRP(User user, Map<String, String> form) {
        Set<Role> rolesToUpdate = extractValidRoles(form);
        setUserRoles(user, rolesToUpdate);
        userRepository.save(user);
    }

    private Set<Role> extractValidRoles(Map<String, String> form) {
        return form.keySet().stream()
                .filter(this::isValidRole)
                .map(Role::valueOf)
                .collect(Collectors.toSet());
    }

    private boolean isValidRole(String role) {
        return Arrays.stream(Role.values())
                .anyMatch(validRole -> validRole.name().equals(role));
    }

    private void setUserRoles(User user, Set<Role> roles) {
        user.getRoles().clear();
        user.getRoles().addAll(roles);
    }

    public boolean isEmailOrPhoneNumberExists(String email, String phoneNumber) {
        return userRepository.findByEmail(email) != null || userRepository.findByPhoneNumber(phoneNumber) != null;
    }
}