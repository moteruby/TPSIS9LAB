package com.emotionrecognition.EmotionRecognition.services;

import com.emotionrecognition.EmotionRecognition.models.Result;
import com.emotionrecognition.EmotionRecognition.models.User;
import com.emotionrecognition.EmotionRecognition.repositories.ResultRepository;
import com.emotionrecognition.EmotionRecognition.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ResultService {
    private final UserRepository userRepository;

    private final ResultRepository resultRepository;

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public List<Result> getByUser(User user) {
        return resultRepository.findAllByEmail(user.getEmail());
    }

}
