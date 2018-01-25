package com.safewind.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.DocumentDao;
import com.safewind.pms.po.Document;
import com.safewind.pms.po.DocumentApply;
import com.safewind.pms.service.DocumentService;

@Service
public class DocumentServiceImpl implements DocumentService{
	@Autowired
	DocumentDao documentDao;
	
	@Override
	public void documentAdd(Document document) {
		documentDao.documentAdd(document);
	}

	@Override
	public List<Document> documentList() {
		return documentDao.documentList();
	}

	@Override
	public Document FindDocumentByid(int id) {
		return documentDao.FindDocumentByid(id);
	}

	@Override
	public void UpdateDocument(Document document) {
		documentDao.UpdateDocument(document);
	}

	@Override
	public void DeleteDocument(int document_id) {
		documentDao.DeleteDocument(document_id);
		
	}

	@Override
	public void documentApplyAdd(DocumentApply documentApply) {
		documentDao.documentApplyAdd(documentApply);
	}

	@Override
	public List<DocumentApply> documentApplyList() {
		return documentDao.documentApplyList();
	}

	@Override
	public DocumentApply FindDocumentApplyByid(int id) {
		return documentDao.FindDocumentApplyByid(id);
	}

	@Override
	public void UpdateDocumentApply(int i, int id, String content_check, String check_id) {
		documentDao.UpdateDocumentApply(i, id, content_check, check_id);
	}

}
