package kr.co.yoribogo.repository.vo;

import java.util.Date;

public class RecipeVO {
   private int no;
   private int memNo;
   private String title;
   private String summary;
   private int viewCnt;
   private int likeCnt;
   private Date regDate;
   private int country; 
   private int type;
   private int kcal;
   private int time;
   private int level;
   private int weather;
   
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public int getMemNo() {
      return memNo;
   }
   public void setMemNo(int memNo) {
      this.memNo = memNo;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getSummary() {
      return summary;
   }
   public void setSummary(String summary) {
      this.summary = summary;
   }
   public int getViewCnt() {
      return viewCnt;
   }
   public void setViewCnt(int viewCnt) {
      this.viewCnt = viewCnt;
   }
   public int getLikeCnt() {
      return likeCnt;
   }
   public void setLikeCnt(int likeCnt) {
      this.likeCnt = likeCnt;
   }
   public Date getRegDate() {
      return regDate;
   }
   public void setRegDate(Date regDate) {
      this.regDate = regDate;
   }
   public int getCountry() {
      return country;
   }
   public void setCountry(int country) {
      this.country = country;
   }
   public int getType() {
      return type;
   }
   public void setType(int type) {
      this.type = type;
   }
   public int getKcal() {
      return kcal;
   }
   public void setKcal(int kcal) {
      this.kcal = kcal;
   }
   public int getTime() {
      return time;
   }
   public void setTime(int time) {
      this.time = time;
   }
   public int getLevel() {
      return level;
   }
   public void setLevel(int level) {
      this.level = level;
   }
   public int getWeather() {
      return weather;
   }
   public void setWeather(int weather) {
      this.weather = weather;
   }

   
}