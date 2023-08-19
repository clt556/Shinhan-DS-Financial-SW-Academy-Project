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
![localhost_main_plan_index do (3)](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/d664f9c2-7553-4ef9-9b79-808368932211)



작성한 여행 계획 보기 메뉴
![9](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/b2f0062f-63ba-4e31-a648-2a6332fdda78)
![10](https://github.com/clt556/Shinhan-DS-Financial-SW-Academy-Project/assets/116059720/d7941d85-d976-4021-aac6-6710fad0b4f3)



DB가 소실된 상태라서 실행은 불가능, 따라서 과거의 실행 기록들을 작성.

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
Hikari CP 생성 -> MyBatis 연동
1.Hikari Config : dependency로 의존성을 프로젝트에 형성하고, MVcConfig 파일을 config 폴더에 만들어 HikariDataSource 의존성으로부터 객체를 주입받아 DB에 연결하기 위해 jdbcurl, driverclassname, db의 username와 password를 설정함

2.SqlSessionFactory 의존성으로부터 객체를 주입받아 위에서 설정한 HikariDataSource 주입객체를 SqlSessionFactory 주입 객체의 datasource 값으로 설정

3. 2로부터 생성한 SqlSessionFactory 주입객체를 SqlSessionTemplate 의존성으로부터 주입받은 객체의 parameter로써 지정해서, 객체를 return
------------------------------------------------------------------------------------------------------------------------------------

또한 페이징 기능을 구현하였으며, 이 역시 api로 DB (MYSQL, Limit 문법을 사용해서 손쉽게 페이징 , CRUD의 R을 수행)에서 데이터를 가져옴
(화살표를 누르면 페이징 처리를 위한 상태를 api로 전달하고, api는 그 정보를 토대로 api를 요청하며, 따라서 mapper.xml 파일에 PreparedStatement를 사용하여 구현하였음)


