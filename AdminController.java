package com.emotionrecognition.EmotionRecognition.controllers;


import com.emotionrecognition.EmotionRecognition.models.User;
import com.emotionrecognition.EmotionRecognition.models.enums.Role;
import com.emotionrecognition.EmotionRecognition.services.ResultService;
import com.emotionrecognition.EmotionRecognition.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Map;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    private final ResultService resultService;

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String userDelete(@PathVariable("id") Long id){
        userService.deleteUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }

    @GetMapping("/user/{userId}")
    public ModelAndView viewUserInfo(@PathVariable Long userId, Principal principal) {
        ModelAndView modelAndView = new ModelAndView("user-info");
        Optional<User> optionalUser = userService.getUserById(userId);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            modelAndView.addObject("results", resultService.getByUser(user));
            modelAndView.addObject("user", user);
        } else {
            modelAndView.setViewName("user-not-found");
        }
        return modelAndView;
    }


}