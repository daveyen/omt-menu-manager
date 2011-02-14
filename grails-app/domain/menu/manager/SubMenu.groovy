package menu.manager

class SubMenu {
	
	String name
	String description
	String title
	String font
	String fontColor
	String backGroundColor
	String backGroundPicture

    static constraints = {
		name(nullable:false,blank:false)
		menu()
    }
	
	static belongsTo=[menu:Menu]
	static hasMany=[item:Item]

	String toString() {
		return name
	}	
}
