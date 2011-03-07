/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

/**
 * <p>An enumeration over the existing client statuses. Corresponds to <code>time_oltp.client_status</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum ClientStatus {
    
    ACTIVE(1, "Active");

    /**
     * <p>A <code>long</code> providing the ID of this client status.</p>
     */
    private long id;

    /**
     * <p>A <code>String</code> providing the name of this client status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ClientStatus</code> instance.</p>
     * 
     * @param id a <code>long</code> providing the ID of this client status.
     * @param name a <code>String</code> providing the name of this client status.
     */
    private ClientStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>Gets the name of this client status.</p>
     *
     * @return a <code>String</code> providing the name of this client status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this client status.</p>
     *
     * @return a <code>long</code> providing the ID of this client status.
     */
    public long getId() {
        return this.id;
    }
}
