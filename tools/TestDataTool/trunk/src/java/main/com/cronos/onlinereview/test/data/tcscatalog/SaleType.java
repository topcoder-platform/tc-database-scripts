/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing sale types. Corresponds to <code>tcs_catalog.sale_type_lu</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum SaleType {
    
    PAYPAL_PAYFLOW(1, "PayPal PayFlow"),
    
    TC_PURCHASE_ORDER(2, "TC Purchase Order");

    /**
     * <p>A <code>long</code> providing the ID of this sale type.</p>
     */
    private long saleTypeId;

    /**
     * <p>A <code>String</code> providing the name of this sale type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>SaleType</code> instance with specified ID and name.</p>
     *
     * @param saleTypeId a <code>long</code> providing the ID of this sale type.
     * @param name a <code>String</code> providing the name of this sale type.
     */
    private SaleType(long saleTypeId, String name) {
        this.saleTypeId = saleTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this sale type.</p>
     *
     * @return a <code>String</code> providing the name of this sale type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this sale type.</p>
     *
     * @return a <code>long</code> providing the ID of this sale type.
     */
    public long getSaleTypeId() {
        return this.saleTypeId;
    }
}
