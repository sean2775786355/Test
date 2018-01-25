package com.safewind.pms.po;

/**
 * Created by lxy on 2016/11/11.
 */
public class CwbtMaintenanceAll {
    private String A;
    private String B;
    private String C;
    private String D;
    private String E;
    private String F;
    private String G;
    private String H;

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("CwbtMaintenanceAll{");
        sb.append("A='").append(A).append('\'');
        sb.append(", B='").append(B).append('\'');
        sb.append(", C='").append(C).append('\'');
        sb.append(", D='").append(D).append('\'');
        sb.append(", E='").append(E).append('\'');
        sb.append(", F='").append(F).append('\'');
        sb.append(", G='").append(G).append('\'');
        sb.append(", H='").append(H).append('\'');
        sb.append('}');
        return sb.toString();
    }

    public String getA() {
        return A;
    }

    public void setA(String a) {
        A = a;
    }

    public String getB() {
        return B;
    }

    public void setB(String b) {
        B = b;
    }

    public String getC() {
        return C;
    }

    public void setC(String c) {
        C = c;
    }

    public String getD() {
        return D;
    }

    public void setD(String d) {
        D = d;
    }

    public String getE() {
        return E;
    }

    public void setE(String e) {
        E = e;
    }

    public String getF() {
        return F;
    }

    public void setF(String f) {
        F = f;
    }

    public String getG() {
        return G;
    }

    public void setG(String g) {
        G = g;
    }

    public String getH() {
        return H;
    }

    public void setH(String h) {
        H = h;
    }
}
