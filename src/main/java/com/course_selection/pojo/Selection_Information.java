package com.course_selection.pojo;

import java.io.Serializable;

public class Selection_Information implements Serializable {
    private int id;
    private int sid;
    private String sname;
    private int eid;
    private String ename;
    private int weeknum;
    private int day;
    private int section;
    private int lab;
    private int seat;
    private int grade;

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Selection_Information(int id, int sid, String sname, int eid, String ename, int weeknum, int day, int section, int lab, int seat,int grade) {
        this.id = id;
        this.sid = sid;
        this.sname=sname;
        this.eid = eid;
        this.ename = ename;
        this.weeknum = weeknum;
        this.day = day;
        this.section = section;
        this.lab = lab;
        this.seat = seat;
        this.grade=0;
    }
    public Selection_Information(){}

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "Selection_Information{" +
                "id=" + id +
                ", sid=" + sid +
                ", eid=" + eid +
                ", ename='" + ename + '\'' +
                ", weeknum=" + weeknum +
                ", day=" + day +
                ", section='" + section + '\'' +
                ", lab=" + lab +
                ", seat=" + seat +
                ", grade=" + grade +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public int getWeeknum() {
        return weeknum;
    }

    public void setWeeknum(int weeknum) {
        this.weeknum = weeknum;
    }

    public int getSection() {
        return section;
    }

    public void setSection(int section) {
        this.section = section;
    }

    public int getLab() {
        return lab;
    }

    public void setLab(int lab) {
        this.lab = lab;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }
}
