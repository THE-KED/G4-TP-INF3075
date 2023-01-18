package com.CRUD.Momo.Model.Dao;

import com.CRUD.Momo.Models.DAO.ClientRepoImpl;
import com.CRUD.Momo.Models.Entitys.Client;

import java.util.NoSuchElementException;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.EmptyResultDataAccessException;


@SpringBootTest
public class ClientRepoImplTest {

    @Autowired
    ClientRepoImpl repoImpl;

    @Test
    void findByIdTest () {

        
        //Assertions.assertNotNull( repoImpl.findById(7) );
        Assertions.assertThrows( NoSuchElementException.class , ()-> {repoImpl.findById(10000000).get();} );

    }

    @Test 
    void checkByNumTest () {

        Assertions.assertTrue( repoImpl.checkByNum("650863380") );

        Assertions.assertFalse( repoImpl.checkByNum("nothing") );
    }

    @Test
    void checkByidTest () {

        Assertions.assertTrue( repoImpl.checkByid(8) );

        Assertions.assertFalse( repoImpl.checkByid(100000) );
    }

    @Test
    void findByNumTest () {

        Assertions.assertThrows(  EmptyResultDataAccessException.class, () -> { repoImpl.findByNum("Nothing"); } );

        Assertions.assertNotNull(repoImpl.findByNum("650863380") );
    }
    
    @Test
    @Disabled
    void saveTest () {

        Client client = new Client( 3 , "35748" , "Shadow");
        

        Assertions.assertNotNull( repoImpl.save(client) );

        // Assertions.assertFalse( repoImpl.save(null));

        
    }

    @Test
    @Disabled
    void deleteTest () {
        Assertions.assertTrue( repoImpl.delete(3) );

        /*Assertions.assertThrows( EmptyResultDataAccessException.class , () ->  { repoImpl.delete(-1); } );


        List<Integer> list = null;

        Assertions.assertThrows( InvalidDataAccessApiUsageException.class , () -> { repoImpl.delete(null); } );
        
        list = new ArrayList<>();
        list.add(2);
        list.add(3);
        
        Assertions.assertTrue ( repoImpl.delete(list));*/
    }

    @Test
    void findAllTest () {

        Assertions.assertNotNull( repoImpl.findAll() );

    }

    @Test
    @Disabled
    void findAllWhenEmpty () {
        Assertions.assertNull( repoImpl.findAll() );
    }
    


}
