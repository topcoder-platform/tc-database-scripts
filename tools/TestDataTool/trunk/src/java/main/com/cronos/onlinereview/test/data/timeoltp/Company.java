/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;

/**
 * <p>A DTO for a single company account. Corresponds to <code>time_oltp.company</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class Company implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this company.</p>
     */
    private long companyId;

    /**
     * <p>A <code>String</code> providing the name of this company.</p>
     */
    private String name;

    /**
     * <p>A <code>String</code> providing the pass code for this company.</p>
     */
    private String passCode;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this company account is deleted or not.</p>
     */
    private boolean deleted;

    /**
     * <p>Constructs new <code>Company</code> instance. This implementation does nothing.</p>
     */
    public Company() {
    }

    /**
     * <p>Gets the flag indicating whether this company account is deleted or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this company account is deleted or not.
     */
    public boolean getDeleted() {
        return this.deleted;
    }

    /**
     * <p>Sets the flag indicating whether this company account is deleted or not.</p>
     *
     * @param deleted a <code>boolean</code> providing the flag indicating whether this company account is deleted or
     *                not.
     */
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    /**
     * <p>Gets the pass code for this company.</p>
     *
     * @return a <code>String</code> providing the pass code for this company.
     */
    public String getPassCode() {
        return this.passCode;
    }

    /**
     * <p>Sets the pass code for this company.</p>
     *
     * @param passCode a <code>String</code> providing the pass code for this company.
     */
    public void setPassCode(String passCode) {
        this.passCode = passCode;
    }

    /**
     * <p>Gets the name of this company.</p>
     *
     * @return a <code>String</code> providing the name of this company.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the name of this company.</p>
     *
     * @param name a <code>String</code> providing the name of this company.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the ID of this company.</p>
     *
     * @return a <code>long</code> providing the ID of this company.
     */
    public long getCompanyId() {
        return this.companyId;
    }

    /**
     * <p>Sets the ID of this company.</p>
     *
     * @param companyId a <code>long</code> providing the ID of this company.
     */
    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }
}
