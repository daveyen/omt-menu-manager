package menu.manager

class Menu {
	String name
	String description
	String title
	String font
	String fontColor
	String backGroundColor
	String backGroundPicture
	String backGroundPictureType
	
    static constraints = {
    	name(nullable:false,blank:false)
		backGroundPicture(nullable:true, maxSize: 102400 /* 16K */)
		backGroundPictureType(nullable:true)
		mainMenu()
		panel()
	}
	
	static belongsTo = [mainMenu:MainMenu,panel:Panel]
	static hasMany = [subMenu:SubMenu]

	String toString() {
		return name
	}
}
