package com.CRUD.Momo.Models.DAO;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.CRUD.Momo.Models.Entitys.Client;

@Repository
public class ClientRepoImpl implements ClientRepoCustom{

	@Autowired
	private ClientRepository repo;
	
	@Autowired
	private EntityManager Em;
	
	@Override
	public Optional<Client> findById(int id) {
		
		return repo.findById(id);
	}

	@Override
	public boolean checkByNum(String num) {
		
		String jpql = "SELECT e FROM Client e WHERE e.Numero = :num";
		Query query = Em.createQuery(jpql);
		query.setParameter("num", num);
		try {
			query.getSingleResult();
			return true;
		} catch (NonUniqueResultException e) {
			// TODO: handle exception
			return true;
		} catch (NoResultException e) {
			
			return false;
		}
	}

	@Override
	public boolean checkByid(int id) {
		
		try {
			return repo.existsById(id);
		} catch (IllegalArgumentException e) {
			
			return false;
		}
				
	}

	@Override
	public Client findByNum(String num) {
		
		String jpql = "SELECT e FROM Client e WHERE e.Numero = :num";
		Query query = Em.createQuery(jpql);
		query.setParameter("num", num);
		return (Client) query.getSingleResult();
	}

	@Override
	public boolean save(Client client) {
		try {
				repo.save(client);
				return true;
			}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("$$$$$$$$$$$$$$$$$$$");
			System.out.println(e);
			
			return false;
		}
	}

	@Override
	public boolean delete(int id) {
		
		repo.deleteById(id);
		return !repo.existsById(id);
	}

	@Override
	public List<Client> findAll() {

		return repo.findAll();
	}

	@Override
	public boolean delete(List<Integer> ids) {

		repo.deleteAllById(ids);
		return !repo.existsById(ids.get(0));
	}
	
}
