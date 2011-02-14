package menu.manager

class PanelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def panel = {
		
	}
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [panelInstanceList: Panel.list(params), panelInstanceTotal: Panel.count()]
    }

    def create = {
        def panelInstance = new Panel()
        panelInstance.properties = params
        return [panelInstance: panelInstance]
    }

    def save = {
        def panelInstance = new Panel(params)
        if (panelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'panel.label', default: 'Panel'), panelInstance.id])}"
            redirect(action: "show", id: panelInstance.id)
        }
        else {
            render(view: "create", model: [panelInstance: panelInstance])
        }
    }

    def show = {
        def panelInstance = Panel.get(params.id)
        if (!panelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [panelInstance: panelInstance]
        }
    }

    def edit = {
        def panelInstance = Panel.get(params.id)
        if (!panelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [panelInstance: panelInstance]
        }
    }

    def update = {
        def panelInstance = Panel.get(params.id)
        if (panelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (panelInstance.version > version) {
                    
                    panelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'panel.label', default: 'Panel')] as Object[], "Another user has updated this Panel while you were editing")
                    render(view: "edit", model: [panelInstance: panelInstance])
                    return
                }
            }
            panelInstance.properties = params
            if (!panelInstance.hasErrors() && panelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'panel.label', default: 'Panel'), panelInstance.id])}"
                redirect(action: "show", id: panelInstance.id)
            }
            else {
                render(view: "edit", model: [panelInstance: panelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def panelInstance = Panel.get(params.id)
        if (panelInstance) {
            try {
                panelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
            redirect(action: "list")
        }
    }
}
