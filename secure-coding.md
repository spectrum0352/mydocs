Secure Code Development
Waterfall Model
Sequential design process - Traditional model
First step, then second step, then third step...
Agile
Created to be better than Waterfall Model
Sprints (small, rapid, measurable deliverables)
Scrum
95 of 178
DevOps
Create and deploy with Speed, Avaliability and Security
Emphasis on automation and monitoring
Shrinks deployment cycles
Benefits of DevOps:
Speed
Rapid Delivery
Reliablity
Scale
Improved Collaboration
Security
Secure Practices 
�
�
Run Security Automation Tools - to speed up security testing and eliminate human errors. Security testing like
fuzzing.
Test against known vulnerabilities
Pentesting
Test the application
Add strict Change Management and Version Controls - to ensure faults aren't introduced into the application.
Introduce Security Concerns and Requirements - at the planning stage to ensure strong security integration.
Integrity measurement - shows honesty, morality, and quality of the application.
Baselining - defines security objectives that the application must meet.
Immutable systems - are systems that once deployed are never upgraded, changed, or patched. They are simply
replaced. This is easy to do in a VM environment.
Infrastructure as Code (IaC) - means to use preset definition files as opposed to manual configurations to set up
servers. IaC prevents accidental vulnerabilities due to flawed server configurations.
Cloud computing - Relies on automation
Turn the infrastructure devices into code
Virtualize everything
Focus on what the application needs, rather than building the application based on available infrastructure
96 of 178
Code Quality & Testing
Static Code Analysis
Look for standard types of errors
They don't run the code
SAST - Static Application Security Testing
Help identify security flaws
Can present false positive
Dynamic Code Analysis (Fuzzing)
Send random input to an application
Fault-injecting, robustness testing, syntax testing, negative testing
Looking for something out of the ordinary
Actually runs the code
Looks for logic errors
Look for Security holes
Memory Leak
Database querying
Many different fuzzing options (frameworks and fuzzing engines)
Staging
Stress Test - aggressive test of issues such as multiple user simultaneous inputs, multiple server data syncing ...
Sandboxing - Isolated testing environment; Test the systems, almost always virtual machines (VMs), that enable
developers to run the application aggressively.
Model Verification
Model defines how developers expect some feature of the final code to perform. Model Verification match the
application to the aspect of the model. (e.g -This button drive the user to the home or not?)
Verification
Does the software work properly?
Are there any bugs to address?
97 of 178
Are we building the product right?
Validation
Did you meet the high level requirements?
Are we building the right product?
Production
When the testing are done and it's time to pull the application online and running. (expose to the public / internet).
The process of moving an application from the development environment to the production environment is called
provisioning. The process of remove an application from the production is called desprovisioning.
Compiled vs. Runtime code
Compiled code
You don't see the source code
The application is an executable compiled from the source
The compiled code is specific to an OS and CPU
Logical bugs can be identified at compile time
Runtime code
Source code is usually viewable
The code instructions execute when the application is run
No opportunity to find compile-time errors, so errors are detected during or after the execution
