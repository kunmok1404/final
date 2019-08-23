package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@NoArgsConstructor@AllArgsConstructor
public class FilesDto {
	private int no; // 파일번호
	private String file_type,upload_name,save_name;
	private long file_size;
	private String regist_date,edit_date;
}
