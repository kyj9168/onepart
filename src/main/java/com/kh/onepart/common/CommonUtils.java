package com.kh.onepart.common;

import java.util.UUID;

public class CommonUtils {

   public static String getRandomString() {

      //32비트의 랜덤 문자를 생성해줌(제거할문자, 어떻게 제거)
      return UUID.randomUUID().toString().replaceAll("-", "");

   }
}