http://openfda.wasoftware.com

#GitHub URL

#TECHNICAL APPROACH
##Problem Statement
   The prototype should use the openFDA API and dataset to consume, modify, remix, and display the dataset provided for its functionality. Our team, together with our "users", decided to build a web based system that allows users to search and download data from the APIs, group the data, and displays the results visually in PC and mobile web browsers. 

##Analysis
   Our problem statement is simple with unknown, typical of software projects. The term "remix" was ambiguous but the answer would not be released until very close to the deadline which could become a   disaster. We automated our diverse testing, code analysis, deployment, monitoring to support agility and frequent releases. Washington Software's secure and agile DevOps methodology (http://www.wasoftware.com/images/Agile_Chart_new.jpg) is perfect for systems with dynamic requirements with tight deadline. The methodology consists of agility, DevOps, and security processes.

##Secure and Agile DevOps Methodology
   The methodology begins with product planning that specifies product goals, high level requirements in product backlog, priorities, and high level timelines. The product backlogs are scheduled to different releases. Each release starts with planning that moves user stories and tasks from the product backlog to the release backlog, followed by different sprints of user stories and tasks achievable within the sprint. Each sprint starts with planning that moves work items from the release backlog to the sprint backlog, followed by user story development, testing, deployment, and sprint retrospective review. User story development must pass human code review, security code review, and unit testing before the QA testing tasks. QA testing involves at least user story acceptance testing, black box and white box security testing, static code analysis, and automated regression testing. Load testing and stress testing are performed at least after every architecture changes. All these testing and feedback adds additional work items to different backlogs. Every day the team will have a 5-10   minute meeting in the morning. Individuals will pick a new work item from the sprint backlog or continue yesterday's work item(s). 

##Activities
1. Setup a team with Product Manager (PM) (leader),  Technical Architect (TA), Front-end Developer(FD) (JavaScript, CSS, Foundation 5), Backend Developer(BD) (Java, JSP), DevOp Engineer (DevOp1) familiar with web infrastructure and Amazon Cloud Services (Linux, Security Specialist), DevOp Engineer (Jenkins, maven)(DevOp2) familiar with builds, and appointed two (2) end users.
2. Product Planning - PM and users analyzed the Agile Delivery Services (ADS I) RFQ and entered the functional, non-functional, and security user stories and requirements into our Team Concert agile development tools.
3. Below is the goal of each sprint:
  1. Release Planning (Day1) - Setup Team, define sprint iteration dates
  2. Sprint1 (Day2-Day4)- Threat Modeling, Setup(Amazon EC2, docker container, GitHub, Jenkins), User Login, Setup GUI template
  3. Sprint2 (Day5-Day6) - Login (Continued), Search & Display Data Visually, Rest API,  Configure Build (Jenkins), Configure CheckStyle (Jenkins), Setup Cacti monitoring tool
  4. Sprint3 (Day7-Day8) - Search & Display Data (Continued), Save Data, Configure Deployment(Jenkins), Scan EC2 with OpenVAS security tool
  5. Sprint4 (Day9-Day11)- Save Data (Continued), Configure PMD/Checkstyle, Docker Deployment (Jenkins)
  6. Sprint5 (Day12-Day13)- Modify Data, work items from feedback

##Discussion
* PM is the leader accountable for the quality. 
* Our team has diverse skill sets - system/network/security administration, front-end and back end development, project managemnet, QA, and agile development. They learn new technology quickly.
* Maven is used for configuration management.  
* We use the following open source technology - Linux, Apache/Tomcat, Zurb's Foundation 5, Java/JSP/JavaScript, MySQL, JUnit, and Jenkins. Jenkins is our continuous integration system that pulls source code from Github, run static code analysis tools (e.g. CheckStyle, PMD, FindBugs, Jacoco), automate our tests, build runtime using a mavin plugin, and deploy runtime to our Docker containers in an Amazon EC2 image. 
* Users provide feedback through face-to-face meeting, testing, and usability evaluation.  
* User stories and tasks are prioritized based on risks and mandatory RFQ requirements. Highest priorities and risk work items are scheduled first. New technology are considered high risk. Docker containers are new to our team and we schedule related tasks in Sprint 1.   
* Our security tasks include threat modeling, security user stories, security code review, security static code analysis, security dynamic code analysis, and security monitoring tools.

##Conclusion
Our secure & agile DevOps methodology and automated tools allow us to release proritize features early, frequently, iteratively, and with high quality standard that satisfies user requirements.

#Compliance to US Digital Services Playbook
<table>
<tr>
<td>a. assigned one leader, gave that person authority and responsibility, and held that person accountable for the quality of the prototype submitted</td>
<td></td>
</tr>

<tr>
<td>b. assembled a multidisciplinary and collaborative team that includes at a minimum of two of the labor categories limited to the Development Pool labor categories to develop the prototype as quoted in Attachment C
</td>
<td></td>
</tr>

<tr>
<td>c. used at least five modern and open-source technologies, regardless of architectural layer (frontend, backend, etc.)
</td>
<td></td>
</tr>

<tr>
<td>d. deployed the prototype on an Infrastructure as a Service (IaaS) or Platform as a Service (PaaS) provider, and indicated which provider they used
</td>
<td></td>
</tr>

<tr>
<td>e. wrote unit tests for their code
</td>
<td></td>
</tr>

<tr>
<td>f. set up or used a continuous integration system to automate the running of tests and continuously deployed their code to their IaaS or PaaS provider
</td>
<td>[GitHub](http://github.com)</td>
</tr>

<tr>
<td>g. set up or used configuration management
</td>
<td></td>
</tr>

<tr>
<td>h. set up or used continuous monitoring
</td>
<td></td>
</tr>

<tr>
<td>i. deploy their software in a container (i.e., utilized operating-system-level virtualization)
</td>
<td></td>
</tr>

<tr>
<td>j. used an iterative approach, where feedback informed subsequent work or versions of the prototype
</td>
<td></td>
</tr>

<tr>
<td>k. provided sufficient documentation to install and run their prototype on another machine
</td>
<td></td>
</tr>

<tr>
<td>l. prototype and underlying platforms used to create and run the prototype are openly licensed and free of charge
</td>
<td></td>
</tr>

</table>
