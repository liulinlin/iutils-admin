package com.david.sys.entity.enums;

/**
 * 消息类型
 * @author david.cn
 */
public enum MsgEnum {

    mail("邮件"), notice("通知");

    private final String info;

    private MsgEnum(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }

}
