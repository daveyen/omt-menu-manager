package menu.manager

class AdminController {


	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def login = {
		if(isLoggedIn()) {
			redirect(action:"home")
		}
	}


	def home = {

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
			redirect(controller:"admin", action:"list")
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
