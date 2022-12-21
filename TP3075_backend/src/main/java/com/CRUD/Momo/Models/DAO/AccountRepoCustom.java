package com.CRUD.Momo.Models.DAO;

import java.util.List;

import com.CRUD.Momo.Models.Entitys.Account;

public interface AccountRepoCustom {
	
	AccountData findByIdClient(int id);
	
	AccountData findById(int id);
	
	AccountData findByNumClient(String num);
	
	boolean insert(Account acc);
	
	boolean check(int id);
	
	Account save(Account account);
	
	boolean delete(int id);
	
	List<AccountData> findAll();
	
	boolean delete(List<Integer> ids);
}
