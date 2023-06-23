package kr.co.main.myRecord.accountBook;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AccountBookVO {
	int plan_pk;
	int category;
	String categoryName;
	long amount;
	String content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	Date usage_date;
}
