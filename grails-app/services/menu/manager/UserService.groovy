package menu.manager

import org.codehaus.groovy.grails.web.json.JSONObject

class UserService {

	static transactional = true

	def serviceMethod() {

	}

	def getSettings(user) {

		def layouts = Layouts.findAllByAdmin(user.admin)[0]
		def panels = Panel.findAllByLayouts(layouts)
		def mainMenu = getMainMenu(layouts)
		def menus = getMenus(mainMenu[0])
		def subMenus = getSubMenus(menus)
		def items = getItems(subMenus)

		JSONObject responseObject = new JSONObject()

		responseObject.put "layouts",layouts
		responseObject.put "panels", panels
		responseObject.put "mainMenu", mainMenu[0]
		responseObject.put "menus", menus
		responseObject.put "subMenus", subMenus
		responseObject.put "items", items
		
		responseObject
	}


	def getMainMenu(layouts) {
		MainMenu.findAllByLayouts(layouts)
	}

	def getMenus(MainMenu mainMenu) {
		Menu[] menu = Menu.findAllByMainMenu(mainMenu)

		menu
	}

	def getSubMenus(menus) {

		List<SubMenu> subMenus = new ArrayList<SubMenu>()
		for(int i=0; i < menus.length; i++) {

			SubMenu[] subMenu = SubMenu.findAllByMenu(menus[i])

			subMenus.addAll subMenu
		}

		subMenus.toArray()
	}

	def getItems(subMenus) {
		List<Item> items = new ArrayList<Item>();
		for(int i=0; i < subMenus.length; i++) {
			Item[] item = Item.findAllBySubMenu(subMenus[i])

			items.addAll item
		}

		items.toArray()
	}
	
	def authenticate(login,password) {
		def user = User.findByLoginAndPassword(login,password)
	}

}
