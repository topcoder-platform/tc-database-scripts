/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.corporateoltp;

import com.cronos.onlinereview.test.data.User;
import com.cronos.onlinereview.test.data.timeoltp.BillingProject;

import java.io.Serializable;

/**
 * <p>A DTO for a single TC Direct project. Corresponds to <code>corporate_oltp.tc_direct_project</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public class TcDirectProject implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this project.</p>
     */
    private long tcDirectProjectId;

    /**
     * <p>A <code>String</code> providing the name of this project.</p>
     */
    private String name;

    /**
     * <p>A <code>String</code> providing the description of this project.</p>
     */
    private String description;

    /**
     * <p>A <code>User</code> providing the user account for creator of this project.</p>
     */
    private User owner;

    /**
     * <p>A <code>TcDirectProjectStatus</code> providing the status of this project.</p>
     */
    private TcDirectProjectStatus status;

    /**
     * <p>A <code>BillingProject</code> providing the billing account which this project is associated with.</p>
     */
    private BillingProject billingAccount;

    /**
     * <p>Constructs new <code>TcDirectProject</code> instance. This implementation does nothing.</p>
     */
    public TcDirectProject() {
    }

    /**
     * <p>Gets the status of this project.</p>
     *
     * @return a <code>TcDirectProjectStatus</code> providing the status of this project.
     */
    public TcDirectProjectStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this project.</p>
     *
     * @param status a <code>TcDirectProjectStatus</code> providing the status of this project.
     */
    public void setStatus(TcDirectProjectStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the description of this project.</p>
     *
     * @return a <code>String</code> providing the description of this project.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this project.</p>
     *
     * @param description a <code>String</code> providing the description of this project.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the name of this project.</p>
     *
     * @return a <code>String</code> providing the name of this project.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the name of this project.</p>
     *
     * @param name a <code>String</code> providing the name of this project.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the ID of this project.</p>
     *
     * @return a <code>long</code> providing the ID of this project.
     */
    public long getTcDirectProjectId() {
        return this.tcDirectProjectId;
    }

    /**
     * <p>Sets the ID of this project.</p>
     *
     * @param tcDirectProjectId a <code>long</code> providing the ID of this project.
     */
    public void setTcDirectProjectId(long tcDirectProjectId) {
        this.tcDirectProjectId = tcDirectProjectId;
    }

    /**
     * <p>Gets the billing account which this project is associated with.</p>
     *
     * @return a <code>BillingProject</code> providing the billing account which this project is associated with.
     */
    public BillingProject getBillingAccount() {
        return this.billingAccount;
    }

    /**
     * <p>Sets the billing account which this project is associated with.</p>
     *
     * @param billingAccount a <code>BillingProject</code> providing the billing account which this project is
     *                       associated with.
     */
    public void setBillingAccount(BillingProject billingAccount) {
        this.billingAccount = billingAccount;
    }

    /**
     * <p>Gets the user account for creator of this project.</p>
     *
     * @return a <code>User</code> providing the user account for creator of this project.
     */
    public User getOwner() {
        return this.owner;
    }

    /**
     * <p>Sets the user account for creator of this project.</p>
     *
     * @param owner a <code>User</code> providing the user account for creator of this project.
     */
    public void setOwner(User owner) {
        this.owner = owner;
    }
}
