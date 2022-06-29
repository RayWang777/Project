package com.eeit144.drinkmaster.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit144.drinkmaster.bean.SaleCodeBean;

@Repository
public interface SaleCodeRepository extends JpaRepository<SaleCodeBean, Integer> {

}