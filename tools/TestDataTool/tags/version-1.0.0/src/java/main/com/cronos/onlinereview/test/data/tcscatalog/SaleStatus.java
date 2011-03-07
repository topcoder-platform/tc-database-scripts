/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing sale statuses. Corresponds to <code>tcs_catalog.sale_status_lu</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public enum SaleStatus {
    
    PAID(1, "Paid"),
    
    UNPAID(2, "Unpaid"),
    
    MARKED_FOR_PURCHASE(3, "Marked for Purchase");

    /**
     * <p>A <code>long</code> providing the ID of this sale status.</p>
     */
    private long saleStatusId;

    /**
     * <p>A <code>String</code> providing the name of this sale status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>SaleStatus</code> instance with specified ID and name.</p>
     *
     * @param saleStatusId a <code>long</code> providing the ID of this sale status.
     * @param name a <code>String</code> providing the name of this sale status.
     */
    private SaleStatus(long saleStatusId, String name) {
        this.saleStatusId = saleStatusId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this sale status.</p>
     *
     * @return a <code>String</code> providing the name of this sale status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this sale status.</p>
     *
     * @return a <code>long</code> providing the ID of this sale status.
     */
    public long getSaleStatusId() {
        return this.saleStatusId;
    }
}
