package menu.manager

import java.io.BufferedInputStream
import java.io.File

import javax.servlet.http.HttpServletResponse

import menu.manager.utils.Base64

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.grails.plugins.imagetools.ImageTool

class ImageService {

	static transactional = true

	def serviceMethod() {

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

	def savePictureToFileSystem(picturePath,picName,picFile) {
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
	/*
	 def saveImage(String picturePath,byte[] picFile,sizeOfPicture) {
	 def imageTool = new ImageTool()
	 imageTool.load(picFile)
	 imageTool.thumbnail(sizeOfPicture)
	 imageTool.writeResult(picturePath, "JPEG")
	 }
	 */
	def saveImage(picturePath,picFile,maxWidth,maxHeight) {
		def imageTool = new ImageTool()
		imageTool.load(picFile)
		imageTool.thumbnailSpecial(maxWidth, maxHeight, 1, 1)
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

	def displayImages(picName,response) {

		println "********************* config "+CH.config.base.media.path
		println "********************* dave "+CH.config.dave
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

	public String getBackGroundPictureForClient(path) {

		File file = new File(path)
		FileInputStream fis = new FileInputStream(file)
		BufferedInputStream  bis = null
		String voiceData = null
		bis = new BufferedInputStream (fis)
		byte[] b = new byte[(int)file.length()]
		bis.read(b)
		voiceData = Base64.encode(b)
		voiceData
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
			int bytesRead = 0;

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
}
