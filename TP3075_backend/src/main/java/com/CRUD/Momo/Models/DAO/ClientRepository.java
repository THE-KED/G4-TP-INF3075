package com.CRUD.Momo.Models.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CRUD.Momo.Models.Entitys.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {

}
