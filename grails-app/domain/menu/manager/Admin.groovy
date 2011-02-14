package menu.manager

class Admin {
	String login
	String password

	static constraints = {
		login(blank:false, nullable:false, unique:true)
		password(blank:false, password:true)
	}

	String toString(){
		login
	}

	def beforeInsert = {
		password = password.encodeAsSHA()
	}
	static hasMany = [user:User,layouts:Layouts]
}
