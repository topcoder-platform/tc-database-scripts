/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.corporateoltp;

/**
 * <p>A DTO for a single permission for accessing TC Direct project or contest. Corresponds to
 * <code>corporate_oltp.user_permission_grant</code> database table. </p>
 * 
 * @author isv
 * @version 1.0
 */
public class UserPermissionGrant {

    /**
     * <p>A <code>long</code> providing the ID of this permission grant.</p>
     */
    private long userPermissionGrantId;

    /**
     * <p>A <code>long</code> providing the ID of a user a permission is granted to.</p>
     */
    private long userId;

    /**
     * <p>A <code>long</code> providing the ID of a resource a permission is granting access for.</p>
     */
    private long resourceId;

    /**
     * <p>A <code>PermissionType</code> providing the type of the permission.</p>
     */
    private PermissionType permissionType;

    /**
     * <p>Constructs new <code>UserPermissionGrant</code> instance. This implementation does nothing.</p>
     */
    public UserPermissionGrant() {
    }

    /**
     * <p>Gets the type of the permission.</p>
     *
     * @return a <code>PermissionType</code> providing the type of the permission.
     */
    public PermissionType getPermissionType() {
        return this.permissionType;
    }

    /**
     * <p>Sets the type of the permission.</p>
     *
     * @param permissionType a <code>PermissionType</code> providing the type of the permission.
     */
    public void setPermissionType(PermissionType permissionType) {
        this.permissionType = permissionType;
    }

    /**
     * <p>Gets the ID of a resource a permission is granting access for.</p>
     *
     * @return a <code>long</code> providing the ID of a resource a permission is granting access for.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the ID of a resource a permission is granting access for.</p>
     *
     * @param resourceId a <code>long</code> providing the ID of a resource a permission is granting access for.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the ID of a user a permission is granted to.</p>
     *
     * @return a <code>long</code> providing the ID of a user a permission is granted to.
     */
    public long getUserId() {
        return this.userId;
    }

    /**
     * <p>Sets the ID of a user a permission is granted to.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user a permission is granted to.
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>Gets the ID of this permission grant.</p>
     *
     * @return a <code>long</code> providing the ID of this permission grant.
     */
    public long getUserPermissionGrantId() {
        return this.userPermissionGrantId;
    }

    /**
     * <p>Sets the ID of this permission grant.</p>
     *
     * @param userPermissionGrantId a <code>long</code> providing the ID of this permission grant.
     */
    public void setUserPermissionGrantId(long userPermissionGrantId) {
        this.userPermissionGrantId = userPermissionGrantId;
    }
}
