package com.EIE.demo.dao;

import com.EIE.demo.model.DocImport;
import com.EIE.demo.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DocNotifRepository extends JpaRepository<DocImport, Integer> {

    @Query("from DocImport where typeaut=:type")
    DocImport getDocImportByType(String type);
}
