package menu.manager

class Item {
	String name
	String description
	String title
	String font
	String fontColor
	String backGroundColor
	String backGroundPicture
	String type
	String price

	static constraints = {
		name(nullable:false,blank:false)
		type(inList:["Veg","Non Veg"])
		subMenu()
    }
	
	static belongsTo = [subMenu:SubMenu]
	
	String toString() {
		return name
	}
}
