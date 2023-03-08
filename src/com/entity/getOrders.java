package com.entity;

/**
 *
 */
public class getOrders extends Orders{
    String component_info;
    String customer_name;

    @Override
    public String toString() {
        return "getOrders{" +
                "orders_id=" + orders_id +
                ", component_id=" + component_id +
                ", controller_id='" + controller_id + '\'' +
                ", customer_id='" + customer_id + '\'' +
                ", buy_time='" + buy_time + '\'' +
                ", orders_state='" + orders_state + '\'' +
                ", orders_info='" + orders_info + '\'' +
                ", component_info='" + component_info + '\'' +
                ", customer_name='" + customer_name + '\'' +
                '}';
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getComponent_info() {
        return component_info;
    }

    public void setComponent_info(String component_info) {
        this.component_info = component_info;
    }
}
