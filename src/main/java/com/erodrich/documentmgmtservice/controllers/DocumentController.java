package com.erodrich.documentmgmtservice.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.erodrich.documentmgmtservice.beans.DocumentBean;
import com.erodrich.documentmgmtservice.services.DocumentService;

@RestController
@RequestMapping("/document")
public class DocumentController {
	
	private DocumentService documentService;
	
	@Autowired
	public DocumentController(DocumentService theDocumentService) {
		this.documentService = theDocumentService;
	}

	@RequestMapping(value ="/{id}", method = RequestMethod.GET)
	public DocumentBean getById(@PathVariable String id) {
		return documentService.getById(id);
	}
}
