package customer;

/*
 *create table customer(
  num number,
  sub varchar2(20),
  title varchar2(50),
  writer varchar2(20),
  hit number,
  regdate varchar2(50),
  content varchar2(3500),
  filename varchar2(100),
  email varchar2(50),
  primary key(num));
  
  create sequence customer_seq increment by 1 start with 1;
 */

public class CustomerDTO {
	int num;
	String sub;
	String title;
	String writer;
	int hit;
	String regDate;
	String content;
	String fileName;
	String email;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	
}
