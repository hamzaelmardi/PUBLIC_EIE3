package com.EIE.demo.dao;

import com.EIE.demo.model.DocumentDechetND;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DocumentRepository extends JpaRepository <DocumentDechetND,Integer> {
    @Query("from DocumentDechetND ")
    public DocumentDechetND getDocumentDechetND();
}
