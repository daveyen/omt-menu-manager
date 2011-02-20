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

	def displayLaouts = {
		
	}

	def getInstance(id,type) {
		def instance = null
		if(type == "item") {
			instance = Item.get(id)
		} else if(type == 'panel') {
			instance = Panel.get(id)
		} else if (type == 'menu') {
			instance = Menu.get(id)
		} else if (type == 'subMenu') {
			instance = SubMenu.get(id)
		} else if (type == 'mainMenu') {
			instance = MainMenu.get(id)
		}
		return instance
	}

	def savePicture = {
		def type = params.type
		def instance = getInstance(params.id,type)

		def f = request.getFile("file")
		def pictureType = f.getContentType()

		def okcontents = ['image/png', 'image/jpeg', 'image/gif']

		if (!okcontents.contains(pictureType)) {
			flash.message = "Picture must be one of: ${okcontents}"
			render(view:'uploadPicture', model:[itemInstance:itemInstance])
			return;
		}
		pictureType = getPictureType(pictureType)
		def picturePath = sanitizePicturePath(type)


		def picName = params.superId+'-'+instance.id+'.'+pictureType

		saveImage(picturePath+picName,f.getBytes())
		
		def thumbNailPicture =this.getServletContext().getRealPath('/images/thumbnails/'+type+"-"+instance.id+'.'+pictureType)

		createThumbNail(thumbNailPicture,f.getBytes())

		instance.backGroundPicture = picturePath+picName
		instance.backGroundPictureType = pictureType
		instance.save(flush: true)

		redirect(controller:type, action: "show", id: instance.id)
	}

	def savePictureToFileSystem(String picturePath,String picName,byte[] picFile) {
		File file = new File(picturePath)
		if (!file.exists())  {
			file.mkdirs();
		}
		FileOutputStream fos = new FileOutputStream(picturePath+picName)
		BufferedOutputStream bos = new BufferedOutputStream(fos)
		bos.write(picFile)
		bos.flush()
		bos.close()
	}
	def saveImage(String picturePath,byte[] picFile) {
		def imageTool = new ImageTool()
		imageTool.load(picFile)
		imageTool.thumbnail( 1024 )
		
		imageTool.writeResult(picturePath, "JPEG")
	}


	
	def createThumbNail(picName,picData) {
		def imageTool = new ImageTool()
		imageTool.load(picData)
		imageTool.square()
		imageTool.swapSource()
		imageTool.thumbnail( 70 )
		
		
		imageTool.writeResult(picName, "JPEG")
		
	}

	def getPictureType(pictureType ) {

		if(pictureType == 'image/jpeg')  {
			pictureType = 'jpg'
		} else if(pictureType == 'image/gif') {
			pictureType = 'gif'
		} else {
			pictureType = 'png'
		}

		pictureType
	}

	def sanitizePicturePath(type) {
		String picPath = CH.config.base.media.path

		if(picPath == null || picPath.isEmpty()) {
			picPath +='/omt-menu-manager/images/'
		}
		if(!picPath.endsWith('/')) {
			picPath +='/'
		}
		picPath +=type+'/'
	}


	def getThumbNails = {
		def thumbNailName = params.image_name
		println("*******************"+thumbNailName)
		if(thumbNailName) {
			thumbNailName = this.getServletContext().getRealPath('/images/thumbnails/'+thumbNailName)
		}
		
		displayImages(thumbNailName)
	}

	def getImage = {
		def relativePath = trimToEmpty(request.getPathInfo());

		def backGroundPicture = params.backGroundPicture
		
		displayImages(backGroundPicture)
	}

	def displayImages(picName) {
		
		if(!picName) {
			picName=this.getServletContext().getRealPath('/images/no_image.jpg')
		}
		
		File file = new File(picName);
		// show a 404 page
		if(!file.exists() || !file.isFile()) {
			file = new File(this.getServletContext().getRealPath('/images/no_image.jpg'))
		}

		try {
			streamImageFile(file, response);
		} catch(Exception e) {
			// Tell the user there was some internal server error.\
			// 500 - Internal server error.
			httpError(500, response);
			e.printStackTrace();
		}

	}



	private String getBackgroundPicturePath(String type, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	private void streamImageFile(File file, HttpServletResponse response) {
		// find the right MIME type and set it as content type
		response.setContentType(getContentType(file));
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			response.setContentLength((int) file.length());

			// Use Buffered Stream for reading/writing.
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(response.getOutputStream());

			byte[] buff = new byte[(int) file.length()];
			int bytesRead;

			// Simple read/write loop.
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {

			throw new RuntimeException(e);
		} finally {
			if (bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
					// To late to do anything about it now, we may have already sent some data to user.
				}
			}
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
					// To late to do anything about it now, we may have already sent some data to user.
				}
			}
		}
	}

	private String getContentType(File file) {
		if(file.getName().length() > 0) {
			String[] parts = file.getName().split("\\.");
			if(parts.length > 0) {
				// only last part interests me
				String extention = parts[parts.length - 1];
				if(extention.equalsIgnoreCase("jpg")) {
					return "image/jpg";
				} else if(extention.equalsIgnoreCase("gif")) {
					return "image/gif";
				} else if(extention.equalsIgnoreCase("png")) {
					return "image/png";
				}
			}
		}
		throw new RuntimeException("Can not find content type for the file " +  file.getAbsolutePath());
	}

	private String trimToEmpty(String pathInfo) {
		if(pathInfo == null) {
			return "";
		} else {
			return pathInfo.trim();
		}
	}

	private void httpError(int statusCode, HttpServletResponse response) {
		try {
			response.setStatus(statusCode);
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.append("<html><body><h1>Error Code: " + statusCode + "</h1><body></html>");
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private boolean isXSSAttack(String path) {
		boolean xss = false;
		// Split on the bases of know file separator
		String[] parts = path.split("/|\\\\");

		// Now verify that no part contains anything harmful
		for(String part : parts) {
			// No double dots ..
			// No colons :
			// No semicolons ;
			if(part.trim().contains("..") || part.trim().contains(":") || part.trim().contains(";")) {
				// Fire in the hole!
				xss = true;
				break;
			}
		}
		return xss;
	}

	def resize = {
		def imageTools = new ImageTool();

	}
}
