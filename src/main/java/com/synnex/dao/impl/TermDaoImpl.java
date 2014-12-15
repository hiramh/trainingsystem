package com.synnex.dao.impl;

import org.springframework.stereotype.Repository;

import com.synnex.dao.TermDao;
import com.synnex.model.Term;

@Repository
public class TermDaoImpl extends GenericDaoImpl<Term, Integer> implements TermDao {

	@Override
	public int getTotolCount() {
		return list(null, null, -1, 0).size();
	}
}
