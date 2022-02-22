package com.EIE.demo.dao;

import com.EIE.demo.model.Entreprise;
import com.EIE.demo.model.Entreprise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface EntrepriseRepo extends JpaRepository<Entreprise,Integer> {


    @Query(value = "SELECT * from entreprise_val_ou_trait where num_patente like ?1",nativeQuery = true)
    Entreprise checkpatente(String val);

    @Query(nativeQuery = true,value = "select * from entreprise_val_ou_trait where id_notification=:id ")
    Entreprise findentrepriseByIdNotif(int id);


    @Query(value = "select count(id) from entreprise_val_ou_trait where id_notification = ?1",nativeQuery = true)
    int cntentrprs(int id_notification);

    @Transactional
    @Modifying
    @Query(value = "update entreprise_val_ou_trait set " +
            "adresse =:adresse, " +
            "nom_installation=:nom_installation, " +
            "num_patente=:num_patente, " +
            "telephone=:telephone " +
            "where id_notification=:id_notification",nativeQuery = true)
    void updateentrprs(String adresse, int id_notification, String nom_installation, String num_patente, String telephone);



    @Query(value = "select * from entreprise where id_notification = ?1",nativeQuery = true)
    Entreprise getid(int id);


    @Query(value = "SELECT e.* from entreprise_val_ou_trait e left join notification n on e.id_notification = n.id where n.num_notification like ?1",nativeQuery = true)
    Entreprise findbynotif(String val);
}
