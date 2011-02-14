package menu.manager

class Panel {

	String name;
	String position
	String font
	String backgroundColor
	String backGroundPic
	String panelSize

	static constraints = {
		name(blank:false, nullable:false, unique:true)
		position(inList:["left", "right","top","bottom","center"])
		layouts()
		
	}
	
	static belongsTo =[layouts:Layouts]
	static hasMany=[menu:Menu]
	String toString() {
		return name
	}
}
