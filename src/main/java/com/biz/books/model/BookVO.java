package com.biz.books.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookVO {
	private long b_id;
	private String b_userid; 
	private String b_isbn ;
	private String b_title ;
	private String b_date ;
	private float b_star ;
	private String b_text ;
	
	
}
