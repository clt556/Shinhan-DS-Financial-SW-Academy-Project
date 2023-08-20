# 신한 DS  SW아카데미 1차 프로젝트 We go

SSO 로그인
![1](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/70a255d9-e64d-4cf1-8005-b671d7420267)



로그인 후 메인 화면
![2](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/16d6e576-8b91-4269-bf7d-002d8fbc1bc8)



마이페이지
![7](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/4d7b8aa1-889b-4b71-a863-f73c8a9dbac6)
![8](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/aa1b6d10-1d26-4995-916b-56b11f1459c4)



여행 계획 작성
![3](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/c82370c7-e96a-4934-b73d-0b27dfaff7f1)
![6](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/2def2557-e0f2-475f-8f6f-548b5c6399f2)
![localhost_main_plan_index do (2)](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/871e6a98-5f6a-4367-8ca3-df8ffd320f97)

본 서비스는 서비스에 가입한 회원들을 대상으로 특수한 결제 카드를 제공하고, 그 카드로 여행지에 가서 결제를 할 시,
실제 여행지에서 결제한 내역에 대해 포인트 혜택을 제공한다는 배경으로 기획되었다.
![localhost_main_plan_index do (3)](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/d664f9c2-7553-4ef9-9b79-808368932211)



작성한 여행 계획 보기 메뉴
![9](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/b2f0062f-63ba-4e31-a648-2a6332fdda78)
![10](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/d7941d85-d976-4021-aac6-6710fad0b4f3)



DB가 소실된 상태라서 실행은 불가능, 따라서 과거의 실행 기록들을 작성.

-------------------------------------------------------------------------------------------------------------------------
이 서비스는 여행 플래너 외 부가기능을 지닌 서비스로써, 서비스를 가입하면 제공하는 전용 카드로 여행 플래너에서 계획한 여행지에서 결제를 하고, 그 데이터가 서비스 내부에서 흘러서 자동으로 이용자에게 카드의 혜택으로써 포인트를 계산해서 적립해주는 서비스로 기획됨
=========================================================================================================================
=========================================================================================================================
사용 기술: jsp와 js로 프론트 엔드, Spring FrameWork를 통한 백엔드, DB 처리 쿼리를 작성하기 위해 Mybatis 사용
-------------------------------------------------------------------------------------------------------------------------

본인은 `작성한 여행 계획 보기 메뉴`를 구현하였음.
본 서비스에서 여행 계획을 세우면 상태는 3가지 중 하나임.

`예정 계획`, `종료된 계획`, `임시저장 계획`

예정 계획과 임시저장 계획은 계획을 수립하는 과정에서 어떤 버튼을 누르느냐에 따라 달라지며, 이는 계획 수립 파트를 담당한 '이창준' 팀원과 협의하여 해당 팀원의 controller에 임시 저장에 따른 forwarding을 

내가 작성한 controller의 임시저장 계획을 처리하도록 forwarding하는 controller 함수의 mappping url을 호출하도록 만들었음.

따라서 3가지 상태에 따라서 계획의 좌측 상단에 표시되는 카드바가 달리 표시됨.

한편 계획의 상태에 따라 추가적으로 진행할 수 있는 기능들이 다름.

임시 저장 계획, 예정된 계획의 경우 삭제하기, 수정하기를 수행할 수 있고
종료된 계획의 경우 한줄 평 쓰기, 전체 후기 작성하기를 수행할 수 있다.
해당 작업들은 스프링 프레임워크의 CRUD 작업들로써, 의존성을 위한 라이브러리 import (스프링 프레임워크이니 Maven의 dependency 태그를 사용)를 통해 DB 설정을 하고, DB와 api 통신을 함

--스프링 프레임워크의 DB 설정에 대한 복습--

Hikari CP 생성 -> MyBatis 연동으로 크게 작업을 이분할 수 있다.

1.Hikari Config : dependency로 의존성을 프로젝트에 형성하고, MVcConfig 파일을 config 폴더에 만들어 HikariDataSource 의존성으로부터 객체를 주입받아 DB에 연결하기 위해 jdbcurl, driverclassname, db의 username와 password를 설정함

2.SqlSessionFactory 의존성으로부터 객체를 주입받아 위에서 설정한 HikariDataSource 주입객체를 SqlSessionFactory 주입 객체의 datasource 값으로 설정

3. 2로부터 생성한 SqlSessionFactory 주입객체를 SqlSessionTemplate 의존성으로부터 주입받은 객체의 parameter로써 지정해서, 객체를 return
------------------------------------------------------------------------------------------------------------------------------------

또한 페이징 기능을 구현하였으며, 이 역시 api로 DB (MYSQL, Limit 문법을 사용해서 손쉽게 페이징 , CRUD의 R을 수행)에서 데이터를 가져옴
(화살표를 누르면 페이징 처리를 위한 상태를 api로 전달하고, api는 그 정보를 토대로 api를 요청하며, 따라서 mapper.xml 파일에 PreparedStatement를 사용하여 구현하였음)


예정된 계획을 종료된 계획 상태로 변경하려면, 상태를 변경해주고 관련 데이터를 DB로 넣어주는 추가 api가 필요한데, 이를 따로 구현함
(결제하는 api는 웹 서비스에서 사용자가 접근할 수 없도록 만들었음. 결제를 통해 데이터가 가공되고 흐르는 것은, 서비스 내부 전산에서 이루어지는 것이고, 사용자는 그저 카드를 긁으면 되기에, 카드를 긁어서 생기는 데이터를
  만들기 위해 유저가 계획한 여행지와 예산을 기반으로, 실 결제 데이터로 사용될 수치들을 만들어내는 인터페이스를 따로 창조하였고, 이는 url을 통해 접근해서 사용하도록 만들었음
)
![결제 인터페이스1](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/49853820-ccd8-462d-9822-23c193bfbe25)
![결제 인터페이스2](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/baf8dbbf-e356-4490-b8bf-1272cdf181a7)

-----------------------------아래가 위 인터페이스의 동작에 대한 코드-------------------------------------------
![image](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/5a6b83aa-457c-462e-bb5c-1b17276ada0d)
![image (1)](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/1fcfacc7-b54c-496c-a573-f4b2f79bd708)

![adsadsadsa](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/c620a4ca-e5e7-4da5-8219-b8634574e8d7)
![1차 프로젝트 - 임시](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/2c655dd1-3654-4326-8705-af6b5aaf0395)

--
처음에는 내 기록의 통계 파트를 맡기로 하였고, 거기에 대한 디자인을 해갔던 것
--
![프로젝트 처음에 맡은 파트 디자인해온거](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/70910cbb-60f2-4790-8b10-4c79900dc96f)

--
피그마 작업물
--
![Untitled](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/5836a05f-4920-413d-a239-ef375e6d0e91)
