package com.kh.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@NoArgsConstructor@AllArgsConstructor
public class FilesDto {
	private Integer no,shop_code,category_code,review_code,oneandone_code;
	private String file_type,work_type,upload_name,save_name;
	private long size;
	private String regist_date,edit_date;
}
