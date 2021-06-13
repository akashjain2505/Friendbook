
package com.luck.dto;


public class User {
    
    private int user_id;
    private String name;
    private String email;
      private String password;
    private String mobile;
    private String profile_pic;
  
    private int otp;
    private int is_Verify;

    public User(int user_id, String name, String email, String password, String mobile, String profile_pic, int otp, int is_Verify) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.profile_pic = profile_pic;
        this.otp = otp;
        this.is_Verify = is_Verify;
    }

    public User(int user_id, String name, String email, String mobile, String profile_pic, int is_Verify) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.profile_pic = profile_pic;
        this.is_Verify = is_Verify;
    }

    public User(int user_id, String name, String mobile, String password) {
        this.user_id = user_id;
        this.name = name;
        this.mobile = mobile;
        this.password = password;
    }

    
    
      public User(int user_id, String email) {
        this.user_id = user_id;
        this.email = email;
    }
    

    public User(int is_Verify) {
        this.is_Verify = is_Verify;
    }
    

    public User() {
    }
    

    public User(String name, String email, String mobile, String profile_pic, int is_Verify) {
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.profile_pic = profile_pic;
        this.is_Verify = is_Verify;
    }

    public User(String name, String email, String password, String mobile, String profile_pic, int otp, int is_Verify) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.profile_pic = profile_pic;
        this.otp = otp;
        this.is_Verify = is_Verify;
    }

    public User(String name, String email, String password, String mobile, String profile_pic) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.profile_pic = profile_pic;
    }

    
    
    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }

    public int getIs_Verify() {
        return is_Verify;
    }

    public void setIs_Verify(int is_Verify) {
        this.is_Verify = is_Verify;
    }
    
    
    
    
    
    
}
    