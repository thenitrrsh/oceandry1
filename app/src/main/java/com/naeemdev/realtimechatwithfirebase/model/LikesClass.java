package com.naeemdev.realtimechatwithfirebase.model;

import java.util.Date;

public class LikesClass {

    public Date user_liked;
    String user_likes;

    public LikesClass() {
    }

    public LikesClass(String user_likes, Date user_liked) {
        this.user_likes = user_likes;
        this.user_liked = user_liked;
    }

    public String getUser_likes() {
        return user_likes;
    }

    public void setUser_likes(String user_likes) {
        this.user_likes = user_likes;
    }

    public Date getUser_liked() {
        return user_liked;
    }

    public void setUser_liked(Date user_liked) {
        this.user_liked = user_liked;
    }
}
