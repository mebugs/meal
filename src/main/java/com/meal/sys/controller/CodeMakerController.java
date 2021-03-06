package com.meal.sys.controller;

import com.meal.data.response.R;
import com.meal.security.permission.RolePermission;
import com.meal.sys.entity.SysTableCodeConfig;
import com.meal.sys.service.SysCodeMakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  代码生成服务
 * </p>
 *
 * @author 米虫先生/mebugs.com
 * @since 2020-11-27
 */
@RestController
@RequestMapping("/code")
//超级管理员和研发者可以操作 本控制器全部是此权限因此直接在类上配置
@RolePermission(roles="admin,dev")
public class CodeMakerController {
    @Autowired
    private SysCodeMakerService sysCodeMakerService;

    /**
     * 获取数据库的所有表
     * @return
     */
    @GetMapping("/getTableList")
    public R getTableList() {
        return R.ok(sysCodeMakerService.findTableList());
    }

    /**
     * 获取表中的所有字段以及列属性
     * @param tableName
     * @return
     */
    @GetMapping("/getTableColumnList")
    public R getTableColumnList(String tableName) {
        return R.ok(sysCodeMakerService.findColumnList(tableName));
    }

    /**
     * 生成代码
     * @param sysTableCodeConfig
     * @return
     */
    @PostMapping("/make")
    public R makeCode(@RequestBody SysTableCodeConfig sysTableCodeConfig){
        return R.ok(sysCodeMakerService.makeCode(sysTableCodeConfig));
    }
}
