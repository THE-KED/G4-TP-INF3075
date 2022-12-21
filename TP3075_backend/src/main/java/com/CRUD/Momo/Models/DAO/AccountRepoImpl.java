package com.CRUD.Momo.Models.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.CRUD.Momo.Models.Entitys.Account;

@Repository
public class AccountRepoImpl implements AccountRepoCustom{

	@Autowired
	private AccountRepository repo;
	
	@Autowired
	private EntityManager Em;
	
	@Override
	public AccountData findByIdClient(int id) {
		// TODO Auto-generated method stub
		
		String jpql = "SELECT acc FROM Account acc JOIN acc.Client cli WHERE cli.Id = :id";
		Query query = Em.createQuery(jpql);
		query.setParameter("id", id);
		
		Account acc = (Account) query.getSingleResult();
		if (acc == null)
			return null;
		
		return new AccountData(acc);
	}

	@Override
	public AccountData findById(int id) {
		// TODO Auto-generated method stub
		try {
			return new AccountData(repo.findById(id).get());
			
		} catch (NoSuchElementException e) {
			
			return null;
		}

	}

	@Override
	public AccountData findByNumClient(String num) {
		// TODO Auto-generated method stub
		String jpql = "SELECT acc FROM Account acc JOIN acc.Client cli WHERE cli.Numero = :num";
		Query query = Em.createQuery(jpql);
		query.setParameter("num", num);
		
		try {
			Account acc = (Account) query.getSingleResult();
			if (acc == null)
				return null;
			
			return new AccountData(acc);
		} catch (NonUniqueResultException e) {
			// TODO: handle exception
			return new AccountData((Account) query.getResultList().get(0));
		}catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}

	}

	@Override
	public Account save(Account account) {
		// TODO Auto-generated method stub
		try {
			return repo.save(account);
				
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		try {
			repo.deleteById(id);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<AccountData> findAll() {
		// TODO Auto-generated method stub
		List<Account> accs = repo.findAll();
		List<AccountData> Accdatas = new ArrayList<AccountData>();
		
		for (Account acc : accs) {
			Accdatas.add(new AccountData(acc));
		}
		
			
		return Accdatas;
	}

	@Override
	public boolean delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		repo.deleteAllById(ids);
		return !repo.existsById(ids.get(0));
	}

	@Override
	public boolean check(int id) {
		// TODO Auto-generated method stub
		
		try {
			return repo.existsById(id);
		} catch (IllegalArgumentException e) {
			
			return false;
		}
	}

	@Override
	public boolean insert(Account acc) {
		// TODO Auto-generated method stub
		return false;
	}

}
