/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luck.dto;

/**
 *
 * @author VSMPRS
 */
public class Post {
    private int post_id;
    private int sender;
    private String date;
    private String caption;
    private String pic;

    public Post(int post_id, int sender, String date, String caption, String pic) {
        this.post_id = post_id;
        this.sender = sender;
        this.date = date;
        this.caption = caption;
        this.pic = pic;
    }

    public Post(String caption, String pic) {
        this.caption = caption;
        this.pic = pic;
    }

    public Post(int post_id, String caption, String pic) {
        this.post_id = post_id;
        this.caption = caption;
        this.pic = pic;
    }

    public Post(int post_id, int sender, String caption, String pic) {
        this.post_id = post_id;
        this.sender = sender;
        this.caption = caption;
        this.pic = pic;
    }

    
    
    
    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getSender() {
        return sender;
    }

    public void setSender(int sender) {
        this.sender = sender;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    
    
    
    
    
    
}
