package com.david.common.controller;

import com.david.common.ResultVo;
import com.david.common.config.JConfig;
import com.david.common.utils.JFileUtils;
import com.david.common.utils.JUploadUtils;
import com.david.common.utils.UserUtils;
import com.david.common.utils.qiniu.QiniuApi;
import com.david.sys.entity.User;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

/**
 * 上传控制器
 *
 * @author David
 */
@RestController
@RequestMapping(value = "${adminPath}/upload")
public class UploadController extends BaseController {

    /**
     * 上传文件
     *
     * @param file
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = {"local"}, method = RequestMethod.POST)
    public String uploadFile(
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletResponse response, HttpServletRequest request) {
        ResultVo resultVo = null;
        try {
            String fileName = file.getOriginalFilename();
            File targetFile = JUploadUtils.save(file, request);
            resultVo = new ResultVo(ResultVo.SUCCESS, "0", "上传成功",
                    JConfig.getConfig(JConfig.FILEUPLOAD) + "/" + targetFile.getName());
        } catch (Exception e) {
            e.printStackTrace();
            resultVo = new ResultVo(ResultVo.FAILURE, "-1", "上传失败", null);
        }
        return renderString(response, resultVo);
    }

    /**
     * 上传Base64的图片
     *
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = {"base64"}, method = RequestMethod.POST)
    public String uploadFileToBase64(
            @RequestParam(value = "data", required = true) String data,
            HttpServletResponse response, HttpServletRequest request) {
        ResultVo resultVo = null;
        try {
            // 获取本地存储路径
            String path = request.getSession().getServletContext()
                    .getRealPath(JConfig.getConfig(JConfig.FILEUPLOAD));
            String ip = getRemoteAddr(request);
            // 取得IP地址+时间戳 作为文件名 防止文件名重复
            String randomFileName = ip + "_" + System.currentTimeMillis();
            // 设定文件名称
            String fileName = randomFileName + ".png";
            File targetFile = new File(path);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            File file = new File(path + "/" + fileName);
            JFileUtils.writeByteArrayToFile(file, Base64.decodeBase64(data));
            resultVo = new ResultVo(ResultVo.SUCCESS, "1", null,
                    JConfig.getConfig(JConfig.FILEUPLOAD) + "/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            resultVo = new ResultVo(ResultVo.FAILURE, "0", "服务器异常", null);
        }
        return renderString(response, resultVo);
    }

}
