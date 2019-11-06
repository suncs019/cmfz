package com.baizhi;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class CmfxApplicationTests {
    @Autowired
private AdminDao adminDao;
    @Test
    void contextLoads() {
        List<Admin> admins = adminDao.selectAll();
        admins.forEach(admin -> System.out.println(admin));

    }





}
