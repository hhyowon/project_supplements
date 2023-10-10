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

    public Object checkID(Map<String, String> dataMap) {
        // 데이터베이스에서 아이디 중복 확인 로직을 수행하여 결과를 반환
        // 중복된 아이디가 있으면 아이디를 반환하고, 없으면 스페이스(" ") 문자열 반환하도록 구현
    
        // 예시: 여기에서 데이터베이스 쿼리를 실행하여 중복 확인을 수행
        // userId가 이미 존재하는지 확인하는 쿼리를 실행하고 결과를 받기
        String sqlMapId = "Sign.checkID";
    
        // 실제로 데이터베이스 쿼리를 실행하고 결과를 받아옵니다.
        String result = (String) sharedDao.getOne(sqlMapId, dataMap);

    
        // 결과가 null인 경우 스페이스(" ") 반환
        return result != null ? result : " ";
    }
    

}