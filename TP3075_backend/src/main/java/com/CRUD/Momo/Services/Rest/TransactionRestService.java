package com.CRUD.Momo.Services.Rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CRUD.Momo.Models.DAO.AccountRepoImpl;
import com.CRUD.Momo.Models.DAO.TransactionData;
import com.CRUD.Momo.Models.DAO.TransactionRepoImpl;
import com.CRUD.Momo.Models.Entitys.Account;
import com.CRUD.Momo.Models.Entitys.Transaction;

@RestController
@RequestMapping(path = "/Transaction")
public class TransactionRestService {

	@Autowired
	private TransactionRepoImpl repo;
	
	@Autowired
	private AccountRepoImpl accrepo;
	
	
	
	
	
	@PostMapping(path = "/trans")
	public boolean transaction(
			@RequestParam(required = true) String num1, 
			@RequestParam(required = true) float balance, 
			@RequestParam(required = true) String num2,
			@RequestParam(required = true) boolean type,
			@RequestParam(required = false) String Description){
		
		if(type) {
			
			Account send = new Account(accrepo.findByNumClient(num1));
			
			Account receve = new Account(accrepo.findByNumClient(num2));
						
			if(send.getBalance()>=balance) {
				Transaction T = new Transaction();
				T.setEnvoyeur(send);
				T.setReceptionneur(receve);
				T.setType(type);
				T.setMontant(balance);
				T.setDescription(Description);

				send.retrait(balance);
				receve.depos(balance);
				
				
				accrepo.save(send);
				accrepo.save(receve);
				
				repo.save(T);
				
				return true;
			}
			else {
				return false;
			}
		}
		
		
		return false;
		
	}
	
	
	@GetMapping(path = "/historique")
	public List<TransactionData> historique(@RequestParam(required = true) String num){
		
		return repo.findMyTransaction(num);
		
	}
}
