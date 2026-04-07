/*
    SGK 계정 생성 후 
    + 버튼 클릭 후
    이름        : HTH_Teacher
    사용자 이름 : hth
    비밀번호    : 1234
    호스트이름  : 접속할 IP주소(192.168.0.146) - cmd: ipconfig
    포트        : 1521
    SID         : xe
*/

INSERT INTO MYCLASS
 VALUES (2, '석가경', '010-9388-7184', 'seok9388@naver.com', SYSDATE);
 COMMIT;
 
 SELECT * FROM MYCLASS
  ORDER BY 번호 ASC;
  