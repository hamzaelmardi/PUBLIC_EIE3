package com.EIE.demo.dao;

import com.EIE.demo.model.DocImport;
import com.EIE.demo.model.Notification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {


    @Query("from Notification where id_notification=:idNotif")
    Notification getbyid(int idNotif);
    
    @Query("from DocImport where typeaut=:type")
    DocImport getDocimportbyType(String type);

	
}


