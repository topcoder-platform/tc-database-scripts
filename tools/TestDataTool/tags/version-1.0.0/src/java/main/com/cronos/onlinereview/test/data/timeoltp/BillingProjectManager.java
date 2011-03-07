/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;

/**
 * <p>A DTO for a single billing account manager. Corresponds to <code>time_oltp.project_manager</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class BillingProjectManager implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of a project this manager is associated to.</p>
     */
    private long projectId;

    /**
     * <p>A <code>UserAccount</code> providing the details for user account associated with this manager.</p>
     */
    private UserAccount userAccount;

    /**
     * <p>A <code>double</code> providing the pay rate for this manager.</p>
     */
    private double payRate;

    /**
     * <p>A <code>double</code> providing the cost for this manager.</p>
     */
    private double cost;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this manager account is active or not.</p>
     */
    private boolean active;

    /**
     * <p>Constructs new <code>BillingProjectManager</code> instance. This implementation does nothing.</p>
     */
    public BillingProjectManager() {
    }

    /**
     * <p>Gets the flag indicating whether this manager account is active or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this manager account is active or not.
     */
    public boolean getActive() {
        return this.active;
    }

    /**
     * <p>Sets the flag indicating whether this manager account is active or not.</p>
     *
     * @param active a <code>boolean</code> providing the flag indicating whether this manager account is active or
     *               not.
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * <p>Gets the cost for this manager.</p>
     *
     * @return a <code>double</code> providing the cost for this manager.
     */
    public double getCost() {
        return this.cost;
    }

    /**
     * <p>Sets the cost for this manager.</p>
     *
     * @param cost a <code>double</code> providing the cost for this manager.
     */
    public void setCost(double cost) {
        this.cost = cost;
    }

    /**
     * <p>Gets the pay rate for this manager.</p>
     *
     * @return a <code>double</code> providing the pay rate for this manager.
     */
    public double getPayRate() {
        return this.payRate;
    }

    /**
     * <p>Sets the pay rate for this manager.</p>
     *
     * @param payRate a <code>double</code> providing the pay rate for this manager.
     */
    public void setPayRate(double payRate) {
        this.payRate = payRate;
    }

    /**
     * <p>Gets the ID of a project this manager is associated to.</p>
     *
     * @return a <code>long</code> providing the ID of a project this manager is associated to.
     */
    public long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project this manager is associated to.</p>
     *
     * @param projectId a <code>long</code> providing the ID of a project this manager is associated to.
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the details for user account associated with this manager.</p>
     *
     * @return a <code>UserAccount</code> providing the details for user account associated with this manager.
     */
    public UserAccount getUserAccount() {
        return this.userAccount;
    }

    /**
     * <p>Sets the details for user account associated with this manager.</p>
     *
     * @param userAccount a <code>UserAccount</code> providing the details for user account associated with this
     *                    manager.
     */
    public void setUserAccount(UserAccount userAccount) {
        this.userAccount = userAccount;
    }
}
