package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;



@Service
@Transactional
public class SignService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    @Autowired
    AuthsService authsService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
      
    //회원 가입
    public Object insert(Map dataMap) {
        String password = (String) dataMap.get("PASSWORD");
        dataMap.put("PASSWORD", bCryptPasswordEncoder.encode(password)); //비밀번호 암호화
        String sqlMapId = "Sign.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object insertWithAuths(Map dataMap){
        Object result = this.insert(dataMap);
        result = authsService.insert(dataMap);
        return result;
    }

    public Object selectByUID(Map dataMap) {
        String sqlMapId = "Sign.selectByUID";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object selectByUIDWithAuths(Map dataMap) {
         Map result = (Map) this.selectByUID(dataMap);
        result.putAll(authsService.selectWithUSERNAME(dataMap));
        return result;
    }


    //ID중복확인용
    public Map<String, Object> checkID(Map dataMap) {
        String sqlMapId = "Sign.checkID";    
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        Map<String, Object> response = new HashMap<>();
    
        if (result != null) {
            response.put("isDuplicate", true);
            response.put("message", "이미 사용 중인 아이디입니다.");
        } else {
            response.put("isDuplicate", false);
            response.put("message", "사용 가능한 아이디입니다.");
        }
    
        return response;
    }
}

