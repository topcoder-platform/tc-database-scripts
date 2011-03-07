/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.generator;

import com.cronos.onlinereview.test.data.User;
import com.cronos.onlinereview.test.data.corporateoltp.PermissionType;
import com.cronos.onlinereview.test.data.corporateoltp.TcDirectProject;
import com.cronos.onlinereview.test.data.corporateoltp.TcDirectProjectStatus;
import com.cronos.onlinereview.test.data.corporateoltp.UserPermissionGrant;
import com.cronos.onlinereview.test.data.generator.project.ProjectDataGenerator;
import com.cronos.onlinereview.test.data.generator.project.ProjectGeneratorConfig;
import com.cronos.onlinereview.test.data.tcscatalog.Catalog;
import com.cronos.onlinereview.test.data.tcscatalog.CostLevel;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseType;
import com.cronos.onlinereview.test.data.tcscatalog.Project;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectCategory;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectInfoType;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectStatus;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectType;
import com.cronos.onlinereview.test.data.timeoltp.AccountStatus;
import com.cronos.onlinereview.test.data.timeoltp.BillingProject;
import com.cronos.onlinereview.test.data.timeoltp.BillingProjectManager;
import com.cronos.onlinereview.test.data.timeoltp.BillingProjectStatus;
import com.cronos.onlinereview.test.data.timeoltp.BillingProjectWorker;
import com.cronos.onlinereview.test.data.timeoltp.Client;
import com.cronos.onlinereview.test.data.timeoltp.ClientStatus;
import com.cronos.onlinereview.test.data.timeoltp.Company;
import com.cronos.onlinereview.test.data.timeoltp.PaymentTerms;
import com.cronos.onlinereview.test.data.timeoltp.UserAccount;
import com.topcoder.util.commandline.CommandLineUtility;
import com.topcoder.util.commandline.IntegerValidator;
import com.topcoder.util.commandline.Switch;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * <p>A class generating the sample data to represent multiple projects and client accounts in <code>Online Review
 * </code>, <code>TopCoder Direct</code> applications covering various possible variations of projects and clients.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class BulkTestDataGenerator {

    /**
     * <p>A <code>List</code> listing the generated company accounts.</p>
     */
    private List<Company> companies = new ArrayList<Company>();

    /**
     * <p>A <code>List</code> listing the generated client accounts.</p>
     */
    private List<Client> clients = new ArrayList<Client>();

    /**
     * <p>A <code>List</code> listing the generated payment terms.</p>
     */
    private List<PaymentTerms> paymentTerms = new ArrayList<PaymentTerms>();

    /**
     * <p>A <code>List</code> listing the generated billing projects.</p>
     */
    private List<BillingProject> billingProjects = new ArrayList<BillingProject>();
    
    /**
     * <p>A <code>List</code> listing the generated TC Direct projects.</p>
     */
    private List<TcDirectProject> tcDirectProjects = new ArrayList<TcDirectProject>();
    
    /**
     * <p>A <code>List</code> listing the generated user permission grants.</p>
     */
    private List<UserPermissionGrant> userPermissionGrants = new ArrayList<UserPermissionGrant>();
    
    /**
     * <p>A <code>List</code> listing the generated user accounts.</p>
     */
    private List<UserAccount> billingUserAccounts = new ArrayList<UserAccount>();
    
    /**
     * <p>A <code>List</code> listing the generated billing project managers.</p>
     */
    private List<BillingProjectManager> billingProjectManagers = new ArrayList<BillingProjectManager>();
    
    /**
     * <p>A <code>List</code> listing the generated billing project workers.</p>
     */
    private List<BillingProjectWorker> billingProjectWorkers = new ArrayList<BillingProjectWorker>();

    /**
     * <p>A <code>List</code> listing the generated contests.</p>
     */
    private List<Project> contests = new ArrayList<Project>();

    /**
     * <p>A <code>Random</code> to be used for generating random numbers.</p>
     */
    private Random random = new Random();

    /**
     * <p>A <code>long</code> providing the starting ID for all ID generation sequences.</p>
     */
    private final long idGeneratorStart;

    /**
     * <p>Constructs new <code>BulkTestDataGenerator</code> instance. This implementation does nothing.</p>
     * 
     * @param idGeneratorStart a <code>long</code> providing the starting ID for all ID generation sequences.
     * @throws IllegalArgumentException if specified <code>idGeneratorStart</code> is negative. 
     */
    public BulkTestDataGenerator(long idGeneratorStart) {
        if (idGeneratorStart < 0) {
            throw new IllegalArgumentException("idGeneratorStart must be positive");
        }
        this.idGeneratorStart = idGeneratorStart;
    }

    /**
     * <p>A command line interface.</p>
     * 
     * @param args a <code>String</code> array providing the command line arguments.
     * @throws Exception if an unexpected error occurs.
     */
    public static void main(String[] args) throws Exception {
        // Parse command line arguments
        CommandLineUtility clu = new CommandLineUtility();
        clu.addSwitch(new Switch("clientsCount", true, 1, 1, new IntegerValidator(),
                                 "Number of client accounts to be generated"));
        clu.addSwitch(new Switch("minBillingCount", true, 1, 1, new IntegerValidator(),
                                 "Minimum number of billing account per client to be generated"));
        clu.addSwitch(new Switch("maxBillingCount", true, 1, 1, new IntegerValidator(),
                                 "Maximum number of billing account per client to be generated"));
        clu.addSwitch(new Switch("minDirectCount", true, 1, 1, new IntegerValidator(),
                                 "Minimum number of TC Direct projects per billing account to be generated"));
        clu.addSwitch(new Switch("maxDirectCount", true, 1, 1, new IntegerValidator(),
                                 "Maximum number of TC Direct projects per billing account to be generated"));
        clu.addSwitch(new Switch("minContestsCount", true, 1, 1, new IntegerValidator(),
                                 "Minimum number of contests per TC Direct project to be generated"));
        clu.addSwitch(new Switch("maxContestsCount", true, 1, 1, new IntegerValidator(),
                                 "Maximum number of contests per TC Direct project to be generated"));
        clu.addSwitch(new Switch("outputFile", true, 1, 1, null,
                                 "A path to a file to write generated SQL statements to"));
        clu.addSwitch(new Switch("idGeneratorStart", true, 1, 1, new IntegerValidator(),
                                 "An initial starting ID for all ID generation sequences."));
        clu.parse(args);

        int clientsCount = Integer.parseInt(clu.getSwitch("clientsCount").getValue());
        int minBillingCount = Integer.parseInt(clu.getSwitch("minBillingCount").getValue());
        int maxBillingCount = Integer.parseInt(clu.getSwitch("maxBillingCount").getValue());
        int minDirectCount = Integer.parseInt(clu.getSwitch("minDirectCount").getValue());
        int maxDirectCount = Integer.parseInt(clu.getSwitch("maxDirectCount").getValue());
        int minContestsCount = Integer.parseInt(clu.getSwitch("minContestsCount").getValue());
        int maxContestsCount = Integer.parseInt(clu.getSwitch("maxContestsCount").getValue());
        int idGeneratorStart = Integer.parseInt(clu.getSwitch("idGeneratorStart").getValue());
        String outputFileName = clu.getSwitch("outputFile").getValue();
        
        // Generate test data
        BulkTestDataGenerator generator = new BulkTestDataGenerator(idGeneratorStart);
        generator.generateBulkTestData(clientsCount, minBillingCount, maxBillingCount, minDirectCount, maxDirectCount, 
                                       minContestsCount, maxContestsCount);
        
        // Generate SQL statements for test data and write them to destination file
        PrintWriter out = new PrintWriter(outputFileName);
        
        try {
            out.println("DATABASE time_oltp;");

            TestDataSQLConverter sqlGenerator = new TestDataSQLConverter();

            List<Company> companies = generator.getCompanies();
            for (Company company : companies) {
                sqlGenerator.generateSQLStatements(company, out);
            }

            List<PaymentTerms> paymentTerms = generator.getPaymentTerms();
            for (PaymentTerms paymentTerm : paymentTerms) {
                sqlGenerator.generateSQLStatements(paymentTerm, out);
            }

            List<Client> clients = generator.getClients();
            for (Client client : clients) {
                sqlGenerator.generateSQLStatements(client, out);
            }
            
            List<BillingProject> billingProjects = generator.getBillingProjects();
            for (BillingProject billingProject : billingProjects) {
                sqlGenerator.generateSQLStatements(billingProject, out);
            }

            List<UserAccount> billingUserAccounts = generator.getBillingUserAccounts();
            for (UserAccount userAccount : billingUserAccounts) {
                sqlGenerator.generateSQLStatements(userAccount, out);
            }
            
            List<BillingProjectManager> billingProjectManagers = generator.getBillingProjectManagers();
            for (BillingProjectManager billingProjectManager : billingProjectManagers) {
                sqlGenerator.generateSQLStatements(billingProjectManager, out);
            }
            
            List<BillingProjectWorker> billingProjectWorkers = generator.getBillingProjectWorkers();
            for (BillingProjectWorker billingProjectWorker : billingProjectWorkers) {
                sqlGenerator.generateSQLStatements(billingProjectWorker, out);
            }
            
            out.println("DATABASE corporate_oltp;");
            
            List<TcDirectProject> tcDirectProjects = generator.getTcDirectProjects();
            for (TcDirectProject tcDirectProject : tcDirectProjects) {
                sqlGenerator.generateSQLStatements(tcDirectProject, out);
            }
            
            List<UserPermissionGrant> userPermissionGrants = generator.getUserPermissionGrants();
            for (UserPermissionGrant userPermissionGrant : userPermissionGrants) {
                sqlGenerator.generateSQLStatements(userPermissionGrant, out);
            }
            
            out.println("DATABASE tcs_catalog;");
            
            out.println("INSERT INTO user_terms_of_use_xref " +
                        "    SELECT u.user_id, t.terms_of_use_id, CURRENT, CURRENT " +
                        "    FROM user u JOIN terms_of_use t ON 1=1 " +
                        "    LEFT JOIN (SELECT user_id, terms_of_use_id FROM user_terms_of_use_xref) x " +
                        "         ON x.user_id = u.user_id AND x.terms_of_use_id = t.terms_of_use_id" +
                        "    WHERE x.user_id IS NULL;");

            StringBuilder b = new StringBuilder();
            ProjectCategory[] projectCategories = ProjectCategory.values();
            for (int i = 0; i < projectCategories.length; i++) {
                ProjectCategory projectCategory = projectCategories[i];
                if (projectCategory.getRated()) {
                    if (b.length() > 0) {
                        b.append(", ");
                    }
                    b.append(projectCategory.getProjectCategoryId());
                }
            }
            
            out.println("INSERT INTO user_rating " +
                        "  SELECT u.user_id, 0, t.project_category_id + 111, 0, 0, 0, CURRENT, CURRENT, " +
                        "  NULL::DECIMAL(12,0) " + 
                        "  FROM user u JOIN project_category_lu t ON 1=1 " +
                        "  LEFT JOIN (SELECT user_id, phase_id FROM user_rating) x " +
                        "       ON x.user_id = u.user_id AND x.phase_id = (t.project_category_id + 111)" +
                        "  WHERE x.user_id IS NULL AND t.project_category_id IN (" + b + ");");
            
            List<Project> contests = generator.getContests();
            for (Project contest : contests) {
                sqlGenerator.generateSQLStatements(contest, out);
            }
        } finally {
            out.close();
        }
    }
    
    /**
     * <p>Gets the list of generated company accounts.</p>
     * 
     * @return a <code>List</code> listing the generated company accounts.
     */
    public List<Company> getCompanies() {
        return this.companies;
    }

    /**
     * <p>Gets the list of generated client accounts.</p>
     * 
     * @return a <code>List</code> listing the generated client accounts.
     */
    public List<Client> getClients() {
        return this.clients;
    }

    /**
     * <p>Get the list of generated payment terms.</p>
     * 
     * @return a <code>List</code> listing the generated payment terms.
     */
    public List<PaymentTerms> getPaymentTerms() {
        return this.paymentTerms;
    }

    /**
     * <p>Gets the list of generated billing projects.</p>
     * 
     * @return a <code>List</code> listing the generated billing projects.
     */
    public List<BillingProject> getBillingProjects() {
        return this.billingProjects;
    }

    /**
     * <p>Gets the list of generated TC Direct projects.</p>
     * 
     * @return a <code>List</code> listing the generated TC Direct projects.
     */
    public List<TcDirectProject> getTcDirectProjects() {
        return this.tcDirectProjects;
    }

    /**
     * <p>Gets the list of generated user permission grants.</p>
     * 
     * @return a <code>List</code> listing the generated user permission grants.
     */
    public List<UserPermissionGrant> getUserPermissionGrants() {
        return this.userPermissionGrants;
    }

    /**
     * <p>Gets the list of generated billing project managers.</p>
     * 
     * @return a <code>List</code> listing the generated billing project managers.
     */
    public List<BillingProjectManager> getBillingProjectManagers() {
        return this.billingProjectManagers;
    }

    /**
     * <p>Gets the list of generated billing user accounts.</p>
     * 
     * @return a <code>List</code> listing the generated user accounts.
     */
    public List<UserAccount> getBillingUserAccounts() {
        return billingUserAccounts;
    }

    /**
     * <p>Gets the list of generated billing project workers.</p>
     * 
     * @return a <code>List</code> listing the generated billing project workers.
     */
    public List<BillingProjectWorker> getBillingProjectWorkers() {
        return this.billingProjectWorkers;
    }

    /**
     * <p>Gets the list of generated contests.</p>
     * 
     * @return a <code>List</code> listing the generated contests.
     */
    public List<Project> getContests() {
        return contests;
    }

    /**
     * <p>Generates the sample data for numerous projects and client accounts of various types and states.</p>
     *
     * @param numberOfClients an <code>int</code> providing the number of clients to be generated.
     * @param minBillingProjectsCountPerClient an <code>int</code> providing the minimum number of billing projects per
     *        clients to be generated.
     * @param maxBillingProjectsCountPerClient an <code>int</code> providing the maximum number of billing projects per
     *        clients to be generated.
     * @param minTcDirectProjectsCountPerBillingAccount an <code>int</code> providing the minimum number of TC Direct
     *        projects per billing account to be generated.
     * @param maxTcDirectProjectsCountPerBillingAccount an <code>int</code> providing the maximum number of TC Direct
     *        projects per billing account to be generated.
     * @param minContestCountPerTcDirectProject an <code>int</code> providing the minimum number of contests per TC
     *        Direct project to be generated.
     * @param maxContestCountPerTcDirectProject an <code>int</code> providing the maximum number of contests per TC
     *        Direct project to be generated.
     */
    public void generateBulkTestData(int numberOfClients, int minBillingProjectsCountPerClient,
                                     int maxBillingProjectsCountPerClient, 
                                     int minTcDirectProjectsCountPerBillingAccount,
                                     int maxTcDirectProjectsCountPerBillingAccount, 
                                     int minContestCountPerTcDirectProject,
                                     int maxContestCountPerTcDirectProject) {
        generatePaymentTerms(numberOfClients);
        generateCompanies(numberOfClients);
        generateClients(numberOfClients);
        generateBillingProjects(minBillingProjectsCountPerClient, maxBillingProjectsCountPerClient);
        generateBillingUserAccounts();
        generateBillingProjectManagers();
        generateBillingProjectWorkers();
        generateTcDirectProjects(minTcDirectProjectsCountPerBillingAccount, maxTcDirectProjectsCountPerBillingAccount);
        generateUserPermissionGrants();
        generateContests(minContestCountPerTcDirectProject, maxContestCountPerTcDirectProject);
    }

    /**
     * <p>Generates the sample data for various payment terms of various types and states.</p>
     *
     * @param numberOfClients an <code>int</code> providing the number of clients to be generated.
     */
    private void generatePaymentTerms(int numberOfClients) {
        int numberOfPaymentTerms = numberOfClients / 2;
        if (numberOfPaymentTerms == 0) {
            numberOfPaymentTerms++;
        }

        long paymentTermsIdsGenerator = this.idGeneratorStart;
        for (int i = 1; i <= numberOfPaymentTerms; i++) {
            PaymentTerms paymentTerm = new PaymentTerms();
            paymentTerm.setPaymentTermsId(++paymentTermsIdsGenerator);
            paymentTerm.setDescription("Payment Terms " + i);
            paymentTerm.setActive(true);
            paymentTerm.setTerm(i);
            this.paymentTerms.add(paymentTerm);
        }
    }

    /**
     * <p>Generates the sample data for various company accounts of various types and states.</p>
     *
     * @param numberOfClients an <code>int</code> providing the number of clients to be generated.
     */
    private void generateCompanies(int numberOfClients) {
        int numberOfCompanies = numberOfClients / 3;
        if (numberOfCompanies == 0) {
            numberOfCompanies++;
        }

        long companyIdsGenerator = this.idGeneratorStart;
        for (int i = 1; i <= numberOfCompanies; i++) {
            Company company = new Company();
            company.setCompanyId(++companyIdsGenerator);
            company.setName("Company " + i);
            company.setDeleted(false);
            company.setPassCode("PASSCODE " + i);
            this.companies.add(company);
        }
    }

    /**
     * <p>Generates the sample data for various client accounts of various types and states.</p>
     *
     * @param numberOfClients an <code>int</code> providing the number of clients to be generated.
     */
    private void generateClients(int numberOfClients) {
        ClientStatus[] allClientStatuses = ClientStatus.values();
        long clientIdsGenerator = this.idGeneratorStart;
        for (int i = 1; i <= numberOfClients; i++) {
            Client client = new Client();
            client.setClientId(++clientIdsGenerator);
            client.setName("Client " + i);
            client.setCompany(this.companies.get(i % this.companies.size()));
            client.setPaymentTerms(this.paymentTerms.get(i % this.paymentTerms.size()));
            client.setDeleted(false);
            client.setStatus(allClientStatuses[i % allClientStatuses.length]);
            client.setCodeName("CodeName " + i);
            client.setSalesTax(getRandomInt(10, 40));
            client.setStartDate(new Date(System.currentTimeMillis() - getRandomInt(1, 10) * 24 * 3600 * 1000L));
            client.setEndDate(new Date(System.currentTimeMillis() + getRandomInt(1, 10) * 24 * 3600 * 1000L));
            
            this.clients.add(client);
        }
    }

    /**
     * <p>Generates the sample data for various billing projects of various types and states.</p>
     *  
     * @param minBillingProjectsCountPerClient an <code>int</code> providing the minimum number of billing projects per
     *        clients to be generated.
     * @param maxBillingProjectsCountPerClient an <code>int</code> providing the maximum number of billing projects per
     *        clients to be generated.
     */
    private void generateBillingProjects(int minBillingProjectsCountPerClient, int maxBillingProjectsCountPerClient) {
        long billingProjectIdsGenerator = this.idGeneratorStart;
        BillingProjectStatus[] allBillingProjectStatuses = BillingProjectStatus.values();
        for (Client client : this.clients) {
            int numberOfBillingProjects 
                = getRandomInt(minBillingProjectsCountPerClient, maxBillingProjectsCountPerClient);
            for (int i = 1; i <= numberOfBillingProjects; i++) {
                BillingProject billingProject = new BillingProject();
                billingProject.setActive(true);
                billingProject.setDeleted(false);
                billingProject.setBillingProjectId(++billingProjectIdsGenerator);
                billingProject.setClientId(client.getClientId());
                billingProject.setCompanyId(client.getCompany().getCompanyId());
                billingProject.setBudget(getRandomInt(10000, 100000));
                billingProject.setDescription(client.getName() + " Billing Account " + i);
                billingProject.setName(client.getName() + " Billing Account " + i);
                billingProject.setPaymentTermsId(client.getPaymentTerms().getPaymentTermsId());
                billingProject.setParentProjectId(null);
                billingProject.setStatus(allBillingProjectStatuses[i % allBillingProjectStatuses.length]);
                billingProject.setStartDate(
                    new Date(System.currentTimeMillis() - getRandomInt(1, 10) * 24 * 3600 * 1000L));
                billingProject.setEndDate(
                    new Date(System.currentTimeMillis() + getRandomInt(1, 10) * 24 * 3600 * 1000L));
                billingProject.setPoBoxNumber("PO BOX " + billingProject.getBillingProjectId());
                billingProject.setManualPrizeSetting(false);
                billingProject.setSalesTax(getRandomInt(10, 40));
                
                this.billingProjects.add(billingProject);
            }
        }
    }

    /**
     * <p>Generates the sample data for various billing user accounts.</p>
     */
    private void generateBillingUserAccounts() {
        final User[] users = new User[] {User.HEFFAN, User.USER, User.YOSHI};
        long userAccountIdsGenerator = this.idGeneratorStart;
        for (int i = 0; i < users.length; i++) {
            User user = users[i];
            UserAccount billingUserAccount = new UserAccount();
            billingUserAccount.setUserAccountId(++userAccountIdsGenerator);
            billingUserAccount.setStatus(AccountStatus.ACTIVE);
            billingUserAccount.setUsername(user.getName());
            billingUserAccount.setPassword("password");
            
            this.billingUserAccounts.add(billingUserAccount);
        }    
    }

    /**
     * <p>Generates the sample data for various billing project managers.</p>
     */
    private void generateBillingProjectManagers() {
        for (BillingProject billingProject : this.billingProjects) {
            BillingProjectManager billingProjectManager = new BillingProjectManager();
            billingProjectManager.setUserAccount(getUserAccount(User.HEFFAN.getName()));
            billingProjectManager.setActive(true);
            billingProjectManager.setProjectId(billingProject.getBillingProjectId());
            billingProjectManager.setPayRate(getRandomInt(10, 100));
            billingProjectManager.setCost(getRandomInt(10, 999));
            
            this.billingProjectManagers.add(billingProjectManager);
        }
    }

    /**
     * <p>Generates the sample data for various billing project workers.</p>
     */
    private void generateBillingProjectWorkers() {
        final User[] users = new User[] {User.USER, User.YOSHI};
        for (BillingProject billingProject : this.billingProjects) {
            for (int i = 0; i < users.length; i++) {
                User user = users[i];
                BillingProjectWorker billingProjectWorker = new BillingProjectWorker();
                billingProjectWorker.setUserAccount(getUserAccount(user.getName()));
                billingProjectWorker.setActive(true);
                billingProjectWorker.setProjectId(billingProject.getBillingProjectId());
                billingProjectWorker.setPayRate(getRandomInt(10, 100));
                billingProjectWorker.setCost(getRandomInt(10, 999));
                billingProjectWorker.setStartDate(billingProject.getStartDate());
                billingProjectWorker.setEndDate(billingProject.getEndDate());
            
                this.billingProjectWorkers.add(billingProjectWorker);
            }    
        }
    }

    /**
     * <p>Gets the generated user account matching the specified username.</p>
     * 
     * @param username a <code>String</code> providing the username to find matching user account for.
     * @return an <code>UserAccount</code> matching the specified username or <code>null</code> if there is no one. 
     */
    private UserAccount getUserAccount(String username) {
        for (UserAccount userAccount : this.billingUserAccounts) {
            if (userAccount.getUsername().equals(username)) {
                return userAccount;
            }
        }
        return null;
    }


    /**
     * <p>Generates the sample data for various billing projects of various types and states.</p>
     *  
     * @param minTcDirectProjectsCountPerBillingAccount an <code>int</code> providing the minimum number of TC Direct
     *        projects per billing account to be generated.
     * @param maxTcDirectProjectsCountPerBillingAccount an <code>int</code> providing the maximum number of TC Direct
     *        projects per billing account to be generated.
     */
    private void generateTcDirectProjects(int minTcDirectProjectsCountPerBillingAccount, 
                                          int maxTcDirectProjectsCountPerBillingAccount) {
        final User[] projectCreators = new User[] {User.HEFFAN, User.USER, User.YOSHI}; 
        long projectIdsGenerator = this.idGeneratorStart;
        TcDirectProjectStatus[] allProjectStatuses = TcDirectProjectStatus.values();
        for (BillingProject billingAccount : this.billingProjects) {
            int numberOfTcDirectProjects 
                = getRandomInt(minTcDirectProjectsCountPerBillingAccount, maxTcDirectProjectsCountPerBillingAccount);
            for (int i = 1; i <= numberOfTcDirectProjects; i++) {
                TcDirectProject tcDirectProject = new TcDirectProject();
                tcDirectProject.setTcDirectProjectId(++projectIdsGenerator);
                tcDirectProject.setDescription(billingAccount.getName() + " Project " + i);
                tcDirectProject.setName(billingAccount.getName() + " Project " + i);
                tcDirectProject.setStatus(allProjectStatuses[i % allProjectStatuses.length]);
                tcDirectProject.setOwner(projectCreators[i % projectCreators.length]);
                tcDirectProject.setBillingAccount(billingAccount);
                
                this.tcDirectProjects.add(tcDirectProject);
            }
        }
    }

    /**
     * <p>Generates the sample data for various permission grants for users for accessing the generated TC Direct
     * projects.</p>
     */
    private void generateUserPermissionGrants() {
        final User[] users = new User[] {User.HEFFAN, User.USER, User.YOSHI}; 
        long grantIdsGenerator = this.idGeneratorStart;
        for (TcDirectProject tcDirectProject : this.tcDirectProjects) {
            for (int i = 0; i < users.length; i++) {
                User user = users[i];
                UserPermissionGrant userPermissionGrant = new UserPermissionGrant();
                userPermissionGrant.setUserPermissionGrantId(++grantIdsGenerator);
                if (user.getUserId() == tcDirectProject.getOwner().getUserId()) {
                    userPermissionGrant.setPermissionType(PermissionType.PROJECT_FULL);
                } else {
                    userPermissionGrant.setPermissionType(PermissionType.PROJECT_READ);
                }
                userPermissionGrant.setUserId(user.getUserId());
                userPermissionGrant.setResourceId(tcDirectProject.getTcDirectProjectId());
                this.userPermissionGrants.add(userPermissionGrant);
            }
        }
    }
    
    /**
     * <p>Generates the sample data for various billing projects of various types and states.</p>
     *  
     * @param minContestCountPerTcDirectProject an <code>int</code> providing the minimum number of contests per TC 
     *        Direct project to be generated.
     * @param maxContestCountPerTcDirectProject an <code>int</code> providing the maximum number of contests per TC 
     *        Direct project to be generated.
     */
    private void generateContests(int minContestCountPerTcDirectProject, int maxContestCountPerTcDirectProject) {
        int catalogIndex = 0;
        int projectCategoryIndex = 0;
        int projectStatusIndex = 0;
        int costLevelIndex = 0;
        
        Catalog[] catalogs = Catalog.values();
        ProjectCategory[] projectCategories = ProjectCategory.values();
        ProjectStatus[] projectStatuses = ProjectStatus.values();
        PhaseType[] phaseTypes = PhaseType.values();
        CostLevel[] costLevels = CostLevel.values();
        
        // Initialize ID generators
        IdGenerator projectIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator projectSpecIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator componentIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator componentVersionIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator phaseIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator resourceIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator compTechnologyIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator compInquiryIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator contestSaleIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator uploadIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator submissionIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator reviewIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator reviewItemIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator reviewCommentIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator reviewItemCommentIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator screeningTaskIdGenerator = new IdGenerator(idGeneratorStart);
        IdGenerator projectCountGenerator = new IdGenerator(0);
        
        for (TcDirectProject tcDirectProject : this.tcDirectProjects) {
            int numberOfContests = getRandomInt(minContestCountPerTcDirectProject, maxContestCountPerTcDirectProject);
            for (int i = 1; i <= numberOfContests; i++) {
                // Select billing account, catalog, category and status for project to be generated
                BillingProject billingAccount = tcDirectProject.getBillingAccount();
                
                Catalog catalog = catalogs[catalogIndex];
                if (++catalogIndex == catalogs.length) {
                    catalogIndex = 0;
                }
                
                ProjectCategory projectCategory = projectCategories[projectCategoryIndex];
                if (++projectCategoryIndex == projectCategories.length) {
                    projectCategoryIndex = 0;
                }
                
                ProjectStatus projectStatus = projectStatuses[projectStatusIndex];
                if (++projectStatusIndex == projectStatuses.length) {
                    projectStatusIndex = 0;
                }
                
                CostLevel costLevel = costLevels[costLevelIndex];
                if (++costLevelIndex == costLevels.length) {
                    costLevelIndex = 0;
                }
                
                // Switch through all phase types and create a project with phase of selected type to be of Open status
                for (int j = 0; j < phaseTypes.length && i <= numberOfContests; j++) {
                    PhaseType phaseType = phaseTypes[j];
                    if (areCompatible(phaseType, projectStatus)) {
                        i++;
                        
                        // Set configuration for project generation
                        ProjectGeneratorConfig projectGeneratorConfig = new ProjectGeneratorConfig();
                        projectGeneratorConfig.setCompInquiryIdGenerator(compInquiryIdGenerator);
                        projectGeneratorConfig.setComponentIdGenerator(componentIdGenerator);
                        projectGeneratorConfig.setComponentVersionIdGenerator(componentVersionIdGenerator);
                        projectGeneratorConfig.setCompTechnologyIdGenerator(compTechnologyIdGenerator);
                        projectGeneratorConfig.setProjectIdGenerator(projectIdGenerator);
                        projectGeneratorConfig.setProjectSpecIdGenerator(projectSpecIdGenerator);
                        projectGeneratorConfig.setProjectCountGenerator(projectCountGenerator);
                        projectGeneratorConfig.setPhaseIdGenerator(phaseIdGenerator);
                        projectGeneratorConfig.setResourceIdGenerator(resourceIdGenerator);
                        projectGeneratorConfig.setContestSaleIdGenerator(contestSaleIdGenerator);
                        projectGeneratorConfig.setSubmissionIdGenerator(submissionIdGenerator);
                        projectGeneratorConfig.setUploadIdGenerator(uploadIdGenerator);
                        projectGeneratorConfig.setReviewIdGenerator(reviewIdGenerator);
                        projectGeneratorConfig.setReviewItemIdGenerator(reviewItemIdGenerator);
                        projectGeneratorConfig.setReviewCommentIdGenerator(reviewCommentIdGenerator);
                        projectGeneratorConfig.setReviewItemCommentIdGenerator(reviewItemCommentIdGenerator);
                        projectGeneratorConfig.setScreeningTaskIdGenerator(screeningTaskIdGenerator);
                        
                        projectGeneratorConfig.setCurrentPhaseType(phaseType);
                        projectGeneratorConfig.setBillingProject(billingAccount);
                        projectGeneratorConfig.setTcDirectProject(tcDirectProject);
                        projectGeneratorConfig.setCatalog(catalog);
                        projectGeneratorConfig.setProjectCategory(projectCategory);
                        projectGeneratorConfig.setProjectStatus(projectStatus);
                        projectGeneratorConfig.setCostLevel(costLevel);
                        
                        List<ProjectInfoType> flagsToBeSet = new ArrayList<ProjectInfoType>();
                        flagsToBeSet.add(ProjectInfoType.RATED);
                        flagsToBeSet.add(ProjectInfoType.PUBLIC);
                        flagsToBeSet.add(ProjectInfoType.AUTOPILOT_OPTION);
                        flagsToBeSet.add(ProjectInfoType.TIMELINE_NOTIFICATION);
                        flagsToBeSet.add(ProjectInfoType.STATUS_NOTIFICATION);
                        flagsToBeSet.add(ProjectInfoType.DIGITAL_RUN_FLAG);
                        flagsToBeSet.add(ProjectInfoType.PHASE_DEPENDENCIES_EDITABLE);
                        flagsToBeSet.add(ProjectInfoType.RELIABILITY_BONUS_ELIGIBLE);
                        flagsToBeSet.add(ProjectInfoType.APPROVAL_REQUIRED);
                        flagsToBeSet.add(ProjectInfoType.SEND_WINNER_EMAILS);
                        flagsToBeSet.add(ProjectInfoType.MEMBER_PAYMENTS_ELIGIBLE);
                        flagsToBeSet.add(ProjectInfoType.TRACK_LATE_DELIVERABLES);
                        projectGeneratorConfig.setFlagsToBeSet(flagsToBeSet.toArray(
                            new ProjectInfoType[flagsToBeSet.size()]));
                        
                        List<ProjectInfoType> flagsToBeUnset = new ArrayList<ProjectInfoType>();
                        flagsToBeUnset.add(ProjectInfoType.ELIGIBILITY);
                        flagsToBeUnset.add(ProjectInfoType.POST_MORTEM_REQUIRED);
                        projectGeneratorConfig.setFlagsToBeUnSet(flagsToBeUnset.toArray(
                            new ProjectInfoType[flagsToBeUnset.size()]));

                        if (projectCategory.getProjectType() == ProjectType.APPLICATION) {
                            projectGeneratorConfig.setManagers(new User[] {User.HEFFAN, User.APPLICATIONS});
                        } else if (projectCategory.getProjectType() == ProjectType.COMPONENT) {
                            projectGeneratorConfig.setManagers(new User[] {User.HEFFAN, User.COMPONENTS});
                        } else {
                            projectGeneratorConfig.setManagers(new User[] {User.HEFFAN});
                        }
                        projectGeneratorConfig.setSpecificationSubmitters(new User[] {tcDirectProject.getOwner()});
                        projectGeneratorConfig.setSpecificationReviewer(
                            getRandomUser(User.SPECIFICATION_REVIEWER_CANDIDATES));
                        projectGeneratorConfig.setPrimaryReviewer(getRandomUser(User.PRIMARY_REVIEWER_CANDIDATES));
                        projectGeneratorConfig.setReviewers(getRandomUsers(User.REVIEWER_CANDIDATES, 2));
                        projectGeneratorConfig.setSubmitters(
                            getRandomUsers(User.SUBMITTER_CANDIDATES, getRandomInt(2,
                                                                                   User.SUBMITTER_CANDIDATES.length)));
                        projectGeneratorConfig.setApprover(tcDirectProject.getOwner());

                        // Generate and collect generated project
                        ProjectDataGenerator projectDataGenerator = new ProjectDataGenerator(projectGeneratorConfig);
                        this.contests.add(projectDataGenerator.generateProject());
                    }
                }
            }
        }
    }

    /**
     * <p>Checks if specified phase is compatible with specified project status.</p>
     * 
     * @param currentPhaseType a <code>PhaseType</code> referencing the phase type. 
     * @param projectStatus a <code>ProjectStatus</code> referencing the project status. 
     * @return <code>true</code> if specified phase is compatible with project status; <code>false</code> otherwise.
     */
    private boolean areCompatible(PhaseType currentPhaseType, ProjectStatus projectStatus) {
        if (currentPhaseType == null) {
            return true;
        }
        if (currentPhaseType == PhaseType.POST_MORTEM) {
            return false;
        }
        if (projectStatus == ProjectStatus.ACTIVE) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.INACTIVE) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.DELETED) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
            return true;
        } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
            return true;
        } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
            return true;
        } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
            return true;
        } else if (projectStatus == ProjectStatus.COMPLETED) {
            return currentPhaseType != PhaseType.POST_MORTEM;
        }
        return true;
    }

    /**
     * <p>Generates a random value in specified range (inclusive).</p>
     * 
     * @param min an <code>int</code> providing the minimum range value. 
     * @param max an <code>int</code> providing the maximum range value.
     * @return an <code>int</code> providing the generated value.
     */
    private int getRandomInt(int min, int max) {
        int result;
        do {
            result = this.random.nextInt(max + 1);
        } while ((result < min) || (result > max));
        return result;
    }

    /**
     * <p>Gets the random user account from the specified user accounts.</p>
     * 
     * @param users a <code>User</code> array to select user account from. 
     * @return an <code>User</code> selected randomly from specified list.
     */
    private User getRandomUser(User[] users) {
        return users[getRandomInt(0, users.length - 1)];
    }

    /**
     * <p>Gets the specified number of random user accounts from the specified user accounts.</p>
     * 
     * @param users a <code>User</code> array to select user account from.
     * @param userCount an <code>int</code> providing the number of users to select.
     * @return an <code>User</code> selected randomly from specified list.
     */
    private User[] getRandomUsers(User[] users, int userCount) {
        List<User> result = new ArrayList<User>();
        List<User> remainingUsers = new ArrayList<User>(Arrays.asList(users));
        for (int i = 0; i < userCount && !remainingUsers.isEmpty(); i++) {
            User user = getRandomUser(remainingUsers.toArray(new User[remainingUsers.size()]));
            result.add(user);
            remainingUsers.remove(user);
        }
        
        return result.toArray(new User[result.size()]);
    }
}
