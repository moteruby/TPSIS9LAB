package com.emotionrecognition.EmotionRecognition.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.awt.*;
@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
}