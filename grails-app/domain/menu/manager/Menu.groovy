package menu.manager

class Menu {
	String name
	String description
	String title
	String font
	String fontColor
	String backGroundColor
	String backGroundPicture
	
    static constraints = {
    	name(nullable:false,blank:false)
		mainMenu()
		panel()
	}
	
	static belongsTo = [mainMenu:MainMenu,panel:Panel]
	static hasMany = [subMenu:SubMenu]

	String toString() {
		return name
	}
}
