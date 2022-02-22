package com.EIE.demo.dao;

import com.EIE.demo.model.Entreprise;
import com.EIE.demo.model.ImportateurNotifiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
public interface ImportateurNotifiantRepo extends JpaRepository<ImportateurNotifiant,Integer> {

    @Query(value = "select im from ImportateurNotifiant im where im.notification_id=?1")
    ImportateurNotifiant getid(String id_notification);
}
