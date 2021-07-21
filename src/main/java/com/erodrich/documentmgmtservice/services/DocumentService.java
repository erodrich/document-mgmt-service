package com.erodrich.documentmgmtservice.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.erodrich.documentmgmtservice.DocumentMapper;
import com.erodrich.documentmgmtservice.beans.DocumentBean;
import com.erodrich.documentmgmtservice.beans.PublicApiStruct;

import reactor.core.publisher.Mono;

@Service
public class DocumentService {
	
	@Value("${app.public-api-path:public-api-path/%1$s}")
	private String path;
	
	@Autowired
	WebClient webClient;

	public DocumentBean getById(String id) {
		String actualPath = String.format(path, id);
		PublicApiStruct response = webClient.get()
		.uri(actualPath)
		.retrieve()
		.bodyToMono(PublicApiStruct.class)
		.block();
		
		return DocumentMapper.mapToDocumentBean(response);
		
	}

}
