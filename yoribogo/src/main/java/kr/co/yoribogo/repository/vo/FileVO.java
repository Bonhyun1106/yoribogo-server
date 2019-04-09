package kr.co.yoribogo.repository.vo;

public class FileVO {
	private int blockNo;		// 이미지 pk
	private int recipeNo;		// 레시피 번호
	private String blockCon;	// 요리설명
	private String blockImg;	// 이미지링크
	
	public int getblockNo() {
		return blockNo;
	}
	public void setblockNo(int blockNo) {
		this.blockNo = blockNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getBlockCon() {
		return blockCon;
	}
	public void setBlockCon(String blockCon) {
		this.blockCon = blockCon;
	}
	public String getBlockImg() {
		return blockImg;
	}
	public void setBlockImg(String blockImg) {
		this.blockImg = blockImg;
	}
	
	
	
	
}
