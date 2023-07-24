package com.example.project_supplements.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.context.annotation.Configuration;

@Configuration
public class Commons {
    public String generateUUID(){
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

    public String getGeneratorID() {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyyhh:mm:ss");
        String strDate = formatter.format(date);
        return strDate;
    }
}
