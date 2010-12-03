package com.topcoder.web.ejb.forums;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

public class ForumsBean extends BaseEJB {

    public void createMatchForum(int roundID) throws RowNotFoundException {
    }

    public String[] getCategoryNames() {
        return new String[0];
    }

    public int getThreadMessageCount(int threadID) {
        return 0;
    }

    public void assignRole(long userID, long groupID) {
    }

    public void assignRole(long userID, String groupName) {
    }

    public void addCategoryPerms(long userID, long forumCategoryID, long[] perms) {
    }

    public void removeRole(long userID, long groupID) {
    }

    public void removeRole(long userID, String groupName) {
    }

    public void setPublic(long categoryID, boolean isPublic) throws ForumCategoryNotFoundException, UnauthorizedException {
    }

    public boolean isPublic(long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException {
        return true;
    }

    public void closeCategory(long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException {
    }

    public boolean canReadCategory(long userID, long categoryID) throws ForumCategoryNotFoundException {
        return true;
    }

    public void createCategoryWatch(long userID, long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException {
    }

    public void createCategoryWatches(long userID, long[] categoryIDs) throws ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException {
    }

    public void deleteCategoryWatch(long userID, long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException {
    }

    public ArrayList getSoftwareForumCategoryData(long categoryID) throws ForumCategoryNotFoundException {
        ArrayList data = new ArrayList();
        data.add(new Date());
        data.add("1");
        return data;
    }

    public String[][] getSoftwareCategoriesData() {
        return null;
    }

    public String[][] getWatchedSoftwareCategoriesData(long userID, boolean isWatched) {
        return null;
    }

    public String[][] getSoftwareRolesData(long userID) {
        return null;
    }

    public String[][] getAllSoftwareRolesData() {
        return null;
    }

    public long createSoftwareComponentForums(String componentName, long componentID,
                                              long versionID, long phaseID, long componentStatusID, long rootCategoryID, String description,
                                              String versionText, boolean isPublic) throws Exception {
        return 0;
    }

    private void createSoftwareComponentPermissions(ForumCategory category, boolean isPublic) throws Exception {
    }

    public long getComponentVersionPhase(long compVersID) {
        return 0;
    }

    public Hashtable getComponentVersionPhases(long[] compVersIDs) {
        return null;
    }

    public String getComponentVersionText(long compVersID) {
        return "";
    }

    public long getComponentRootCategory(long compID) {
        return 0;
    }

    public Hashtable getComponentRootCategories(long[] compIDs) {
        return null;
    }

    public HashSet getApprovedComponents(long[] compIDs) {
        return null;
    }

    public void updateComponentVersion(long categoryID, String versionText) throws Exception {
    }

    public long getSoftwareComponentID(ForumCategory category) throws SQLException {
        return 0;
    }

    public void deleteOrphanedAttachments() {
    }

    public void convertTCSPerms() {
    }

    private long createForum(long categoryID, String name) throws Exception {
        return 0;
    }

    private long createForum(long categoryID, String name, String description) throws Exception {
        return 0;
    }

    public long createMarathonForum(long roundID, String name) {
        return 0;
    }

    public long createStudioForum(String name) {
        return 0;
    }
    
    public void createForumWatch(long userID, long forumID) throws Exception {
    }

    private void logException(Exception e, String msg) {
    }
}

class JiveForumCategoryComparator implements Comparator {
    private String sortField;
    private int sortOrder;

    public JiveForumCategoryComparator(String sortField, int sortOrder) {
        this.sortField = sortField;
        this.sortOrder = sortOrder;
    }

    public final int compare(Object o1, Object o2) {
        return 0;
    }
}

class JiveGroupComparator implements Comparator {
    private String sortField;
    private int sortOrder;

    public JiveGroupComparator(String sortField, int sortOrder) {
        this.sortField = sortField;
        this.sortOrder = sortOrder;
    }

    public final int compare(Object o1, Object o2) {
        return 0;
    }
}
