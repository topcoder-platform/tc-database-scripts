/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;

/**
 * <p>A DTO for a single user account. Corresponds to <code>time_oltp.user_account</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class UserAccount implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this user account.</p>
     */
    private long userAccountId;

    /**
     * <p>A <code>AccountStatus</code> providing the status of this user account.</p>
     */
    private AccountStatus status;

    /**
     * <p>A <code>String</code> providing the username for this user account.</p>
     */
    private String username;

    /**
     * <p>A <code>String</code> providing the password for this user account.</p>
     */
    private String password;

    /**
     * <p>Constructs new <code>UserAccount</code> instance. This implementation does nothing.</p>
     */
    public UserAccount() {
    }

    /**
     * <p>Gets the password for this user account.</p>
     *
     * @return a <code>String</code> providing the password for this user account.
     */
    public String getPassword() {
        return this.password;
    }

    /**
     * <p>Sets the password for this user account.</p>
     *
     * @param password a <code>String</code> providing the password for this user account.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * <p>Gets the username for this user account.</p>
     *
     * @return a <code>String</code> providing the username for this user account.
     */
    public String getUsername() {
        return this.username;
    }

    /**
     * <p>Sets the username for this user account.</p>
     *
     * @param username a <code>String</code> providing the username for this user account.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * <p>Gets the status of this user account.</p>
     *
     * @return a <code>AccountStatus</code> providing the status of this user account.
     */
    public AccountStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this user account.</p>
     *
     * @param status a <code>AccountStatus</code> providing the status of this user account.
     */
    public void setStatus(AccountStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the ID of this user account.</p>
     *
     * @return a <code>long</code> providing the ID of this user account.
     */
    public long getUserAccountId() {
        return this.userAccountId;
    }

    /**
     * <p>Sets the ID of this user account.</p>
     *
     * @param userAccountId a <code>long</code> providing the ID of this user account.
     */
    public void setUserAccountId(long userAccountId) {
        this.userAccountId = userAccountId;
    }
}
