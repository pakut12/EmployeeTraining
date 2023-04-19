/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class ET_Course {

    private String course_id;
    private String topicmain_name;
    private String topicminor_name;
    private String course_name;
    private String course_date_create;

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getCourse_date_create() {
        return course_date_create;
    }

    public void setCourse_date_create(String course_date_create) {
        this.course_date_create = course_date_create;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getTopicmain_name() {
        return topicmain_name;
    }

    public void setTopicmain_name(String topicmain_name) {
        this.topicmain_name = topicmain_name;
    }

    public String getTopicminor_name() {
        return topicminor_name;
    }

    public void setTopicminor_name(String topicminor_name) {
        this.topicminor_name = topicminor_name;
    }
}
