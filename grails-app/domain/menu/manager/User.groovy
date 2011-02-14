package menu.manager

class User {
	String login
	String password

	static constraints = {
		login(blank:false, nullable:false, unique:true)
		password(blank:false, password:true)
		admin()
		
	}

	
	String toString(){
		login
	}
	
	static belongsTo = [admin:Admin]
	

}
