package kr.co.main.first;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface FirstMapper {
	int checkNick(String nickName);
}
