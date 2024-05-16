package com.emotionrecognition.EmotionRecognition.repositories;

import com.emotionrecognition.EmotionRecognition.models.Result;
import com.emotionrecognition.EmotionRecognition.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findResultsByUser(User user);

    List<Result> findAllByEmail(String email);
}
