package menu.manager
import magick.Magick;

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.grails.plugins.imagetools.ImageTool;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class ImageController {

	def index = {
		redirect(controller:'admin', action: "home")
	}

	def imageService
	
	def displayLaouts = {
		
	}

	def savePicture = {
		def type = params.type
		def instance = imageService.getInstance(params.id,type)

		def f = request.getFile("file")
		def pictureType = f.getContentType()

		def okcontents = ['image/png', 'image/jpeg', 'image/gif']

		if (!okcontents.contains(pictureType)) {
			flash.message = "Picture must be one of: ${okcontents}"
			render(view:'uploadPicture', model:[itemInstance:itemInstance])
			return;
		}
		pictureType = imageService.getPictureType(pictureType)
		def picturePath = imageService.sanitizePicturePath(type)


		def picName = params.superId+'-'+instance.id+'.'+pictureType
		def sizeOfPicture = 1024;
		def imageHeight = 375
		def imageWidth = 426
		
		/*saveImage(picturePath+picName,f.getBytes(),sizeOfPicture)*/

		if(type == 'mainMenu') {
			imageService.savePictureToFileSystem(picturePath,picName,f.getBytes())
		} else {
			imageService.saveImage(picturePath+picName,f.getBytes(),imageWidth,imageHeight)
		}
		
		
		def thumbNailPicture =this.getServletContext().getRealPath('/images/thumbnails/'+type+"-"+instance.id+'.'+pictureType)

		imageService.createThumbNail(thumbNailPicture,f.getBytes())

		instance.backGroundPicture = picturePath+picName
		instance.backGroundPictureType = pictureType
		instance.save(flush: true)

		redirect(controller:type, action: "show", id: instance.id)
	}


	def getThumbNails = {
		def thumbNailName = params.image_name
		println("*******************"+thumbNailName)
		if(thumbNailName) {
			thumbNailName = this.getServletContext().getRealPath('/images/thumbnails/'+thumbNailName)
		}
		imageService.displayImages(thumbNailName,response)
	}

	
	
	def getImage = {
		def relativePath = imageService.trimToEmpty(request.getPathInfo());

		def backGroundPicture = params.backGroundPicture
		
		imageService.displayImages(backGroundPicture,response)
	}
	
	def getBackGroundPictureForClient = {
		println "Get Background picture Path "+params.path
		render imageService.getBackGroundPictureForClient(params.path)
	}

	def getBackgroundImage = {
		def relativePath = imageService.trimToEmpty(request.getPathInfo());

		def backGroundPicture = params.backGroundPicture
		if(!backGroundPicture) {
			backGroundPicture = this.getServletContext().getRealPath('/images/placeholder.gif')
		}
		
		imageService.displayImages(backGroundPicture,response)
	}
}
