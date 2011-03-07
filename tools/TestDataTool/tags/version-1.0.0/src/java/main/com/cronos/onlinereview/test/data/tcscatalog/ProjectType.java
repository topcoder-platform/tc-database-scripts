/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the project types. Corresponds to <code>tcs_catalog.project_type_lu</code> database table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum ProjectType {
    
    COMPONENT(1, "Component"),
    
    APPLICATION(2, "Application"),
    
    STUDIO(3, "Studio");

    /**
     * <p>A <code>long</code> providing the ID of this project type.</p>
     */
    private long projectTypeId;

    /**
     * <p>A <code>String</code> providing the name of this project type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ProjectType</code> instance with specified ID and name.</p>
     *
     * @param projectTypeId a <code>long</code> providing the ID of this project type.
     * @param name a <code>String</code> providing the name of this project type.
     */
    private ProjectType(long projectTypeId, String name) {
        this.projectTypeId = projectTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this project type.</p>
     *
     * @return a <code>String</code> providing the name of this project type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project type.</p>
     *
     * @return a <code>long</code> providing the ID of this project type.
     */
    public long getProjectTypeId() {
        return this.projectTypeId;
    }
}
