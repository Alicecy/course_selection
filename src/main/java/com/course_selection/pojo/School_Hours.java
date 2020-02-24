package com.course_selection.pojo;

import java.io.Serializable;
import java.util.Date;

public class School_Hours implements Serializable {
    int id;
    Date date;

    @Override
    public String toString()  {
        return "School_Hours{" +
                "id=" + id +
                ", date='" + date + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
