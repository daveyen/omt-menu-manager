package menu.manager

class SubMenuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	def getImage = {
		redirect(controller: 'image' ,action:'getImage', params:['backGroundPicture':params.backGroundPicture])
	}

	def uploadPicture = {
		def subMenuInstance = SubMenu.get(params.id)
		if (!subMenuInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'subMenu', default: 'Item'), params.id])}"
			redirect(action: "list")
		}
		else {
			[subMenuInstance: subMenuInstance]
		}
	}
	def item = {
		
	}
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subMenuInstanceList: SubMenu.list(params), subMenuInstanceTotal: SubMenu.count()]
    }

    def create = {
        def subMenuInstance = new SubMenu()
        subMenuInstance.properties = params
        return [subMenuInstance: subMenuInstance]
    }

    def save = {
        def subMenuInstance = new SubMenu(params)
        if (subMenuInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), subMenuInstance.id])}"
            redirect(action: "uploadPicture", id: subMenuInstance.id)
        }
        else {
            render(view: "create", model: [subMenuInstance: subMenuInstance])
        }
    }

    def show = {
        def subMenuInstance = SubMenu.get(params.id)
        if (!subMenuInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
            redirect(action: "list")
        }
        else {
            [subMenuInstance: subMenuInstance]
        }
    }

    def edit = {
        def subMenuInstance = SubMenu.get(params.id)
        if (!subMenuInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [subMenuInstance: subMenuInstance]
        }
    }

    def update = {
        def subMenuInstance = SubMenu.get(params.id)
        if (subMenuInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (subMenuInstance.version > version) {
                    
                    subMenuInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'subMenu.label', default: 'SubMenu')] as Object[], "Another user has updated this SubMenu while you were editing")
                    render(view: "edit", model: [subMenuInstance: subMenuInstance])
                    return
                }
            }
            subMenuInstance.properties = params
            if (!subMenuInstance.hasErrors() && subMenuInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), subMenuInstance.id])}"
                redirect(action: "show", id: subMenuInstance.id)
            }
            else {
                render(view: "edit", model: [subMenuInstance: subMenuInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def subMenuInstance = SubMenu.get(params.id)
        if (subMenuInstance) {
            try {
                subMenuInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'subMenu.label', default: 'SubMenu'), params.id])}"
            redirect(action: "list")
        }
    }
}
