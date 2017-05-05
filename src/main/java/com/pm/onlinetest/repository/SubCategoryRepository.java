package com.pm.onlinetest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pm.onlinetest.domain.Subcategory;

@Repository
public interface SubCategoryRepository extends CrudRepository<Subcategory, Integer> {

	@Query("from Subcategory sc join sc.category c  where c.id=:catId")
	public List<Subcategory> findSubCategoryById(@Param("catId") Integer catId);
	
	@Query("FROM Subcategory sc WHERE sc.enabled = true")
	public List<Subcategory> findAllEnabled();

	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE Subcategory sc SET sc.enabled = false WHERE sc.id =:id")
	void softDelete(@Param("id") Integer id);
}
