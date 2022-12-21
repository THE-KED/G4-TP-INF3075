package com.CRUD.Momo.Models.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CRUD.Momo.Models.Entitys.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction,Integer>{

}
