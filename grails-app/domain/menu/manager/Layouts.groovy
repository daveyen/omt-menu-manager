package menu.manager

class Layouts {
	
	String name

    static constraints = {
		name(blank:false, nullable:false, unique:true)
		admin()
    }
	
	static belongsTo = [admin:Admin]
	static hasMany= [panel:Panel,maniMenu:MainMenu]
	
	String toString() {
		return name
	}
}