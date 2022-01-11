package customer;

public class CustomerCheck {
	
	public String changeSub(String numSub){	// db에 저장된 상담구분 문자로 변환해주는 메소드
		String sub = "";
		switch(numSub){
			case "01" : sub = "품질"; break;
			case "02" : sub = "서비스"; break;
			case "03" : sub = "매장환경"; break;
			case "04" : sub = "기타"; break;
			case "05" : sub = "칭찬"; break;
			case "06" : sub = "불만"; break;
			case "07" : sub = "제안"; break;
			case "08" : sub = "문의"; break;
		}
		return sub;
	}
	
	
	public boolean emptyCheck(String sub, String title, String content) {
		if(sub == "" || sub == null || title == "" || title == null || content == "" || content == null) {
			return false;
		}else {
			return true;
		}
	}

}
