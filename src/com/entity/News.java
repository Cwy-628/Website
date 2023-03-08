package com.entity;

/**
 *
 */
public class News {
    String news_id;
    String news_content;
    String news_ptime;
    String controller_id;

    @Override
    public String toString() {
        return "News{" +
                "news_id='" + news_id + '\'' +
                ", news_content='" + news_content + '\'' +
                ", news_ptime='" + news_ptime + '\'' +
                ", controller_id='" + controller_id + '\'' +
                '}';
    }

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public String getNews_ptime() {
        return news_ptime;
    }

    public void setNews_ptime(String news_ptime) {
        this.news_ptime = news_ptime;
    }

    public String getController_id() {
        return controller_id;
    }

    public void setController_id(String controller_id) {
        this.controller_id = controller_id;
    }
}
