package menu.manager

class LayoutsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	
	def beforeInterceptor = {
		if(!session.admin) {
			redirect(action:"admin.login")
		}
	}

    def index = {
        redirect(action: "list", params: params)
    }

	def panel = {
		
	}

	def test =  {
		
	}
	def mainMenu = {
	
	}

	def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [layoutsInstanceList: Layouts.list(params), layoutsInstanceTotal: Layouts.count()]
    }

    def create = {
        def layoutsInstance = new Layouts()
        layoutsInstance.properties = params
        return [layoutsInstance: layoutsInstance]
    }

    def save = {
        def layoutsInstance = new Layouts(params)
        if (layoutsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'layouts.label', default: 'Layouts'), layoutsInstance.id])}"
            redirect(action: "show", id: layoutsInstance.id)
        }
        else {
            render(view: "create", model: [layoutsInstance: layoutsInstance])
        }
    }

    def show = {
        def layoutsInstance = Layouts.get(params.id)
        if (!layoutsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
            redirect(action: "list")
        }
        else {
            [layoutsInstance: layoutsInstance]
        }
    }

    def edit = {
        def layoutsInstance = Layouts.get(params.id)
        if (!layoutsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [layoutsInstance: layoutsInstance]
        }
    }

    def update = {
        def layoutsInstance = Layouts.get(params.id)
        if (layoutsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (layoutsInstance.version > version) {
                    
                    layoutsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'layouts.label', default: 'Layouts')] as Object[], "Another user has updated this Layouts while you were editing")
                    render(view: "edit", model: [layoutsInstance: layoutsInstance])
                    return
                }
            }
            layoutsInstance.properties = params
            if (!layoutsInstance.hasErrors() && layoutsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'layouts.label', default: 'Layouts'), layoutsInstance.id])}"
                redirect(action: "show", id: layoutsInstance.id)
            }
            else {
                render(view: "edit", model: [layoutsInstance: layoutsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def layoutsInstance = Layouts.get(params.id)
        if (layoutsInstance) {
            try {
                layoutsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'layouts.label', default: 'Layouts'), params.id])}"
            redirect(action: "list")
        }
    }
	
	//Panel
	def listPanel = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[panelInstanceList: Panel.list(params), panelInstanceTotal: Panel.count()]
	}

	def createPanel = {
		def panelInstance = new Panel()
		panelInstance.properties = params
		return [panelInstance: panelInstance]
	}

	def savePanel = {
		def panelInstance = new Panel(params)
		if (panelInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'panel.label', default: 'Panel'), panelInstance.id])}"
			redirect(action: "showPanel", id: panelInstance.id)
		}
		else {
			render(view: "createPanel", model: [panelInstance: panelInstance])
		}
	}

	def showPanel = {
		def panelInstance = Panel.get(params.id)
		if (!panelInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
			redirect(action: "listPanel")
		}
		else {
			[panelInstance: panelInstance]
		}
	}

	def editPanel = {
		def panelInstance = Panel.get(params.id)
		if (!panelInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
			redirect(action: "listPanel")
		}
		else {
			return [panelInstance: panelInstance]
		}
	}

	def updatePanel = {
		def panelInstance = Panel.get(params.id)
		if (panelInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (panelInstance.version > version) {
					
					panelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'panel.label', default: 'Panel')] as Object[], "Another user has updated this Panel while you were editing")
					render(view: "editPanel", model: [panelInstance: panelInstance])
					return
				}
			}
			panelInstance.properties = params
			if (!panelInstance.hasErrors() && panelInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'panel.label', default: 'Panel'), panelInstance.id])}"
				redirect(action: "showPanel", id: panelInstance.id)
			}
			else {
				render(view: "editPanel", model: [panelInstance: panelInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
			redirect(action: "listPanel")
		}
	}

	def deletePanel = {
		def panelInstance = Panel.get(params.id)
		if (panelInstance) {
			try {
				panelInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
				redirect(action: "listPanel")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
				redirect(action: "showPanel", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'panel.label', default: 'Panel'), params.id])}"
			redirect(action: "listPanel")
		}
	}

}
