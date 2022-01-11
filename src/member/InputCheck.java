package member;

public class InputCheck {
	
	public boolean emptyCheck(String name, String emailId, String emailDomain, String pw, String confirmPw, String pwQuestion, String pwAnswer,
		String zipcode,String address1,String address2,String phone1,String phone2,String phone3) {
		
		if(name == "" || emailId == "" || emailDomain == "" || pw == "" || confirmPw == "" || pwQuestion == "" || pwAnswer == "" || 
				zipcode == "" || address1 == "" || address2 == "" || phone1 == "" || phone2 == "" || phone3 =="") {
			return false;
		}
		return true;
	}
	
	public boolean emptyCheck(MemberDTO dto) {
			
			if(dto.getName() == "" || dto.getEmail() == "" || dto.getPw() == "" || dto.getPwQuestion() == "" ||  dto.getPwAnswer() == "" || 
					dto.getAddress() == "" || dto.getMobile() == "" ) {
				return false;
			}
			return true;
		}
	
	public boolean nullCheck(String name, String emailId, String emailDomain, String pw, String confirmPw, String pwQuestion, String pwAnswer,
			String zipcode,String address1,String address2,String phone1,String phone2,String phone3) {
			
			if(name == null || emailId == null || emailDomain == null || pw == null || confirmPw == null || pwQuestion == null || pwAnswer == null || 
					zipcode == null || address1 == null || address2 == null || phone1 == null || phone2 == null || phone3 ==null) {
				return false;
			}
			return true;
		}
	
	public boolean nullCheck(MemberDTO dto) {
		
		if(dto.getName() == null || dto.getEmail() == null || dto.getPw() == null || dto.getPwQuestion() == null ||  dto.getPwAnswer() == null || 
				dto.getAddress() == null || dto.getMobile() == null) {
			return false;
		}
		return true;
	}

	
	public boolean nameCheck(String name) {
		String regName = "^[가-힣a-zA-Z]*$";
	 	return !name.matches(regName)? false : true;
	}

	public boolean emailCheck(String emailId, String emailDomain) {
		String regId = "^[a-z0-9]{5,12}$";
		String regDomain = "^[a-zA-Z0-9.]+\\.[a-zA-Z]{2,4}$";		
		return !emailId.matches(regId) || !emailDomain.matches(regDomain)? false : true;
	}

	public boolean equalPw(String pw, String confirmPw) {
		return !pw.equals(confirmPw) ? false : true;
	}
	
	public boolean pwCheck(String pw) {
		String regPw = "^(?=.*[a-zA-Z])(?=.*?[0-9])[A-Za-z\\d]{8,16}$";
		return !pw.matches(regPw)? false : true;
	}

	public boolean mobileCheck(String phone2, String phone3) {
		String regPhone2 = "^\\d{3,4}";	
		String regPhone3 = "^\\d{4}";	
		return !phone2.matches(regPhone2) || !phone3.matches(regPhone3) ? false : true;
	}
	





















}
