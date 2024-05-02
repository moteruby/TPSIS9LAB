package com.emotionrecognition.EmotionRecognition.controllers;

import com.emotionrecognition.EmotionRecognition.models.User;
import com.emotionrecognition.EmotionRecognition.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @GetMapping("/")
    public String mainMenu() {
        return "main";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (user.getEmail() == null || user.getPassword() == null) {
            return "registration";
        }

        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с таким номером/email уже существует");
            return "registration";
        }
        return "redirect:/login";
    }
}