package com.CRUD.Momo.Services.Rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CRUD.Momo.Models.DAO.AccountData;
import com.CRUD.Momo.Models.DAO.AccountRepoImpl;
import com.CRUD.Momo.Models.DAO.ClientRepoImpl;
import com.CRUD.Momo.Models.Entitys.Account;

@RestController
@RequestMapping(path = "/Account")
public class AccountRestService {

	@Autowired
	private AccountRepoImpl repo;
	
	@Autowired
	private ClientRepoImpl clirepo;
	
	
	@PostMapping(path = "/save")
	public AccountData Save(@RequestBody(required = true) AccountData data) {
		
		AccountData result;
		Account acc = new Account(data);
		if(acc.getClient()!=null) {
			if(clirepo.checkByid(data.getIdClient()))
				repo.delete(repo.findByIdClient(data.getIdClient()).getIdClient());
		}
			try {
			result = new AccountData(repo.save(acc));
			acc.getClient().setId(data.getIdClient());
			return result;
			}
			catch (Exception e) {
				// TODO: handle exception
				return null;
			}
	}
	
	@GetMapping(path = "/all")
	public List<AccountData> getAll() {
		
		return repo.findAll();
	}
	
	@GetMapping(path = "/id")
	public AccountData getById(@RequestParam(required = true) int id) {
		return repo.findById(id);
		
	}
	
	@GetMapping(path = "/num")
	public AccountData getByNum(@RequestParam(required = true) String num) {
		return repo.findByNumClient(num);
		
	}
	@DeleteMapping(path = "/id")
	public boolean delete(@RequestParam(required = true) int id) {
		return repo.delete(id);
	}
	
	@GetMapping(path = "/checknum")
	public boolean checknum(@RequestParam(required = true) String num) {
		return clirepo.checkByNum(num);
	}
	
	
}
