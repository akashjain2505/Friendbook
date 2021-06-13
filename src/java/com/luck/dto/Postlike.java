
package com.luck.dto;


public class Postlike {
    private int like_id;
    private int sender;
    private int post;

    public Postlike(int like_id, int sender, int post) {
        this.like_id = like_id;
        this.sender = sender;
        this.post = post;
    }

    public Postlike(int sender, int post) {
        this.sender = sender;
        this.post = post;
    }

    
    
    
    public int getLike_id() {
        return like_id;
    }

    public void setLike_id(int like_id) {
        this.like_id = like_id;
    }

    public int getSender() {
        return sender;
    }

    public void setSender(int sender) {
        this.sender = sender;
    }

    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }
    
    
}
