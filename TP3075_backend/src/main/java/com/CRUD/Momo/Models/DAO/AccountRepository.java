package com.CRUD.Momo.Models.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CRUD.Momo.Models.Entitys.Account;

public interface AccountRepository extends JpaRepository<Account, Integer> {

}
