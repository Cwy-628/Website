package com.entity;

/**
 *
 */
public class Orders {
    int orders_id;
    int component_id;
    String controller_id;
    String customer_id;
    String buy_time;
    String orders_state;
    String orders_info;
    String orders_num;

    public String getOrders_num() {
        return orders_num;
    }

    public void setOrders_num(String orders_num) {
        this.orders_num = orders_num;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orders_id=" + orders_id +
                ", component_id=" + component_id +
                ", controller_id='" + controller_id + '\'' +
                ", customer_id='" + customer_id + '\'' +
                ", buy_time='" + buy_time + '\'' +
                ", orders_state='" + orders_state + '\'' +
                ", orders_info='" + orders_info + '\'' +
                ", orders_num='" + orders_num + '\'' +
                '}';
    }

    public int getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(int orders_id) {
        this.orders_id = orders_id;
    }

    public int getComponent_id() {
        return component_id;
    }

    public void setComponent_id(int component_id) {
        this.component_id = component_id;
    }

    public String getController_id() {
        return controller_id;
    }

    public void setController_id(String controller_id) {
        this.controller_id = controller_id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getBuy_time() {
        return buy_time;
    }

    public void setBuy_time(String buy_time) {
        this.buy_time = buy_time;
    }

    public String getOrders_state() {
        return orders_state;
    }

    public void setOrders_state(String orders_state) {
        this.orders_state = orders_state;
    }

    public String getOrders_info() {
        return orders_info;
    }

    public void setOrders_info(String orders_info) {
        this.orders_info = orders_info;
    }
}
