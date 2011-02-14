import menu.manager.*;
class BootStrap {

    def init = { servletContext ->
		def admin = new Admin(login:"admin", password:"123456")
		admin.save()
		
		if(admin.hasErrors()){
			println admin.errors
		}
    }
    def destroy = {
    }
}
