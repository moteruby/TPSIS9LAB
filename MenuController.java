package com.emotionrecognition.EmotionRecognition.controllers;

import com.emotionrecognition.EmotionRecognition.services.ResultService;
import com.emotionrecognition.EmotionRecognition.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class MenuController {

    private final ResultService resultService;

    private final UserService userService;

    @GetMapping("/settings")
    public String settings() {
        return "settings";
    }

    @GetMapping("/main")
    public String mainMenu(Principal principal, Model model) {
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        return "main";
    }

    @GetMapping("/contact-info")
    public String contactInfo() {
        return "contact_info";
    }

    @GetMapping("/new_images")
    public String viewResults(Principal principal, Model model) {
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        return "newimagesforrecognition";
    }

    @GetMapping("/acc")
    public String acc(Principal principal, Model model) {
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        model.addAttribute("results", resultService.getByUser(userService.getUserByPrincipal(principal)));
        return "user-info";
    }

}
