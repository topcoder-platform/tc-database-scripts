/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data;

/**
 * <p>A DTO for single user account.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class TopCoderUser {

    /**
     * <p>Constructs new <code>TopCoderUser</code> instance. This implementation does nothing.</p>
     */
    public TopCoderUser() {
    }

    /**
     * <p>A <code>long</code> providing the user ID.</p>
     */
    private long userId;

    /**
     * <p>A <code>String</code> providing the user handle.</p>
     */
    private String handle;

    /**
     * <p>A <code>String</code> providing the first name for user.</p>
     */
    private String firstName;

    /**
     * <p>A <code>String</code> providing the last name for user.</p>
     */
    private String lastName;

    /**
     * <p>A <code>char</code> providing the status of the user.</p>
     */
    private char status;

    /**
     * <p>Gets the status of the user.</p>
     *
     * @return a <code>char</code> providing the status of the user.
     */
    public char getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of the user.</p>
     *
     * @param status a <code>char</code> providing the status of the user.
     */
    public void setStatus(char status) {
        this.status = status;
    }

    /**
     * <p>Gets the last name for user.</p>
     *
     * @return a <code>String</code> providing the last name for user.
     */
    public String getLastName() {
        return this.lastName;
    }

    /**
     * <p>Sets the last name for user.</p>
     *
     * @param lastName a <code>String</code> providing the last name for user.
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * <p>Gets the first name for user.</p>
     *
     * @return a <code>String</code> providing the first name for user.
     */
    public String getFirstName() {
        return this.firstName;
    }

    /**
     * <p>Sets the first name for user.</p>
     *
     * @param firstName a <code>String</code> providing the first name for user.
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * <p>Gets the user handle.</p>
     *
     * @return a <code>String</code> providing the user handle.
     */
    public String getHandle() {
        return this.handle;
    }

    /**
     * <p>Sets the user handle.</p>
     *
     * @param handle a <code>String</code> providing the user handle.
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * <p>Gets the user ID.</p>
     *
     * @return a <code>long</code> providing the user ID.
     */
    public long getUserId() {
        return this.userId;
    }

    /**
     * <p>Sets the user ID.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }
}
