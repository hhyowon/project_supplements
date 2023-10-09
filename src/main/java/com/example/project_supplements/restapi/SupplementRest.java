package com.example.project_supplements.restapi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.project_supplements.service.CommunityService;

@RestController
public class SupplementRest {
    @Autowired
    CommunityService communityService;

    // 댓글 작성 후 조회 API
    @PostMapping("/comment/{COMMUNITY_ID}")
    public ResponseEntity<Object> comment(@PathVariable("COMMUNITY_ID") String COMMUNITY_ID, @RequestBody Map<String, String> params) {
        params.put("COMMUNITY_ID", COMMUNITY_ID);
        Object result = communityService.insertAndSelectcomment(COMMUNITY_ID, params);
        return ResponseEntity.ok().body(result);
    }
}