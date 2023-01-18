package com.CRUD.Momo.Model.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.CRUD.Momo.Models.DAO.AccountRepoImpl;
import com.CRUD.Momo.Models.DAO.TransactionRepoImpl;
import com.CRUD.Momo.Models.Entitys.Account;
import com.CRUD.Momo.Models.Entitys.Transaction;

@SpringBootTest
public class TransactionRepoImplTest {

    @Autowired
    TransactionRepoImpl repoImpl;

    @Autowired
    AccountRepoImpl accountRepo;

    @Test
    @Disabled
    void findByIdTest () {

        Assertions.assertNotNull( repoImpl.findById(1) );

        Assertions.assertNull ( repoImpl.findById(-1) );
    }

    @Test
    @Disabled
    void findMyTransactionTest () {

        Assertions.assertNotNull( repoImpl.findMyTransaction("num") );

        Assertions.assertNull( repoImpl.findMyTransaction("Nothing") );


    }

    @Test
    @Disabled
    void saveTest () {

        Account sender = new Account( accountRepo.findById(3) );
        Account receiver = new Account( accountRepo.findById(5) );
        Transaction transaction = new Transaction(null,"withdrawal",LocalDate.now() , 50000 , sender , receiver , true );

        Assertions.assertTrue ( repoImpl.save( transaction ) );

        Assertions.assertFalse( repoImpl.save( null ) );

    }
    
    @Test
    @Disabled
    void findAllTest () {

        Assertions.assertNull( repoImpl.findAll() );
    }

    @Test
    @Disabled
    void findAllTestWhenNotEmpty () {

        Assertions.assertNotNull ( repoImpl.findAll() );
    }

    @Test 
    @Disabled
    void deleteTest () {

        Assertions.assertFalse ( repoImpl.delete(-1) );
        
        Assertions.assertTrue( repoImpl.delete(2) );

        List<Integer> list = null;

        Assertions.assertFalse ( repoImpl.delete(list) );

        list = new ArrayList<>();
        list.add(2);
        list.add(3);
        list.add(5);

        Assertions.assertTrue ( repoImpl.delete( list ) );
        
    }

    
    
}
