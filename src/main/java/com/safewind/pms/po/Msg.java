package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

/**
 *
 * 返回的Json提示信息Obj
 * Created by 门铎 on 2016/8/23.
 */
@Repository
public class Msg {
    private String code;
    private String msg;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
