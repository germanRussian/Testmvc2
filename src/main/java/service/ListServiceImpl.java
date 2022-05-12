package service;

import java.awt.print.Pageable;
import java.util.Collection;

import domain.BoardVO;
import mapper.ListMapper;

public class ListServiceImpl implements ListService{

	@Override
	public Collection<BoardVO> read() {
		// TODO Auto-generated method stub
		return new ListMapper().read();
	}

	/*
	 * @Override public int[] paging(BoardVO vo) { // TODO Auto-generated method
	 * stub return new ListMapper().paging(vo); }
	 */

	

	
	

}
