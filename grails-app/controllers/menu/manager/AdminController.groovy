package menu.manager

import java.util.ArrayList

import org.codehaus.groovy.grails.web.json.JSONObject

class AdminController {


	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def login = {
		if(isLoggedIn()) {
			println("logged in")
			redirect(action:"home")
		}
	}

	def home = {

	}

	def selectItem = {
		println "Selected "+params.id
		Item itemInstance = Item.get(params.id)
		def orderInstance = session.orders
		ArrayList list = new ArrayList()
		if(!orderInstance) {
			orderInstance = new Orders()
			println "************************"+orderInstance
			list.add(itemInstance)
			orderInstance.itemList = list.toArray()
			session.orders = orderInstance
		} else {
			list.addAll(orderInstance.itemList)
			list.add(itemInstance)
			orderInstance.itemList = list
		}

		println("           "+orderInstance)
		render (view:"_selectedItems", model:[orderInstance:orderInstance])
	}

	def viewOrder = {
		def orderInstance = session.orders
		if(!orderInstance) {
			println "view order "+orderInstance
			def clearedOrder = new Orders()
			clearedOrder.itemList = new Item[0]
			render (view:"_selectedItems", model:[orderInstance:clearedOrder])
		} else {
			println "view order selected"+orderInstance

			render (view:"_selectedItems", model:[orderInstance:orderInstance])
		}

	}

	def clearOrder = {
		def orderInstance = session.orders
		println "clear order  lllll***************"+orderInstance

		if(orderInstance) {
			session.orders = null
		}
		
		orderInstance = new Orders()
		orderInstance.itemList = new Item[0]
		render (view:"_selectedItems", model:[orderInstance:orderInstance])

	}

	def removeItemFromOrder = {

		def orderInstance = session.orders
		int itemId = params.id

		Item item = Item.get(params.id)
		Item itemToRemove = null;

		ArrayList list = orderInstance.itemList

		for(int i=0;i < list.size(); i++) {
			Item itemInstance = list.get(i)


			if(itemInstance.id == item.id ){
				itemToRemove = itemInstance
				break
			}
		}

		list.remove(itemToRemove)
		orderInstance.itemList = list
		render (view:"_selectedItems", model:[orderInstance:orderInstance])


	}

	def submitOrder = {
		def orderInstance = session.orders

		if(!orderInstance || orderInstance.itemList ==null || orderInstance.itemList.size() < 1) {
			println "unsuccessful"
			render (view:"_failureSubmit")
		} else {
			session.orders = null
			println "successful"
			/*render (view:"_successfulSubmit")*/
			render(view:"submitSuccess")
		}
	}
	
	def getMyBill = {
		render (view:"myBill")
	}

	def getSubMenuItem = {
		println "-------------------------------- "+params.id
		Item[] itemInstanceList = Item.findAllBySubMenu(SubMenu.get(params.id))
		render (view:"_displayItems", model:[itemInstanceList:itemInstanceList])
	}

	def getImage = {
		redirect(controller: 'image' ,action:'getImage', params:['backGroundPicture':params.backGroundPicture])

	}

	def getBackgroundImage = {
		redirect(controller: 'image' ,action:'getBackgroundImage', params:['backGroundPicture':params.backGroundPicture])
	}


	def displayMenu = {
		MainMenu mainMenuInstance = MainMenu.get(params.id)
		Menu[] menuInstanceList = Menu.findAllByMainMenu(mainMenuInstance)
		def backGroundPicture = mainMenuInstance.backGroundPicture

		if(mainMenuInstance.backGroundColor) {

			backGroundPicture=""
		}
		[menuInstanceList:menuInstanceList,backGroundPicture:backGroundPicture,backGroundColor:mainMenuInstance.backGroundColor]

	}

	def displayItem = {
		println "..............................."+params.id
		Item itemInstance = Item.get(params.id)
		println "__________item "+itemInstance
		render (view:"_displayItem", model:[itemInstance:itemInstance])

	}

	def displaySubMenu = {
		println "####################"
		Menu menuInstance = Menu.get(params.id)
		SubMenu[] subMenuInstanceList = SubMenu.findAllByMenu(menuInstance)
		Item[] itemInstanceList = Item.findAllBySubMenu(subMenuInstanceList[0])

		def backGroundPicture = menuInstance.backGroundPicture
		if(menuInstance.backGroundColor) {
			backGroundPicture =""
		}

		[subMenuInstanceList:subMenuInstanceList, itemInstanceList:itemInstanceList, backGroundPicture:backGroundPicture,backGroundColor:menuInstance.backGroundColor]
	}
	
	def displaySubMenuPicture = {
		
		SubMenu subMenuInstance = SubMenu.get(params.id)
		println "**********################********"+subMenuInstance
		
		render (view:"_displaySubMenuPicture", model:[subMenuInstance:subMenuInstance])
		
	}


	def displayLayouts = {
		Layouts layouts = Layouts.get(params.id)
		MainMenu[] mainMenuInstance = MainMenu.findAllByLayouts(layouts)
		[mainMenuInstance:mainMenuInstance[0]]
	}

	def displayMainMenu = {
		Layouts layouts = Layouts.get(params.id)
		session.mainMenuId = params.id
		MainMenu[] mainMenuInstance = MainMenu.findAllByLayouts(layouts)
		[mainMenuInstance:mainMenuInstance[0]]
	}
	
	def exit = {
		Layouts layouts = Layouts.get(session.mainMenuId)
		MainMenu[] mainMenuInstance = MainMenu.findAllByLayouts(layouts)
		render (view:"displayMainMenu",model:[mainMenuInstance:mainMenuInstance[0]])
	}

	def getSettings = {

		Layouts layouts = Layouts.findAllByAdmin(session.admin)[0]
		Panel[] panels = Panel.findAllByLayouts(layouts)
		MainMenu[] mainMenu = MainMenu.findAllByLayouts(layouts)
		Menu[] menus = getMenus(panels)
		SubMenu[] subMenus = getSubMenus(menus)
		Item[] items = getItems(subMenus)

		JSONObject responseObject = new JSONObject()

		responseObject.put "layouts",layouts
		responseObject.put "panels", panels
		responseObject.put "mainMenus", mainMenu
		responseObject.put "menus", menus
		responseObject.put "subMenus", subMenus
		responseObject.put "item", items

		render responseObject.toString()


	}

	ArrayList<Menu> getMenus(Panel[] panels) {
		ArrayList<Menu> menus = new ArrayList<Menu>();
		for(int i=0; i < panels.length; i++) {
			Menu[] menu = Menu.findAllByPanel(panels[i])

			menus.addAll menu
		}

		return menus
	}

	ArrayList<SubMenu> getSubMenus(Menu[] menus) {

		ArrayList<SubMenu> subMenus = new ArrayList<SubMenu>()
		for(int i=0; i < menus.length; i++) {

			SubMenu[] subMenu = SubMenu.findAllByMenu(menus[i])

			subMenus.addAll subMenu
		}
		return subMenus
	}

	ArrayList<Item> getItems(SubMenu[] subMenus) {
		ArrayList<Item> items = new ArrayList<Item>();
		for(int i=0; i < subMenus.length; i++) {
			Item[] item = Item.findAllBySubMenu(subMenus[i])

			items.addAll item
		}
		return items
	}


	def createUser = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}

	def userSave = {
		def userInstance = new User(params)
		if (userInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "userShow", id: userInstance.id)
		}
		else {
			render(view: "create", model: [userInstance: userInstance])
		}
	}

	def userShow = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "userList")
		}
		else {
			[userInstance: userInstance]
		}
	}

	def userEdit = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "userList")
		}
		else {
			return [userInstance: userInstance]
		}
	}

	def userUpdate = {

		def userInstance = User.get(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {

					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "userShow", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "userList")
		}
	}

	def userDelete = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			try {
				userInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "userList")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "userShow", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "userList")
		}
	}

	def logout = {
		flash.message = "Goodbye ${session.admin.login}"
		session.admin = null
		redirect(action:"login")
	}

	def authenticate = {
		def admin =	Admin.findByLoginAndPassword(params.login,params.password.encodeAsSHA())
		if(admin){
			session.admin = admin
			flash.message = "Hello ${admin.login}!"
			redirect(controller:"admin", action:"home")
		}else{
			flash.message =
					"Sorry, ${params.login}. Please try again."
			redirect(action:"login")
		}
	}

	def index = {

		redirect(action: "home", params: params)
	}

	boolean isLoggedIn() {
		boolean loggedIn = false

		if(session.admin) {
			loggedIn = true
		}
		return loggedIn
	}

	def userList = {

		if(isLoggedIn()) {
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			def userInstanceList = User.findAllByAdmin(session.admin)
			[userInstanceList: User.list(params), userInstanceTotal: User.count()]

		} else {
			redirect(action: "login", params: params)

		}
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[adminInstanceList: Admin.list(params), adminInstanceTotal: Admin.count()]
	}

	def create = {
		def adminInstance = new Admin()
		adminInstance.properties = params
		return [adminInstance: adminInstance]
	}

	def save = {
		def adminInstance = new Admin(params)
		if (adminInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
			redirect(action: "show", id: adminInstance.id)
		}
		else {
			render(view: "create", model: [adminInstance: adminInstance])
		}
	}

	def show = {
		def adminInstance = Admin.get(params.id)
		if (!adminInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
			redirect(action: "list")
		}
		else {
			[adminInstance: adminInstance]
		}
	}

	def edit = {
		def adminInstance = Admin.get(params.id)
		if (!adminInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [adminInstance: adminInstance]
		}
	}

	def update = {
		println "********************************** update"
		def adminInstance = Admin.get(params.id)
		if (adminInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (adminInstance.version > version) {

					adminInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'admin.label', default: 'Admin')] as Object[], "Another user has updated this Admin while you were editing")
					render(view: "edit", model: [adminInstance: adminInstance])
					return
				}
			}
			adminInstance.properties = params
			if (!adminInstance.hasErrors() && adminInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
				redirect(action: "show", id: adminInstance.id)
			}
			else {
				render(view: "edit", model: [adminInstance: adminInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def adminInstance = Admin.get(params.id)
		if (adminInstance) {
			try {
				adminInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
			redirect(action: "list")
		}
	}

	def layouts = {

	}

	def user=  {

	}
	def listLayouts = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[layoutsInstanceList: Layouts.list(params), layoutsInstanceTotal: Layouts.count()]
	}

	def createLayouts = {
		def layoutsInstance = new Layouts()
		layoutsInstance.properties = params
		return [layoutsInstance: layoutsInstance]
	}

	def saveLayouts = {
		def layoutsInstance = new Layouts(params)
		if (layoutsInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'layouts.label', default: 'Layouts'), layoutsInstance.id])}"
			redirect(action: "showLayouts", id: layoutsInstance.id)
		}
		else {
			render(view: "createLayouts", model: [layoutsInstance: layoutsInstance])
		}
	}

	def showLayouts = {
		def layoutsInstance = Layouts.get(params.id)
		if (!layoutsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
			redirect(action: "listLayouts")
		}
		else {
			[layoutsInstance: layoutsInstance]
		}
	}

	def editLayouts = {
		def layoutsInstance = Layouts.get(params.id)
		if (!layoutsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
			redirect(action: "listLayouts")
		}
		else {
			return [layoutsInstance: layoutsInstance]
		}
	}

	def updateLayouts = {
		def layoutsInstance = Layouts.get(params.id)
		if (layoutsInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (layoutsInstance.version > version) {

					layoutsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'layouts.label', default: 'Layouts')] as Object[], "Another user has updated this Layouts while you were editing")
					render(view: "editLayouts", model: [layoutsInstance: layoutsInstance])
					return
				}
			}
			layoutsInstance.properties = params
			if (!layoutsInstance.hasErrors() && layoutsInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'layouts.label', default: 'Layouts'), layoutsInstance.id])}"
				redirect(action: "showLayouts", id: layoutsInstance.id)
			}
			else {
				render(view: "editLayouts", model: [layoutsInstance: layoutsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
			redirect(action: "listLayouts")
		}
	}

	def deleteLayouts = {
		def layoutsInstance = Layouts.get(params.id)
		if (layoutsInstance) {
			try {
				layoutsInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
				redirect(action: "listLayouts")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
				redirect(action: "showLayouts", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
			redirect(action: "listLayouts")
		}
	}



}
