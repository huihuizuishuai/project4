package org.qhit.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil{
  public static String saveFile(String folderPath, MultipartFile file)
  {
    String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
    String fileName = System.currentTimeMillis() + type;

    String fulPath = folderPath + "/" + fileName;

    File destFile = new File(fulPath);
    try
    {
      FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);
    } catch (IOException e) {
      destFile.delete();
      e.printStackTrace();
    }
    return fileName;
  }

  public static String getFileName()
  {
    StringBuffer number = new StringBuffer();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    number.append(sdf.format(new Date()));
    number.append(new Random().nextInt(1000000));
    return number.toString();
  }

  public static String getDateName(String fileName)
  {
    if ((fileName != null) && (fileName.length() > 0)) {
      int dot = fileName.lastIndexOf(46);
      if ((dot > -1) && (dot < fileName.length() - 1)) {
        return fileName.substring(dot);
      }
    }
    return fileName;
  }

  public static String getDateString()
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    return sdf.format(new Date());
  }

  public static boolean isImage(String contentType)
  {
    List allowType = Arrays.asList(new String[] { ".bmp", ".png", ".gif", ".jpg", ".jpeg", ".pjpeg", "image/bmp", "image/png", "image/gif", "image/jpg", "image/jpeg", "image/pjpeg", "application/octet-stream" });
    return allowType.contains(contentType);
  }
}