package kr.co.yoribogo.repository.dao;

import kr.co.yoribogo.repository.vo.MemberVO;

public interface LoginMapper {
	
	MemberVO selectLogin(MemberVO member);
	
}
