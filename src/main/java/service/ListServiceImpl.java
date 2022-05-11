package service;

import java.util.Collection;

import domain.BoardVO;
import mapper.ListMapper;

public class ListServiceImpl implements ListService{

	@Override
	public Collection<BoardVO> read() {
		// TODO Auto-generated method stub
		return new ListMapper().read();
	}

	

}
