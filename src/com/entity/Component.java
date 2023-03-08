package com.entity;

/**
 *
 */
public class Component {
    int component_id;
    String component_type;
    String component_price;
    String component_info;
    String component_comment;
    String sales_volume;
    String component_intro;
    String component_lintro;

    @Override
    public String toString() {
        return "Component{" +
                "component_id=" + component_id +
                ", component_type='" + component_type + '\'' +
                ", component_price='" + component_price + '\'' +
                ", component_info='" + component_info + '\'' +
                ", component_comment='" + component_comment + '\'' +
                ", sales_volume='" + sales_volume + '\'' +
                ", component_intro='" + component_intro + '\'' +
                ", component_lintro='" + component_lintro + '\'' +
                '}';
    }

    public String getComponent_intro() {
        return component_intro;
    }

    public void setComponent_intro(String component_intro) {
        this.component_intro = component_intro;
    }

    public String getComponent_lintro() {
        return component_lintro;
    }

    public void setComponent_lintro(String component_lintro) {
        this.component_lintro = component_lintro;
    }

    public int getComponent_id() {
        return component_id;
    }

    public void setComponent_id(int component_id) {
        this.component_id = component_id;
    }

    public String getComponent_type() {
        return component_type;
    }

    public void setComponent_type(String component_type) {
        this.component_type = component_type;
    }

    public String getComponent_price() {
        return component_price;
    }

    public void setComponent_price(String component_price) {
        this.component_price = component_price;
    }

    public String getComponent_info() {
        return component_info;
    }

    public void setComponent_info(String component_info) {
        this.component_info = component_info;
    }

    public String getComponent_comment() {
        return component_comment;
    }

    public void setComponent_comment(String component_comment) {
        this.component_comment = component_comment;
    }

    public String getSales_volume() {
        return sales_volume;
    }

    public void setSales_volume(String sales_volume) {
        this.sales_volume = sales_volume;
    }

}
