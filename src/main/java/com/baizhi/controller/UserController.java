package com.baizhi.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baizhi.entity.User;
import com.baizhi.server.UserService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("selectUsersByStarId")
    @ResponseBody
    public Map<String,Object> selectUsersByStarId(Integer page, Integer rows,String starId){
        return userService.selectUsersByStarId(page,rows,starId);
    }

    @RequestMapping("selectAll")
    @ResponseBody
    public List<User> selectAll(){
        List<User> user = userService.selectAll();
        return user;
    }

    @RequestMapping("export")
//    @ResponseBody
    public void export(HttpServletResponse response){
        List<User> list = userService.export();
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("166班", "学生表"), User.class, list);

        String fileName = "用户报表("+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+").xls";
        //处理中文下载名乱码
        try {
            fileName = new String(fileName.getBytes("gbk"),"iso-8859-1");
            //设置 response
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("content-disposition","attachment;filename="+fileName);
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
