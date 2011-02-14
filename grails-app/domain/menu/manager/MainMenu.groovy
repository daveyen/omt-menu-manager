package menu.manager

class MainMenu {
 
	String name
	String title
	String description
	String backGroundColor
	String backGroundPic
	String font
	String fontColor
    static constraints = {
		name(blank:false, nullable:false)
		title(blank:false, nullable:false)
		description(nullable:false)
    }
	
	static belongsTo =[layouts:Layouts]
	static hasMany = [menu:Menu]
	
	String toString() {
		return name
	}
}
