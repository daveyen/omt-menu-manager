package menu.manager

class AdminFilters {
	def filters = {

		all(controller:'*', action:'*') {

			before = {
				if(controllerName != null && actionName != null) {
					
					if(params.application != 'client' && !session.user && !session.admin && actionName != 'login' && actionName != 'authenticate') {
						
						if(controllerName == 'user') {
							redirect(controller:'user',action:'login')
						} else {
							redirect(controller:'admin',action:'login')
						}
					}
				}

				after = {

				}

				afterView = {
				}
			}
		}
	}
}