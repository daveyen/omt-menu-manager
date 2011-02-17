package menu.manager

class AdminFilters {
	def filters = {

		all(controller:'*', action:'*') {

			before = {
				if(controllerName != null && actionName != null) {

					if(!session.admin && actionName != 'login' && actionName != 'authenticate') {
						redirect(controller:'admin',action:'login')
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