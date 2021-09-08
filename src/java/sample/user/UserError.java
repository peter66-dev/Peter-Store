/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Dell
 */
public class UserError {

    private String userIDError;
    private String fullNameError;
    private String roleIDError;
    private String passwordError;
    private String confirmPasswordError;
    private String emailError;
    private String addressError;
    private String phoneNumberError;
    private String genderError;
    private String bankError;

    public UserError() {
    }

    public UserError(String userIDError, String fullNameError, String roleIDError, String passwordError, String confirmPasswordError, String emailError, String addressError, String phoneNumberError, String genderError, String bankError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.passwordError = passwordError;
        this.confirmPasswordError = confirmPasswordError;
        this.emailError = emailError;
        this.addressError = addressError;
        this.phoneNumberError = phoneNumberError;
        this.genderError = genderError;
        this.bankError = bankError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getPhoneNumberError() {
        return phoneNumberError;
    }

    public void setPhoneNumberError(String phoneNumberError) {
        this.phoneNumberError = phoneNumberError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getBankError() {
        return bankError;
    }

    public void setBankError(String bankError) {
        this.bankError = bankError;
    }

}
