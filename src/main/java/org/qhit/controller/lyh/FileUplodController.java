package org.qhit.controller.lyh;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.qhit.util.FileUtil;
import org.qhit.util.ResponseMsg;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
@RequestMapping({"/upload"})
public class FileUplodController {
	  @ResponseBody
	  @RequestMapping("/fileupload")
	  public ResponseMsg fileupload(@RequestParam(value="file", required=false) MultipartFile file, HttpServletRequest request) throws Exception{
	    ResponseMsg msg = new ResponseMsg();
	    byte[] bytes = file.getBytes();
	    String contentType = FileUtil.getDateName(file.getOriginalFilename());
	    if (FileUtil.isImage(contentType)) {
	      String path = "upload/news/img/" + FileUtil.getDateString();
	      String uploadDir = request.getSession().getServletContext().getRealPath(path);
	      File dirPath = new File(uploadDir);
	      if (!dirPath.exists()) {
	        dirPath.mkdirs();
	      }
	      String sep = System.getProperty("file.separator");
	      String pathimg = FileUtil.getFileName() + contentType;
	      String filename = path + "/" + pathimg;
	      File uploadedFile = new File(uploadDir + sep + pathimg);

	      FileCopyUtils.copy(bytes, uploadedFile);

	      msg = ResponseMsg.getOk(filename);
	    } else {
	      msg = ResponseMsg.getError("上传文件格式错误");
	    }
	    return msg;
	  }
	  
	  public boolean isvideo(String contentType)
	  {
	    List allowType = Arrays.asList(new String[] { ".avi", ".rmvb", ".rm", ".asf", ".divx", ".mpg", ".mpeg", ".mpe", ".wmv", ".mp4", ".mkv", ".vob", ".wav", ".mp3", ".wma", ".flac", ".ape", ".aac", ".ogg" });
	    return allowType.contains(contentType);
	  }
	  
	  @ResponseBody
	  @RequestMapping(value={"/delimg"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public ResponseMsg delimg(String imgpath, HttpServletRequest request)
	  {
	    ResponseMsg msg = new ResponseMsg();
	    String path = request.getSession().getServletContext().getRealPath("upload");
	    System.out.println(path + imgpath.substring(6));
	    File file = new File(path + imgpath.substring(6));
	    if (file.delete())
	      msg = ResponseMsg.getOk("删除成功");
	    else {
	      msg = ResponseMsg.getError("删除失败");
	    }
	    return msg;
	  }
	

}
