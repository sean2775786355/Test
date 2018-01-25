package com.safewind.pms.service;

import java.util.List;

import com.safewind.pms.po.Document;
import com.safewind.pms.po.DocumentApply;

public interface DocumentService {
    public void documentAdd(Document document);
    
    public List<Document> documentList();
    
    public Document FindDocumentByid(int id);
    
    public void UpdateDocument(Document document);

    public void DeleteDocument(int document_id);
    
    public void documentApplyAdd(DocumentApply documentApply);
    
    public List<DocumentApply> documentApplyList();
    
    public DocumentApply FindDocumentApplyByid(int id);
    
    public void UpdateDocumentApply(int i,int id,String content_check,String check_id);
}
