/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class ET_Group {

    private String group_id;
    private String main_topicmain_id;
    private String main_topicmain_name;
    private String main_topicminor_id;
    private String main_topicminor_name;
    private String main_course_id;
    private String main_course_name;

    public String getMain_course_id() {
        return main_course_id;
    }

    public void setMain_course_id(String main_course_id) {
        this.main_course_id = main_course_id;
    }

    public String getMain_course_name() {
        return main_course_name;
    }

    public void setMain_course_name(String main_course_name) {
        this.main_course_name = main_course_name;
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }

    public String getMain_topicmain_id() {
        return main_topicmain_id;
    }

    public void setMain_topicmain_id(String main_topicmain_id) {
        this.main_topicmain_id = main_topicmain_id;
    }

    public String getMain_topicmain_name() {
        return main_topicmain_name;
    }

    public void setMain_topicmain_name(String main_topicmain_name) {
        this.main_topicmain_name = main_topicmain_name;
    }

    public String getMain_topicminor_id() {
        return main_topicminor_id;
    }

    public void setMain_topicminor_id(String main_topicminor_id) {
        this.main_topicminor_id = main_topicminor_id;
    }

    public String getMain_topicminor_name() {
        return main_topicminor_name;
    }

    public void setMain_topicminor_name(String main_topicminor_name) {
        this.main_topicminor_name = main_topicminor_name;
    }
}
