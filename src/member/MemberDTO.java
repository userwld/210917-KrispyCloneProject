package member;
/* create table promember(
num number,
name varchar2(20),
email varchar2(50),
pw varchar2(20),
pwQuestion varchar2(10),
pwAnswer varchar2(30),
address varchar2(200),
mobile varchar2(20),
primary key(email));

create sequence promember_seq increment by 1 start with 1;
*/
public class MemberDTO {
	private int num;
	private String name;
	private String email;
	private String pw;
	private String pwQuestion;
	private String pwAnswer;
	private String address;
	private String mobile;
	
	public MemberDTO() {}	// 회원번호는 따로 setter로 담기
	public MemberDTO(String name, String email, String pw, String pwQuestion, String pwAnswer, String address, String mobile) {
		this.name = name; this.email = email; this.pw = pw;
		this.pwQuestion = pwQuestion; this.pwAnswer = pwAnswer;
		this.address = address; this.mobile = mobile;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPwQuestion() {
		return pwQuestion;
	}
	public void setPwQuestion(String pwQuestion) {
		this.pwQuestion = pwQuestion;
	}
	public String getPwAnswer() {
		return pwAnswer;
	}
	public void setPwAnswer(String pwAnswer) {
		this.pwAnswer = pwAnswer;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
