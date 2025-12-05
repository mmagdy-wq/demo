package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.Map;


@RestController
@RequestMapping("/api")
public class TestController {


    // Simple GET test endpoint: GET /api/test
    @GetMapping("/test")
    public ResponseEntity<Map<String, String>> testGet() {
        return ResponseEntity.ok(Map.of("status", "ok", "message", "pong"));
    }
}