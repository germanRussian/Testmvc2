package service;


import domain.BoardVO;
import mapper.deleteMapper;

public class DeleteServiceImpl implements DeleteService{

	@Override
	public void delete(BoardVO vo) {
			new deleteMapper().delete(vo);
		
	}

		
}
