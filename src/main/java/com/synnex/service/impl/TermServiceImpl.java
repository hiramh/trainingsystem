package com.synnex.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.synnex.dao.TermDao;
import com.synnex.model.Term;
import com.synnex.service.TermService;

@Service
public class TermServiceImpl implements TermService {
	@Resource(name = "termDaoImpl")
	private TermDao termDaoImpl;

	@Override
	public void addTerm(Term term) {
		termDaoImpl.save(term);
	}

	@Override
	public Term getTerm(int id) {
		return termDaoImpl.get(id);
	}

	@Override
	public List<Term> getAllTerms() {
		return termDaoImpl.list(null, null, -1, 0);
	}

}