package com.safewind.pms.po;

public class RepairApplyWithBLOBs extends RepairApply {
    private String preContent;

    private String check1Content;

    private String check2Content;

    private String check3Content;

    private String actRepairContent;

    public String getPreContent() {
        return preContent;
    }

    public void setPreContent(String preContent) {
        this.preContent = preContent == null ? null : preContent.trim();
    }

    public String getCheck1Content() {
        return check1Content;
    }

    public void setCheck1Content(String check1Content) {
        this.check1Content = check1Content == null ? null : check1Content.trim();
    }

    public String getCheck2Content() {
        return check2Content;
    }

    public void setCheck2Content(String check2Content) {
        this.check2Content = check2Content == null ? null : check2Content.trim();
    }

    public String getCheck3Content() {
        return check3Content;
    }

    public void setCheck3Content(String check3Content) {
        this.check3Content = check3Content == null ? null : check3Content.trim();
    }

    public String getActRepairContent() {
        return actRepairContent;
    }

    public void setActRepairContent(String actRepairContent) {
        this.actRepairContent = actRepairContent == null ? null : actRepairContent.trim();
    }
}