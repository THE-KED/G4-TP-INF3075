package com.CRUD.Momo.Models.DAO;

import java.util.List;
import java.util.Optional;

import com.CRUD.Momo.Models.Entitys.Client;

public interface ClientRepoCustom {

	
	Optional<Client> findById(int id);
	
	boolean checkByNum(String num);
	
	boolean checkByid(int id);
	
	Client findByNum(String num);
		
	boolean save(Client client);
	
	boolean delete(int id);
	
	List<Client> findAll();
	
	boolean delete(List<Integer> ids);
		
}
