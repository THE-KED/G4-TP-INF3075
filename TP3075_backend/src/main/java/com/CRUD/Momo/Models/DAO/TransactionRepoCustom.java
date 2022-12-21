package com.CRUD.Momo.Models.DAO;

import java.util.List;
import java.util.Optional;

import com.CRUD.Momo.Models.Entitys.Transaction;

public interface TransactionRepoCustom {

	Optional<Transaction> findById(int id);
	
	List<TransactionData> findMyTransaction(String num);
	
	List<Transaction> findAll();
	
	boolean save(Transaction transaction);
	
	boolean delete(int id);
	
	boolean delete(List<Integer> ids);
}
