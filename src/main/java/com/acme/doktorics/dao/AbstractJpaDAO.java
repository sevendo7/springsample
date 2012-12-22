package com.acme.doktorics.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class AbstractJpaDAO<T> implements IAbstractJpaDAO<T> {
	private Class<T> clazz;

	@PersistenceContext
	protected EntityManager entityManager;
	
	public void setClazz(final Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}

	
	public T findOne(final Long id) {
		return entityManager.find(clazz, id);
	}

	
	public List<T> findAll() {
		return entityManager.createQuery("from " + clazz.getName())
				.getResultList();
	}

	public void save(final T entity) {
		entityManager.persist(entity);
	}

	public void update(final T entity) {
		entityManager.merge(entity);
	}

	public void delete(final T entity) {
		entityManager.remove(entity);
	}



}