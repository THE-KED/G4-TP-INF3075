package com.CRUD.Momo.Models.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.CRUD.Momo.Models.Entitys.Transaction;

@Repository
public class TransactionRepoImpl implements TransactionRepoCustom {
	
	@Autowired
	private TransactionRepository repo;
	
	@Autowired
	private EntityManager Em;

	@Override
	public Optional<Transaction> findById(int id) {
		// TODO Auto-generated method stub
		return repo.findById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TransactionData> findMyTransaction(String num) {
		// TODO Auto-generated method stub
		List<TransactionData>datas = new ArrayList<TransactionData>();
		
		String jpql = "SELECT T FROM Transaction T JOIN T.Envoyeur E JOIN E.Client cli WHERE cli.Numero = :num and T.Type = true";
		Query query = Em.createQuery(jpql);
		query.setParameter("num", num);
		List<Transaction> Historique = (List<Transaction>) query.getResultList();
		
		for (Transaction T : Historique) {
			datas.add(new TransactionData(T));
		}
		
		
		

		return datas;
		
	}

	@Override
	public List<Transaction> findAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public boolean save(Transaction transaction) {
		// TODO Auto-generated method stub
		repo.save(transaction);
		if(repo.findById(transaction.getId()).get()==transaction)
			return true;
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		
		repo.deleteById(id);
		return !repo.existsById(id);

	}

	@Override
	public boolean delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		repo.deleteAllById(ids);
		return !repo.existsById(ids.get(0));
	}

}
