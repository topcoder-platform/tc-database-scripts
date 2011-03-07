/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.generator;

import com.cronos.onlinereview.test.data.TopCoderUser;
import com.cronos.onlinereview.test.data.User;
import com.cronos.onlinereview.test.data.corporateoltp.TcDirectProject;
import com.cronos.onlinereview.test.data.corporateoltp.UserPermissionGrant;
import com.cronos.onlinereview.test.data.tcscatalog.Catalog;
import com.cronos.onlinereview.test.data.tcscatalog.Component;
import com.cronos.onlinereview.test.data.tcscatalog.ComponentVersion;
import com.cronos.onlinereview.test.data.tcscatalog.ContestSale;
import com.cronos.onlinereview.test.data.tcscatalog.Phase;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseCriteriaType;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseType;
import com.cronos.onlinereview.test.data.tcscatalog.Project;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectInfoType;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectSpec;
import com.cronos.onlinereview.test.data.tcscatalog.Resource;
import com.cronos.onlinereview.test.data.tcscatalog.ResourceInfoType;
import com.cronos.onlinereview.test.data.tcscatalog.Review;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewComment;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewItem;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewItemComment;
import com.cronos.onlinereview.test.data.tcscatalog.ScreeningTask;
import com.cronos.onlinereview.test.data.tcscatalog.Submission;
import com.cronos.onlinereview.test.data.tcscatalog.TechnologyType;
import com.cronos.onlinereview.test.data.tcscatalog.Upload;
import com.cronos.onlinereview.test.data.timeoltp.BillingProject;
import com.cronos.onlinereview.test.data.timeoltp.BillingProjectManager;
import com.cronos.onlinereview.test.data.timeoltp.BillingProjectWorker;
import com.cronos.onlinereview.test.data.timeoltp.Client;
import com.cronos.onlinereview.test.data.timeoltp.Company;
import com.cronos.onlinereview.test.data.timeoltp.PaymentTerms;
import com.cronos.onlinereview.test.data.timeoltp.UserAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * <p>A class generating the SQL statements for inserting the test data into database tables to represent a single
 * client in <code>Time Tracker</code> application.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class TestDataSQLConverter {

    /**
     * <p>A <code>String</code> providing the default ID for the user to be used as project creator.</p>
     */
    public static final String DEFAULT_PROJECT_AUTHOR = "132456";

    /**
     * <p>Constructs new <code>TestDataSQLConverter</code> instance. This implementation does nothing.</p>
     */
    public TestDataSQLConverter() {
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified payment
     * terms and outputs them to specified destination.</p>
     *
     * @param paymentTerms a <code>PaymentTerms</code> providing the specification of the payment terms to generate SQL
     *        statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(PaymentTerms paymentTerms, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO payment_terms (payment_terms_id, description, creation_date, creation_user, "
              + "modification_date, modification_user, active, term) "
              + "VALUES ({0}, ''{1}'', CURRENT, {2}, CURRENT, {3}, {4}, {5});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(paymentTerms.getPaymentTermsId()),
                                          paymentTerms.getDescription(),
                                          DEFAULT_PROJECT_AUTHOR, 
                                          DEFAULT_PROJECT_AUTHOR, 
                                          paymentTerms.getActive() ? "1" : "0",
                                          paymentTerms.getTerm());
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified client
     * and outputs them to specified destination.</p>
     *
     * @param company a <code>Client</code> providing the specification of the company to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(Company company, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO company (company_id, name, passcode, is_deleted, creation_date, creation_user, "
              + "modification_date, modification_user) "
              + "VALUES ({0}, ''{1}'', ''{2}'', {3}, CURRENT, {4}, CURRENT, {5});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(company.getCompanyId()),
                                          company.getName(),
                                          company.getPassCode(),
                                          company.getDeleted() ? "1" : "0",
                                          DEFAULT_PROJECT_AUTHOR,
                                          DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified client
     * and outputs them to specified destination.</p>
     *
     * @param client a <code>Client</code> providing the specification of the client to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     * @throws IOException if an I/O error occurs.
     */
    public void generateSQLStatements(Client client, PrintWriter out) throws IOException {
        final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (client != null) {
            final String SQL_TEMPLATE
                    = "INSERT INTO client (client_id, name, company_id, payment_term_id, status, salestax, start_date, "
                      + "end_date, code_name, is_deleted, client_status_id, creation_date, creation_user, "
                      + "modification_date, modification_user) " +
                      "VALUES ({0}, ''{1}'', {2}, {3}, {4}, {5}, ''{6}'', ''{7}'', ''{8}'', {9}, {10}, "
                      + "CURRENT, {11}, CURRENT, {12});";
            String sql = MessageFormat.format(SQL_TEMPLATE, 
                                              String.valueOf(client.getClientId()), 
                                              client.getName(), 
                                              String.valueOf(client.getCompany().getCompanyId()), 
                                              String.valueOf(client.getPaymentTerms().getPaymentTermsId()), 
                                              1, 
                                              String.valueOf(client.getSalesTax()), 
                                              dateFormat.format(client.getStartDate()),
                                              dateFormat.format(client.getEndDate()),
                                              client.getCodeName(),
                                              client.getDeleted() ? "1" : "0",
                                              String.valueOf(client.getStatus().getId()), 
                                              DEFAULT_PROJECT_AUTHOR, 
                                              DEFAULT_PROJECT_AUTHOR);
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified billing
     * project and outputs them to specified destination.</p>
     *
     * @param billingProject a <code>BillingProject</code> providing the specification of the billing project to
     *        generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(BillingProject billingProject, PrintWriter out) {
        final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        final String SQL_TEMPLATE
            = "INSERT INTO project (project_id, company_id, name, active, sales_tax, po_box_number, payment_terms_id, "
              + "description, start_date, end_date, project_status_id, client_id, parent_project_id, is_deleted, "
              + "is_manual_prize_setting, budget, creation_date, creation_user, modification_date, modification_user) "
              + "VALUES ({0}, {1}, ''{2}'', {3}, {4}, ''{5}'', {6}, ''{7}'', ''{8}'', ''{9}'', {10}, {11}, {12}, {13}, "
              + "{14}, {15}, CURRENT, {16}, CURRENT, {17});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(billingProject.getBillingProjectId()),
                                          String.valueOf(billingProject.getCompanyId()),
                                          billingProject.getName(),
                                          billingProject.getActive() ? "1" : "0",
                                          String.valueOf(billingProject.getSalesTax()),
                                          billingProject.getPoBoxNumber(),
                                          String.valueOf(billingProject.getPaymentTermsId()),
                                          billingProject.getDescription(),
                                          dateFormat.format(billingProject.getStartDate()),
                                          dateFormat.format(billingProject.getEndDate()),
                                          String.valueOf(billingProject.getStatus().getId()),
                                          String.valueOf(billingProject.getClientId()),
                                          String.valueOf(billingProject.getParentProjectId()),
                                          billingProject.getDeleted() ? "1" : "0",
                                          billingProject.getManualPrizeSetting() ? "1" : "0",
                                          String.valueOf(billingProject.getBudget()),
                                          DEFAULT_PROJECT_AUTHOR,
                                          DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
        final String SQL_TEMPLATE2
            = "INSERT INTO client_project (client_id, project_id, " +
              "creation_date, creation_user, modification_date, modification_user) "
              + "VALUES ({0}, {1}, CURRENT, {2}, CURRENT, {3});";
        sql = MessageFormat.format(SQL_TEMPLATE2,
                                   String.valueOf(billingProject.getClientId()),
                                   String.valueOf(billingProject.getBillingProjectId()),
                                   DEFAULT_PROJECT_AUTHOR,
                                   DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified TC Direct
     * project and outputs them to specified destination.</p>
     *
     * @param tcDirectProject a <code>TcDirectProject</code> providing the specification of the TC Direct project to
     *        generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(TcDirectProject tcDirectProject, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO tc_direct_project (project_id, name, description, project_status_id, user_id, create_date, "
              + "modify_date) "
              + "VALUES ({0}, ''{1}'', ''{2}'', {3}, {4}, CURRENT, CURRENT);";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(tcDirectProject.getTcDirectProjectId()),
                                          tcDirectProject.getName(),
                                          tcDirectProject.getDescription(),
                                          String.valueOf(tcDirectProject.getStatus().getId()),
                                          String.valueOf(tcDirectProject.getOwner().getUserId()));
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified
     * permission grant and outputs them to specified destination.</p>
     *
     * @param userPermissionGrant a <code>UserPermissionGrant</code> providing the specification of the permission grant
     *        to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(UserPermissionGrant userPermissionGrant, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO user_permission_grant (user_permission_grant_id, user_id, resource_id, permission_type_id, "
              + "is_studio) VALUES ({0}, {1}, {2}, {3}, 0);";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(userPermissionGrant.getUserPermissionGrantId()),
                                          String.valueOf(userPermissionGrant.getUserId()),
                                          String.valueOf(userPermissionGrant.getResourceId()),
                                          String.valueOf(userPermissionGrant.getPermissionType().getId()));
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified billing
     * user account and outputs them to specified destination.</p>
     *
     * @param userAccount a <code>UserAccount</code> providing the specification of the billing user account to generate
     *        SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(UserAccount userAccount, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO user_account (user_account_id, account_status_id, user_name, password, creation_date, "
              + "creation_user, modification_date, modification_user) "
              + "VALUES ({0}, {1}, ''{2}'', ''{3}'', CURRENT, {4}, CURRENT, {5});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(userAccount.getUserAccountId()),
                                          String.valueOf(userAccount.getStatus().getId()),
                                          userAccount.getUsername(),
                                          userAccount.getPassword(),
                                          DEFAULT_PROJECT_AUTHOR,
                                          DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified billing
     * project manager and outputs them to specified destination.</p>
     *
     * @param billingProjectManager a <code>BillingProjectManager</code> providing the specification of the billing
     *        project manager to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(BillingProjectManager billingProjectManager, PrintWriter out) {
        final String SQL_TEMPLATE
            = "INSERT INTO project_manager (project_id, user_account_id, pay_rate, cost, active, creation_date, "
              + "creation_user, modification_date, modification_user) "
              + "VALUES ({0}, {1}, {2}, {3}, {4}, CURRENT, {5}, CURRENT, {6});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(billingProjectManager.getProjectId()),
                                          String.valueOf(billingProjectManager.getUserAccount().getUserAccountId()),
                                          String.valueOf(billingProjectManager.getPayRate()),
                                          String.valueOf(billingProjectManager.getCost()),
                                          billingProjectManager.getActive() ? "1" : "0",
                                          DEFAULT_PROJECT_AUTHOR,
                                          DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified billing
     * project worker and outputs them to specified destination.</p>
     *
     * @param billingProjectWorker a <code>BillingProjectManager</code> providing the specification of the billing
     *        project worker to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(BillingProjectWorker billingProjectWorker, PrintWriter out) {
        final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        final String SQL_TEMPLATE
            = "INSERT INTO project_worker (project_id, user_account_id, pay_rate, cost, active, start_date, end_date,"
              + "creation_date, creation_user, modification_date, modification_user) "
              + "VALUES ({0}, {1}, {2}, {3}, {4}, ''{5}'', ''{6}'', CURRENT, {7}, CURRENT, {8});";
        String sql = MessageFormat.format(SQL_TEMPLATE,
                                          String.valueOf(billingProjectWorker.getProjectId()),
                                          String.valueOf(billingProjectWorker.getUserAccount().getUserAccountId()),
                                          String.valueOf(billingProjectWorker.getPayRate()),
                                          String.valueOf(billingProjectWorker.getCost()),
                                          billingProjectWorker.getActive() ? "1" : "0",
                                          dateFormat.format(billingProjectWorker.getStartDate()),
                                          dateFormat.format(billingProjectWorker.getEndDate()),
                                          DEFAULT_PROJECT_AUTHOR,
                                          DEFAULT_PROJECT_AUTHOR);
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database tables to represent specified contest
     * and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the contest to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    public void generateSQLStatements(Project contest, PrintWriter out) {
        insertCompCatalog(contest, out);
        insertCompCategories(contest, out);
        insertCompVersions(contest, out);
        insertCompVersionDates(contest, out);
        insertCompTechnology(contest, out);
        insertProject(contest, out);
        insertProjectInfos(contest, out);
        insertProjectSpec(contest, out);
        insertProjectPhases(contest, out);
        insertProjectPhaseDependencies(contest, out);
        insertProjectPhaseCriteria(contest, out);
        insertProjectResources(contest, out);
        insertProjectResourceInfos(contest, out);
        insertUploads(contest, out);
        insertSubmissions(contest, out);
        insertReviews(contest, out);
        insertTimelineNotifications(contest, out);
        insertContestSales(contest, out);
        out.flush();
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>comp_catalog</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertCompCatalog(Project project, PrintWriter out) {
        Component component = project.getComponent();
        if (component != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO comp_catalog (component_id, current_version, short_desc, component_name, description, " +
                  "function_desc, create_time, status_id, root_category_id, modify_date, public_ind) " +
                  " VALUES ({0}, {1}, ''{2}'', ''{3}'', ''{4}'', ''{5}'', CURRENT, {6}, {7}, CURRENT, {8});";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                              String.valueOf(component.getComponentId()),
                                              String.valueOf(component.getCurrentVersionId()),
                                              nvl(component.getShortDesc(), "NA"),
                                              component.getComponentName(),
                                              nvl(component.getDescription(), "NA"),
                                              nvl(component.getFunctionalDesc(), "NA"),
                                              String.valueOf(component.getStatusId()),
                                              String.valueOf(component.getRootCategoryId()),
                                              component.isVisible() ? "1" : "0");
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>comp_categories</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertCompCategories(Project contest, PrintWriter out) {
        Component component = contest.getComponent();
        if ((component != null) && (component.getRootCategoryId() > 0)) {
            final String SQL_TEMPLATE
                = "INSERT INTO comp_categories (comp_categories_id, component_id, category_id) "
                  + " VALUES ({0}, {1}, {2});";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                              String.valueOf(component.getComponentId()),
                                              String.valueOf(component.getComponentId()),
                                              String.valueOf(component.getRootCategoryId()));
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>comp_versions</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertCompVersions(Project project, PrintWriter out) {
        Component component = project.getComponent();
        if (component != null) {
            List<ComponentVersion> versions = component.getVersions();
            if (versions != null) {
                final String SQL_TEMPLATE
                    = "INSERT INTO comp_versions (comp_vers_id, component_id, version, version_text, create_time, " +
                      "phase_id, phase_time, price, comments, modify_date, suspended_ind) " +
                      "VALUES ({0}, {1}, {2}, ''{3}'', CURRENT, {4}, CURRENT, {5}, ''{6}'', CURRENT, {7});";
                for (ComponentVersion version : versions) {
                    String sql = MessageFormat.format(SQL_TEMPLATE,
                                                      String.valueOf(version.getVersionId()),
                                                      String.valueOf(component.getComponentId()),
                                                      String.valueOf(version.getVersionNumber()),
                                                      version.getVersionText(),
                                                      String.valueOf(version.getPhaseId()),
                                                      String.valueOf(version.getPrice()),
                                                      version.getComments(),
                                                      version.isSuspended() ? "1" : "0");
                    out.println(sql);
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>comp_version_dates</code> table
     * to represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertCompVersionDates(Project project, PrintWriter out) {
        Component component = project.getComponent();
        if (component != null) {
            List<ComponentVersion> versions = component.getVersions();
            if (versions != null) {
                final String SQL_TEMPLATE
                    = "INSERT INTO comp_version_dates (comp_version_dates_id, comp_vers_id, phase_id, posting_date, " +
                      "initial_submission_date, winner_announced_date, final_submission_date, estimated_dev_date, " +
                      "price, total_submissions, status_id, create_time, level_id, screening_complete_date, " +
                      "review_complete_date, aggregation_complete_date, phase_complete_date, production_date, " +
                      "aggregation_complete_date_comment, phase_complete_date_comment, review_complete_date_comment, " +
                      "winner_announced_date_comment, initial_submission_date_comment, screening_complete_date_comment, " +
                      "final_submission_date_comment, production_date_comment, modify_date) " +
                      "VALUES ({0}, {1}, 112, ''1976-06-05'', ''2000-02-01'', ''2000-02-01'', " +
                      "''2000-02-01'', ''2000-02-01'', 0.00, 0, 301, CURRENT, 100, ''2000-02-01'', " +
                      "''2000-02-01'', ''2000-02-01'', ''2000-02-01'', null, null, null, null, " +
                      "null, null, null, null, null, CURRENT);";
                for (ComponentVersion version : versions) {
                    String sql = MessageFormat.format(SQL_TEMPLATE,
                                                      String.valueOf(version.getVersionId()),
                                                      String.valueOf(version.getVersionId()));
                    out.println(sql);
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>comp_technology</code> table
     * to represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertCompTechnology(Project project, PrintWriter out) {
        Component component = project.getComponent();
        if (component != null) {
            List<ComponentVersion> versions = component.getVersions();
            if (versions != null) {
                final String SQL_TEMPLATE
                    = "INSERT INTO comp_technology (comp_tech_id, comp_vers_id, technology_type_id) " +
                      "VALUES ({0}, {1}, {2});";
                for (ComponentVersion version : versions) {
                    TechnologyType[] technologies = version.getTechnologies();
                    if (technologies != null) {
                        int index = 0;
                        for (TechnologyType technology : technologies) {
                            String sql = MessageFormat.format(SQL_TEMPLATE,
                                                              String.valueOf(version.getVersionId() * 10 + index++),
                                                              String.valueOf(version.getVersionId()),
                                                              String.valueOf(technology.getTechnologyTypeId()));
                            out.println(sql);
                        }
                    }
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>project</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProject(Project project, PrintWriter out) {
        String sql;
        if (project.getTcDirectProjectId() > 0) {
            final String SQL_TEMPLATE
                    = "INSERT INTO project (project_id, project_status_id, project_category_id, create_user, " +
                      "create_date, modify_user, modify_date, tc_direct_project_id) " +
                      "VALUES ({0}, {1}, {2}, {3}, CURRENT, {4}, CURRENT, {5});";
            sql = MessageFormat.format(SQL_TEMPLATE,
                                       String.valueOf(project.getProjectId()),
                                       String.valueOf(project.getProjectStatus().getProjectStatusId()),
                                       String.valueOf(project.getProjectCategory().getProjectCategoryId()),
                                       DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR,
                                       String.valueOf(project.getTcDirectProjectId()));
        } else {
            final String SQL_TEMPLATE
                    = "INSERT INTO project (project_id, project_status_id, project_category_id, create_user, " +
                      "create_date, modify_user, modify_date) " +
                      "VALUES ({0}, {1}, {2}, {3}, CURRENT, {4}, CURRENT);";
            sql = MessageFormat.format(SQL_TEMPLATE,
                                       String.valueOf(project.getProjectId()),
                                       String.valueOf(project.getProjectStatus().getProjectStatusId()),
                                       String.valueOf(project.getProjectCategory().getProjectCategoryId()),
                                       DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
        }
        out.println(sql);
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>project_info</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectInfos(Project project, PrintWriter out) {
        Component component = project.getComponent();
        if (component != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.EXTERNAL_REFERENCE_ID,
                                    String.valueOf(component.getComponentId()), out);
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.COMPONENT_ID,
                                    String.valueOf(component.getComponentId()), out);
            ComponentVersion currentVersion = component.getCurrentVersion();
            if (currentVersion != null) {
                insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.VERSION_ID,
                                        String.valueOf(currentVersion.getVersionId()), out);
            }
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.DEVELOPER_FORUM_ID,
                                String.valueOf(project.getForumId()), out);
        Catalog catalog = project.getCatalog();
        if (catalog != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.ROOT_CATALOG_ID,
                                    String.valueOf(catalog.getCatalogId()), out);
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.PROJECT_NAME, project.getProjectName(), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.PROJECT_VERSION, project.getProjectVersion(),
                                out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.SVN_MODULE, project.getSvnModule(), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.TIMELINE_NOTIFICATION, 
                                getTextualValue(project.isTimelineNotificationOption(), 
                                                ProjectInfoType.TIMELINE_NOTIFICATION), 
                                out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.AUTOPILOT_OPTION,
                                getTextualValue(project.isAutoPilotOption(), ProjectInfoType.AUTOPILOT_OPTION), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.STATUS_NOTIFICATION,
                                project.isStatusNotificationOption() ? "On" : "Off", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.PUBLIC, project.isVisible() ? "Yes" : "No",
                                out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.RATED, project.isRated() ? "Yes" : "No", out);
        insertSingleProjectInfo(project.getProjectId(), 
                                ProjectInfoType.ELIGIBILITY, project.getCcaRequired() ? "TopCoder Private" : "Open", 
                                out);
        Double price = project.getPrice();
        if (price != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.PAYMENTS, String.valueOf(price), out);
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.NOTES, project.getNotes(), out);
        
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.DIGITAL_RUN_FLAG,
                                project.isDigitalRunEnabled() ? "On" : "Off", out);
        if (project.isDigitalRunEnabled()) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.DR_POINTS,
                                    String.valueOf(project.getDigitalRunPoints()), out);
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.ADMIN_FEE, 
                                String.valueOf(project.getAdminFee()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.REVIEW_COST,
                                String.valueOf(project.getReviewCost()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.SPEC_REVIEW_COST,
                                String.valueOf(project.getSpecReviewCost()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.FIRST_PLACE_COST,
                                String.valueOf(project.getFirstPlaceCost()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.SECOND_PLACE_COST,
                                String.valueOf(project.getSecondPlaceCost()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.RELIABILITY_BONUS_ELIGIBLE,
                                project.isReliabilityBonusEligible() ? "true" : "false", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.PHASE_DEPENDENCIES_EDITABLE,
                                project.getPhaseDependenciesEditable() ? "true" : "false", out);
        if (project.isReliabilityBonusEligible()) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.RELIABILITY_BONUS_COST,
                                    String.valueOf(project.getReliabilityBonusCost()), out);
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.MILESTONE_BONUS_COST,
                                String.valueOf(project.getMilestoneBonusCost()), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.COST_LEVEL, project.getCostLevel(), out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.CONFIDENTIALITY_TYPE, 
                                project.getConfidentialityType(), out);
        if (project.getBillingProjectId() != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.BILLING_PROJECT, 
                                    String.valueOf(project.getBillingProjectId()), out);
        }
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.APPROVAL_REQUIRED,
                                project.isApprovalRequired() ? "true" : "false", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.SEND_WINNER_EMAILS,
                                project.getSendWinnerEmails() ? "true" : "false", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.POST_MORTEM_REQUIRED,
                                project.isPostMortemRequired() ? "true" : "false", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.MEMBER_PAYMENTS_ELIGIBLE,
                                project.getMemberPaymentsEligible() ? "true" : "false", out);
        insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.TRACK_LATE_DELIVERABLES,
                                project.getTrackLateDeliverables() ? "true" : "false", out);
        if (project.getWinnerUserId() != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.WINNER_EXTERNAL_REFERENCE_ID, 
                                    String.valueOf(project.getWinnerUserId()), out);
        }
        if (project.getRunnerUpUserId() != null) {
            insertSingleProjectInfo(project.getProjectId(), ProjectInfoType.RUNNER_UP_EXTERNAL_REFERENCE_ID, 
                                    String.valueOf(project.getRunnerUpUserId()), out);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>project_info</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param projectId a <code>Long</code> providing the ID of the project to generate SQL statements for.
     * @param type a <code>ProjectInfoType</code> specifying the type of project info.
     * @param value a <code>String</code> providing the value for project info.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertSingleProjectInfo(long projectId, ProjectInfoType type, String value, PrintWriter out) {
        if (value != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO project_info (project_id, project_info_type_id, value, create_user, create_date, " +
                  "modify_user, modify_date) " +
                  "VALUES ({0}, {1}, ''{2}'', {3}, CURRENT, {4}, CURRENT);";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                              String.valueOf(projectId),
                                              String.valueOf(type.getProjectInfoTypeId()),
                                              value,
                                              DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
            out.println(sql);
        }
    }
    
    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>project_spec</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectSpec(Project contest, PrintWriter out) {
        ProjectSpec projectSpec = contest.getProjectSpec();
        if (projectSpec != null) {
            final String SQL_TEMPLATE
                    = "INSERT INTO project_spec (project_spec_id, project_id, version, detailed_requirements, "
                      + "submission_deliverables, environment_setup_instruction, final_submission_guidelines, "
                      + "private_description, create_user, create_date, modify_user, modify_date) " +
                      "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, CURRENT, {9}, CURRENT);";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                       String.valueOf(projectSpec.getProjectSpecId()),
                                       String.valueOf(projectSpec.getProjectId()),
                                       String.valueOf(projectSpec.getVersion()),
                                       sqlString(projectSpec.getDetailedRequirements()),
                                       sqlString(projectSpec.getSubmissionDeliverables()),
                                       sqlString(projectSpec.getEnvironmentSetupInstructions()),
                                       sqlString(projectSpec.getFinalSubmissionGuidelines()),
                                       sqlString(projectSpec.getPrivateDescription()),
                                       DEFAULT_PROJECT_AUTHOR, 
                                       DEFAULT_PROJECT_AUTHOR);
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>project_phase</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectPhases(Project project, PrintWriter out) {
        Phase[] phases = project.getPhases();
        if (phases != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO project_phase (project_phase_id, project_id, phase_type_id, phase_status_id, " +
                  "fixed_start_time, scheduled_start_time, scheduled_end_time, actual_start_time, actual_end_time, " +
                  "duration, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, CURRENT, {11}, CURRENT);";
            for (Phase phase : phases) {
                try {
                    String sql = MessageFormat.format(SQL_TEMPLATE,
                                                      String.valueOf(phase.getPhaseId()),
                                                      String.valueOf(project.getProjectId()),
                                                      String.valueOf(phase.getPhaseType().getPhaseTypeId()),
                                                      String.valueOf(phase.getPhaseStatus().getPhaseStatusId()),
                                                      toOffsetTime(phase.getFixedStartTimeOffset()),
                                                      toOffsetTime(phase.getScheduledStartTimeOffset()),
                                                      toOffsetTime(phase.getScheduledEndTimeOffset()),
                                                      toOffsetTime(phase.getActualStartTimeOffset()),
                                                      toOffsetTime(phase.getActualEndTimeOffset()),
                                                      String.valueOf(phase.getDuration()),
                                                      DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
                    out.println(sql);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>phase_dependency</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectPhaseDependencies(Project project, PrintWriter out) {
        Phase[] phases = project.getPhases();
        if (phases != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO phase_dependency (dependency_phase_id, dependent_phase_id, dependency_start, " +
                  "dependent_start, lag_time, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, CURRENT, {6}, CURRENT);";
            for (Phase phase : phases) {
                Phase mainPhase = null;
                PhaseType mainPhaseType = phase.getPhaseType().getMainPhaseType();
                if (mainPhaseType != null) {
                    for (Phase phase2 : phases) {
                        if (phase2.getPhaseType() == mainPhaseType) {
                            mainPhase = phase2;
                            break;
                        }
                    }
                }
                if (mainPhase != null) {
//                    boolean isSubmission = (phase.getPhaseType() == PhaseType.SUBMISSION);
                    String sql = MessageFormat.format(SQL_TEMPLATE,
                                                      String.valueOf(mainPhase.getPhaseId()),
                                                      String.valueOf(phase.getPhaseId()),
//                                                      isSubmission ? "1" : "0", "1", "0",
                                                      "0", "1", "0",
                                                      DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
                    out.println(sql);
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>phase_criteria</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectPhaseCriteria(Project project, PrintWriter out) {
        Phase[] phases = project.getPhases();
        if (phases != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO phase_criteria (project_phase_id, phase_criteria_type_id, parameter, create_user, " +
                  "create_date, modify_user, modify_date) VALUES ({0}, {1}, ''{2}'', {3}, CURRENT, {4}, CURRENT);";
            for (Phase phase : phases) {
                Map criteria = phase.getCriteria();
                if (criteria != null) {
                    Set<PhaseCriteriaType> criteriaTypes = criteria.keySet();
                    for (PhaseCriteriaType criteriaType : criteriaTypes) {
                        String sql = MessageFormat.format(SQL_TEMPLATE,
                                                          String.valueOf(phase.getPhaseId()),
                                                          String.valueOf(criteriaType.getPhaseCriteriaTypeId()),
                                                          criteria.get(criteriaType),
                                                          DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
                        out.println(sql);
                    }
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>resource</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectResources(Project project, PrintWriter out) {
        List<Resource> resources = project.getResources();
        if (resources != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO resource (resource_id, resource_role_id, project_id, project_phase_id, create_user, " +
                  "create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, CURRENT, {5}, CURRENT);";
            for (Resource resource : resources) {
                Phase phase = resource.getPhase();
                String sql = MessageFormat.format(SQL_TEMPLATE,
                                                  String.valueOf(resource.getResourceId()),
                                                  String.valueOf(resource.getRole().getResourceRoleId()),
                                                  String.valueOf(project.getProjectId()),
                                                  phase != null ? String.valueOf(phase.getPhaseId()) : "NULL",
                                                  DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
                out.println(sql);
                String[] sqls = resource.getSql();
                if (sqls != null) {
                    for (String s : sqls) {
                        out.println(s);
                    }
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>resource_info</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param project a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertProjectResourceInfos(Project project, PrintWriter out) {
        DateFormat regDateFormat = new SimpleDateFormat("MM.dd.yyyy hh:mm aa");
        List<Resource> resources = project.getResources();
        if (resources != null) {
            for (Resource resource : resources) {
                if (resource.getUser() != null) {
                    User user = resource.getUser();
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.EXTERNAL_REFERENCE_ID,
                                            String.valueOf(user.getUserId()), out);
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.HANDLE, user.getName(), out);
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.EMAIL, user.getEmail(), out);
                } else {
                    TopCoderUser user = resource.getTopCoderUser();
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.EXTERNAL_REFERENCE_ID,
                                            String.valueOf(user.getUserId()), out);
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.HANDLE, user.getHandle(), out);
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.EMAIL, "test@test.com", out);
                }
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.RATING,
                                         toString(resource.getRating()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.RELIABILITY,
                                         toString(resource.getReliability()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.PAYMENT,
                                         toString(resource.getPayment()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.PAYMENT_STATUS,
                                         toString(resource.getPaymentStatus()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.SCREENING_SCORE,
                                         toString(resource.getScreeningScore()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.INITIAL_SCORE,
                                         toString(resource.getInitialScore()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.FINAL_SCORE,
                                         toString(resource.getFinalScore()), out);
                insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.PLACEMENT,
                                         toString(resource.getPlacement()), out);
                if (resource.getRegistrationDate() != null) {
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.REGISTRATION_DATE,
                                             regDateFormat.format(resource.getRegistrationDate()), out);
                }
                Boolean appealsCompletedEarly = resource.isAppealsCompletedEarly();
                if (appealsCompletedEarly != null) {
                    insertSingleResourceInfo(resource.getResourceId(), ResourceInfoType.APPEALS_COMPLETED_EARLY,
                                             appealsCompletedEarly ? "Yes" : "No", out);
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>resource_info</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param resourceId a <code>Long</code> providing the ID of the resource to generate SQL statements for.
     * @param type a <code>ResourceInfoType</code> specifying the type of resource info.
     * @param value a <code>String</code> providing the value for project info.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertSingleResourceInfo(long resourceId, ResourceInfoType type, String value, PrintWriter out) {
        if (value != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO resource_info (resource_id, resource_info_type_id, value, create_user, create_date, " +
                  "modify_user, modify_date) " +
                  "VALUES ({0}, {1}, ''{2}'', {3}, CURRENT, {4}, CURRENT);";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                              String.valueOf(resourceId),
                                              String.valueOf(type.getResourceInfoTypeId()),
                                              value,
                                              DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>notification</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertTimelineNotifications(Project contest, PrintWriter out) {
        if (contest.isTimelineNotificationOption()) {
            List<Resource> resources = contest.getResources();
            if (resources != null) {
                final String SQL_TEMPLATE
                    = "INSERT INTO notification (project_id, external_ref_id, notification_type_id, create_user, " +
                      "create_date, modify_user, modify_date) " +
                      "VALUES ({0}, {1}, {2}, {3}, CURRENT, {4}, CURRENT);";
                Set<Long> userIds = new HashSet<Long>();
                for (Resource resource : resources) {
                    long userId = resource.getUser().getUserId();
                    userIds.add(userId);
                }
                for (Long userId : userIds) {
                    String sql = MessageFormat.format(SQL_TEMPLATE,
                                                      String.valueOf(contest.getProjectId()),
                                                      String.valueOf(userId),
                                                      "1", DEFAULT_PROJECT_AUTHOR, DEFAULT_PROJECT_AUTHOR);
                    out.println(sql);
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>contest_sale</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertContestSales(Project contest, PrintWriter out) {
        ContestSale contestSale = contest.getContestSale();
        if (contestSale != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO contest_sale (contest_sale_id, contest_id, sale_status_id, price, " +
                  "paypal_order_id, create_date, sale_reference_id, sale_type_id) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, CURRENT, {5}, {6});";
            String sql = MessageFormat.format(SQL_TEMPLATE,
                                              String.valueOf(contestSale.getContestSaleId()),
                                              String.valueOf(contestSale.getContestId()),
                                              String.valueOf(contestSale.getStatus().getSaleStatusId()),
                                              String.valueOf(contestSale.getPrice()),
                                              sqlString(contestSale.getPaypalOrderId()),
                                              sqlString(contestSale.getSaleReferenceId()),
                                              String.valueOf(contestSale.getType().getSaleTypeId()));
            out.println(sql);
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>upload</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertUploads(Project contest, PrintWriter out) {
        List<Resource> resources = contest.getResources();
        if (resources != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO upload (upload_id, project_id, resource_id, upload_type_id, upload_status_id, " +
                  "parameter, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {6}, CURRENT);";
            for (Resource resource : resources) {
                Upload[] uploads = resource.getUploads();
                if (uploads != null) {
                    for (Upload upload : uploads) {
                        String sql = MessageFormat.format(SQL_TEMPLATE,
                                                          String.valueOf(upload.getUploadId()),
                                                          String.valueOf(contest.getProjectId()),
                                                          String.valueOf(resource.getResourceId()),
                                                          String.valueOf(upload.getType().getUploadTypeId()),
                                                          String.valueOf(upload.getStatus().getUploadStatusId()),
                                                          sqlString(upload.getParameter()),
                                                          String.valueOf(resource.getUser().getUserId()), 
                                                          toString(upload.getCreationTimestamp()));
                        out.println(sql);
                    }
                }

                Submission[] submissions = resource.getSubmissions();
                if (submissions != null) {
                    for (Submission submission : submissions) {
                        Upload upload = submission.getUpload();
                        String sql = MessageFormat.format(SQL_TEMPLATE,
                                                          String.valueOf(upload.getUploadId()),
                                                          String.valueOf(contest.getProjectId()),
                                                          String.valueOf(resource.getResourceId()),
                                                          String.valueOf(upload.getType().getUploadTypeId()),
                                                          String.valueOf(upload.getStatus().getUploadStatusId()),
                                                          sqlString(upload.getParameter()),
                                                          String.valueOf(resource.getUser().getUserId()),
                                                          toString(upload.getCreationTimestamp()));
                        out.println(sql);
                    }
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>submission</code> table to
     * represent specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertSubmissions(Project contest, PrintWriter out) {
        List<Resource> resources = contest.getResources();
        if (resources != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO submission (submission_id, upload_id, submission_status_id, screening_score, " +
                  "initial_score, final_score, placement, submission_type_id, " +
                  "create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, CURRENT, {8}, CURRENT);";
            final String SQL_TEMPLATE2
                = "INSERT INTO resource_submission (resource_id, submission_id, " +
                  "create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, CURRENT, {2}, CURRENT);";
            final String SQL_TEMPLATE3
                = "INSERT INTO screening_task (screening_task_id, upload_id, screening_status_id, screener_id, " +
                  "start_timestamp, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, CURRENT, {5}, CURRENT);";
            for (Resource resource : resources) {
                Submission[] submissions = resource.getSubmissions();
                if (submissions != null) {
                    for (Submission submission : submissions) {
                        String sql = MessageFormat.format(SQL_TEMPLATE,
                                                          String.valueOf(submission.getSubmissionId()),
                                                          String.valueOf(submission.getUpload().getUploadId()),
                                                          String
                                                              .valueOf(submission.getStatus().getSubmissionStatusId()),
                                                          toString(submission.getScreeningScore()),
                                                          toString(submission.getInitialScore()),
                                                          toString(submission.getFinalScore()),
                                                          toString(submission.getPlacement()),
                                                          String.valueOf(submission.getType().getSubmissionTypeId()),
                                                          String.valueOf(resource.getUser().getUserId()));
                        out.println(sql);
                        sql = MessageFormat.format(SQL_TEMPLATE2,
                                                   String.valueOf(resource.getResourceId()),
                                                   String.valueOf(submission.getSubmissionId()),
                                                   String.valueOf(resource.getUser().getUserId()));
                        out.println(sql);
                        ScreeningTask screeningTask = submission.getScreeningTask();
                        if (screeningTask != null) {
                            sql = MessageFormat.format(SQL_TEMPLATE3,
                                                       String.valueOf(screeningTask.getScreeningTaskId()),
                                                       String.valueOf(screeningTask.getUploadId()),
                                                       String.valueOf(screeningTask.getStatus().getScreeningStatusId()),
                                                       toString(screeningTask.getScreenerId()),
                                                       toString(screeningTask.getStartTimestamp()),
                                                       String.valueOf(resource.getUser().getUserId()));
                            out.println(sql);
                        }
                    }
                }
            }
        }
    }

    /**
     * <p>Generates the SQL statements for inserting the test data into database <code>review</code>, 
     * <code>review_item</code>, <code>review_comment</code>, <code>review_item_comment</code> tables to represent
     * specified project and outputs them to specified destination.</p>
     *
     * @param contest a <code>Project</code> providing the specification of the project to generate SQL statements for.
     * @param out a <code>PrintWriter</code> to write the generated SQL statements to.
     */
    private void insertReviews(Project contest, PrintWriter out) {
        List<Resource> resources = contest.getResources();
        if (resources != null) {
            final String SQL_TEMPLATE
                = "INSERT INTO review (review_id, resource_id, submission_id, scorecard_id, committed, " +
                  "initial_score, score, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, CURRENT, {7}, CURRENT);";
            final String SQL_TEMPLATE2
                = "INSERT INTO review_comment (review_comment_id, resource_id, review_id, comment_type_id, content, " +
                  "extra_info, sort, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, CURRENT, {7}, CURRENT);";
            final String SQL_TEMPLATE3
                = "INSERT INTO review_item (review_item_id, review_id, scorecard_question_id, upload_id, answer, " +
                  "sort, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, CURRENT, {6}, CURRENT);";
            final String SQL_TEMPLATE4
                = "INSERT INTO review_item_comment (review_item_comment_id, resource_id, review_item_id, " +
                  "comment_type_id, content, extra_info, sort, create_user, create_date, modify_user, modify_date) " +
                  "VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, CURRENT, {7}, CURRENT);";

            for (Resource resource : resources) {
                Review[] reviews = resource.getReviews();
                if (reviews != null) {
                    for (Review review : reviews) {
                        String sql = MessageFormat.format(SQL_TEMPLATE,
                                                          String.valueOf(review.getReviewId()),
                                                          String.valueOf(review.getResourceId()),
                                                          String.valueOf(review.getSubmissionId()),
                                                          String.valueOf(review.getScorecardId()),
                                                          review.getCommitted() ? "1" : "0",
                                                          toString(review.getInitialScore()),
                                                          toString(review.getScore()),
                                                          String.valueOf(resource.getUser().getUserId()));
                        out.println(sql);

                        ReviewComment[] reviewComments = review.getComments();
                        if (reviewComments != null) {
                            for (ReviewComment reviewComment : reviewComments) {
                                sql = MessageFormat.format(SQL_TEMPLATE2,
                                                           String.valueOf(reviewComment.getReviewCommentId()),
                                                           String.valueOf(reviewComment.getResourceId()),
                                                           String.valueOf(reviewComment.getReviewId()),
                                                           String.valueOf(reviewComment.getType().getCommentTypeId()),
                                                           sqlString(reviewComment.getContent()),
                                                           sqlString(reviewComment.getExtraInfo()),
                                                           String.valueOf(reviewComment.getSortOrder()),
                                                           String.valueOf(resource.getUser().getUserId()));
                                out.println(sql);
                            }
                        }

                        ReviewItem[] reviewItems = review.getItems();
                        if (reviewItems != null) {
                            for (ReviewItem reviewItem : reviewItems) {
                                sql = MessageFormat.format(SQL_TEMPLATE3,
                                                           String.valueOf(reviewItem.getReviewItemId()),
                                                           String.valueOf(reviewItem.getReviewId()),
                                                           String.valueOf(reviewItem.getScorecardQuestionId()),
                                                           toString(reviewItem.getUploadId()),
                                                           sqlString(reviewItem.getAnswer()),
                                                           String.valueOf(reviewItem.getSortOrder()),
                                                           String.valueOf(resource.getUser().getUserId()));
                                out.println(sql);

                                ReviewItemComment[] reviewItemComments = reviewItem.getComments();
                                if (reviewItemComments != null) {
                                    for (ReviewItemComment reviewItemComment : reviewItemComments) {
                                        sql = MessageFormat.format(SQL_TEMPLATE4,
                                                                   String.valueOf(reviewItemComment.getReviewItemCommentId()),
                                                                   String.valueOf(reviewItemComment.getResourceId()),
                                                                   String.valueOf(reviewItemComment.getReviewItemId()),
                                                                   String.valueOf(reviewItemComment.getType().getCommentTypeId()),
                                                                   sqlString(reviewItemComment.getContent()),
                                                                   sqlString(reviewItemComment.getExtraInfo()),
                                                                   String.valueOf(reviewItemComment.getSortOrder()),
                                                                   String.valueOf(resource.getUser().getUserId()));
                                        out.println(sql);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     * <p>Converts the specified offset time to string.</p>
     *
     * @param offset a <code>Long</code> providing the offset to be converted to string.
     * @return a <code>String</code> providing the specification of time.
     */
    private String toOffsetTime(Long offset) {
        if (offset == null) {
            return null;
        } else {
            return "CURRENT + " + offset + " UNITS MINUTE";
        }
    }

    /**
     * <p>Returns second argument if first argument is <code>null</code>.</p>
     * 
     * @param value a <code>String</code> providing the text value.
     * @param ifNull a <code>String</code> to be returned if specified value is <code>null</code>.
     * @return a <code>String</code>. 
     */
    private String nvl(String value, String ifNull) {
        if (value == null) {
            return ifNull;
        } else {
            return value;
        }
    }

    /**
     * <p>Returns second argument if first argument is <code>null</code>.</p>
     * 
     * @param value a <code>String</code> providing the text value.
     * @return a <code>String</code>. 
     */
    private String sqlString(String value) {
        if (value == null) {
            return "NULL";
        } else {
            return "'" + value + "'";
        }
    }

    /**
     * <p>Converts specified object to string.</p>
     *
     * @param value an <code>Object</code> to be converted.
     * @return a <code>String</code> providing the converted value.
     */
    private String toString(Object value) {
        if (value == null) {
            return null;
        } else {
            return String.valueOf(value);
        }
    }

    /**
     * <p>Converts specified object to string.</p>
     *
     * @param value an <code>Date</code> to be converted.
     * @return a <code>String</code> providing the converted value.
     */
    private String toString(Date value) {
        final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (value == null) {
            return null;
        } else {
            return "'" + dateFormat.format(value) + "'";
        }
    }

    /**
     * <p>Gets the textual value for project info of specified type.</p>
     * 
     * @param isTrue <code>true</code> if project info is set to logical <code>true</code> value; <code>false</code> 
     *        otherwise.
     * @param projectInfoType a <code>ProjectInfoType</code> referencing the type of project info. 
     * @return a <code>String</code> providing the textual value for project info.
     */
    private String getTextualValue(boolean isTrue, ProjectInfoType projectInfoType) {
        if (isTrue) {
            return projectInfoType.getTrueValue();
        } else {
            return projectInfoType.getFalseValue();
        }
    }
}
