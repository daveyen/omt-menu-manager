package menu.manager

class MainMenuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	def menu = {
		
	}
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mainMenuInstanceList: MainMenu.list(params), mainMenuInstanceTotal: MainMenu.count()]
    }

    def create = {
        def mainMenuInstance = new MainMenu()
        mainMenuInstance.properties = params
        return [mainMenuInstance: mainMenuInstance]
    }

    def save = {
        def mainMenuInstance = new MainMenu(params)
        if (mainMenuInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), mainMenuInstance.id])}"
            redirect(action: "show", id: mainMenuInstance.id)
        }
        else {
            render(view: "create", model: [mainMenuInstance: mainMenuInstance])
        }
    }

    def show = {
        def mainMenuInstance = MainMenu.get(params.id)
        if (!mainMenuInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mainMenuInstance: mainMenuInstance]
        }
    }

    def edit = {
        def mainMenuInstance = MainMenu.get(params.id)
        if (!mainMenuInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mainMenuInstance: mainMenuInstance]
        }
    }

    def update = {
        def mainMenuInstance = MainMenu.get(params.id)
        if (mainMenuInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mainMenuInstance.version > version) {
                    
                    mainMenuInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mainMenu.label', default: 'MainMenu')] as Object[], "Another user has updated this MainMenu while you were editing")
                    render(view: "edit", model: [mainMenuInstance: mainMenuInstance])
                    return
                }
            }
            mainMenuInstance.properties = params
            if (!mainMenuInstance.hasErrors() && mainMenuInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), mainMenuInstance.id])}"
                redirect(action: "show", id: mainMenuInstance.id)
            }
            else {
                render(view: "edit", model: [mainMenuInstance: mainMenuInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mainMenuInstance = MainMenu.get(params.id)
        if (mainMenuInstance) {
            try {
                mainMenuInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mainMenu.label', default: 'MainMenu'), params.id])}"
            redirect(action: "list")
        }
    }
}
