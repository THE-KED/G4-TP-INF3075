package com.CRUD.Momo.Model.Dao;


import java.time.LocalDate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.CRUD.Momo.Models.DAO.AccountRepoImpl;
import com.CRUD.Momo.Models.DAO.ClientRepoImpl;
import com.CRUD.Momo.Models.Entitys.Account;
import com.CRUD.Momo.Models.Entitys.Client;


@SpringBootTest

public class AccountRepoImplTest {

    @Autowired
    AccountRepoImpl repo;

    @Autowired
    ClientRepoImpl clientRepo;

    @Test
    void findByIdClientTest( ) {

        
        Assertions.assertNull( repo.findByIdClient(10000000));
        
        Assertions.assertNotNull(repo.findByIdClient(8));
    
    }


    @Test
    void findByIdTest () {

        Assertions.assertNotNull( repo.findById(8));

        Assertions.assertNull( repo.findById(100000) );

    }
    @Test
    @Disabled
    void saveTest () {
        

        
        
        Client client = clientRepo.findById(4).get();

        Account account = new Account(0, client, "4793084", LocalDate.now(), 3444);

        client.setAccount(account);
        
        Assertions.assertNotNull( repo.save(account) );


        
    }

    @Test
    void findByNumClientTest () {

        Assertions.assertNotNull( repo.findByNumClient( "650863380" ) );

        Assertions.assertEquals( repo.findByNumClient( "650863380" ).getId(), 6);

    }

    @Test
    void findAllTest () {

        Assertions.assertNotNull( repo.findAll() );

    }


    @Test
    void checkTest () {
        Assertions.assertTrue(repo.check(10) , "Present");

        Assertions.assertFalse(repo.check(1000000000) , "Not present");
    }

    @Test
    @Disabled
    void insertTest () {

        Assertions.assertFalse( repo.insert( null) );

        Assertions.assertTrue( repo.insert( new Account() ));
        
    }

    @Test
    void deleteTest () {


        Assertions.assertFalse( repo.delete( 1 ) , "Nothing deleted");

        Assertions.assertTrue( repo.delete(10) );


        /*List<Integer> list = new ArrayList<>();
        list.add(4);
        list.add(7);
        list.add(8);
        list.add(9);
        
        Assertions.assertTrue( repo.delete( list ) , "List deleted");*/


    }

    



    
}
