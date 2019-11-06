package com.baizhi.server;

import com.baizhi.dao.StarDao;
import com.baizhi.entity.Star;
import lombok.val;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class StarSerciceImpl implements StarSercice{
    @Autowired
    private StarDao starDao;

    @Override
    public void edit(Star star) {
        if ("".equals(star.getPhoto())){
            star.setPhoto(null);
        }
        try {
            starDao.updateByPrimaryKeySelective(star);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("修改失败");
        }
    }

    @Override
    public List<Star> getAllStarForSelect() {
        List<Star> list = starDao.selectAll();
        return list;
    }

    @Override
    public String add(Star star) {
        star.setId(UUID.randomUUID().toString()).setBir(new Date());
        val i = starDao.insertSelective(star);
        if (i == 0) {
            throw new RuntimeException("添加失败");
        }
        return star.getId();
    }


    @Override
    public Map<String, Object> selectAll(Integer page, Integer rows) {
        Star star =new Star();
        RowBounds rowBounds = new RowBounds((page-1)*rows,rows);
        List<Star> list = starDao.selectByRowBounds(star, rowBounds);
        int count = starDao.selectCount(star);
        Map<String,Object> map = new HashMap<>();
        map.put("page",page);
        map.put("rows",list);
        map.put("total",count%rows==0?count/rows:count/rows+1);
        map.put("records",count);
        return map;
    }
}
