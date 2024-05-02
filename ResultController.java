package com.emotionrecognition.EmotionRecognition.controllers;


import com.emotionrecognition.EmotionRecognition.models.Result;
import com.emotionrecognition.EmotionRecognition.models.User;
import com.emotionrecognition.EmotionRecognition.repositories.ResultRepository;
import com.emotionrecognition.EmotionRecognition.services.ResultService;
import com.emotionrecognition.EmotionRecognition.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class ResultController {

    private final ResultService resultService;

    private final UserService userService;
    private final ResultRepository resultRepository;

    @GetMapping("/results")
    public String results(User user, Model model) {
        model.addAttribute("results", resultRepository.findResultsByUser(user));
        model.addAttribute("user", user);
        return "results";
    }

    @GetMapping("/result/delete/{resultId}")
    public String deleteResult(@PathVariable("resultId") Long resultId, Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        resultRepository.deleteById(resultId);
        model.addAttribute("results", resultRepository.findResultsByUser(user));
        model.addAttribute("user", user);
        return "results";
    }

    @GetMapping("/result/view/${resultId}")
    public String viewResults(@PathVariable("resultId") Long resultId, Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("result", resultRepository.findById(resultId));
        model.addAttribute("user", user);
        return "viewresults";
    }

    @PostMapping("/downl")
    public String createProduct(@RequestParam("images") MultipartFile image,Principal principal) throws IOException
    {
        User user = userService.getUserByPrincipal(principal);
        if(!(resultService.isAcceptableImage(image))){
            return "newimagesforrecognition";
        }
        String result = resultService.recognizeEmotions(image);
        resultService.saveResultToDB(user, image, result);
        return "redirect:/";
    }

}
