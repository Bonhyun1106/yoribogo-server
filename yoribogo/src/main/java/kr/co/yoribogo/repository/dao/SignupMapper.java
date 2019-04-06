package kr.co.yoribogo.repository.dao;

public interface SignupMapper {
	public int getMemIdOnly(String id);
	public String getMemPasswordOnly(String password);
	public int getMemEmailOnly(String email);
}
