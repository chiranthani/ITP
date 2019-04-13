package Model;

public class Student extends User{


	private String special;
	private String OLyear;
	private String index;
	private String result;
	private String username;
	private String password;
	private String Pname;
	private String Poccupation;
	private int Ptelphone;
	private String Wplace;
	private String course;
	private String regDate;
	private String userId;
        
       
        private String feedDescription;
        

    public String getUserId() {
        return userId;
    }

    public String getFeedDescription() {
        return feedDescription;
    }

    public void setFeedDescription(String feedDescription) {
        this.feedDescription = feedDescription;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getuType() {
        return uType;
    }

    public void setuType(String uType) {
        this.uType = uType;
    }
        private String uType;
	
	
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public String getOLyear() {
		return OLyear;
	}
	public void setOLyear(String oLyear) {
		OLyear = oLyear;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getPoccupation() {
		return Poccupation;
	}
	public void setPoccupation(String poccupation) {
		Poccupation = poccupation;
	}
	public int getPtelphone() {
		return Ptelphone;
	}
	public void setPtelphone(int ptelphone) {
		Ptelphone = ptelphone;
	}
	public String getWplace() {
		return Wplace;
	}
	public void setWplace(String wplace) {
		Wplace = wplace;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
      

	
	
}
