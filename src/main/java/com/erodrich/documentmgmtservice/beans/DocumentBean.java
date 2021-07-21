package com.erodrich.documentmgmtservice.beans;

import lombok.Data;

@Data
public class DocumentBean {

	private Integer id;
	private String name;
	private String description;
	private String url;
}
