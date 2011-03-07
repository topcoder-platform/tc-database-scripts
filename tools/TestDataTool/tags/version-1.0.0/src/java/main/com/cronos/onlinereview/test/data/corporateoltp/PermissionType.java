/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.corporateoltp;

/**
 * <p>An enumeration over the permission types. Corresponds to <code>corporate_oltp.permission_type</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum PermissionType {
    
    PROJECT_READ(1),
    
    PROJECT_WRITE(2),
    
    PROJECT_FULL(3),
    
    CONTEST_READ(4),
    
    CONTEST_WRITE(5),
    
    CONTEST_FULL(6);

    /**
     * <p>A <code>long</code> providing the ID of this client status.</p>
     */
    private long id;

    /**
     * <p>Constructs new <code>PermissionType</code> instance.</p>
     * 
     * @param id a <code>long</code> providing the ID of this permission type.
     */
    private PermissionType(long id) {
        this.id = id;
    }

    /**
     * <p>Gets the ID of this permission type.</p>
     *
     * @return a <code>long</code> providing the ID of this permission type.
     */
    public long getId() {
        return this.id;
    }
}
