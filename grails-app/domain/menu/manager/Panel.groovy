package menu.manager

class Panel {

	String name;
	String position
	String font
	String backgroundColor
	String backGroundPicture
	String backGroundPictureType
	String panelSize

	static constraints = {
		name(blank:false, nullable:false, unique:true)
		position(inList:["left", "right","top","bottom","center"])
		backGroundPicture(nullable:true, maxSize: 102400 /* 16K */)
		backGroundPictureType(nullable:true)
		
		layouts()
		
	}
	
	static belongsTo =[layouts:Layouts]
	static hasMany=[menu:Menu]
	String toString() {
		return name
	}
}
