package menu.manager

class SubMenu {
	
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
		menu()
    }
	
	static belongsTo=[menu:Menu]
	static hasMany=[item:Item]

	String toString() {
		return name
	}	
}
