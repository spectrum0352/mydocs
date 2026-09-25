Secure Code Techniques
1. Error Handling
Proper Error Handling: isn't going to stop all errors, but it will prevent errors from apperaring on the user interface
for easy viewing for attackes / bad actors.
Bad actors loves mishandled exceptions that can allow execution of code
Good practice is avoid default messages that give away the underlying architecture
98 of 178
2. Input Validation
Proper Input Validation: helps prevent these types of attacks: command insertion, cross-site scripting, buffer
overflows, and SQL injection.
3. Normalization
Is a database term meaning to store and organize data so that it exists in one form only. For example, a user
database has the three tables shown. (name table, zip code table etc).
Check and correct all input
e.g A zip code should be only numeric characters long
4. Stored Procedures
Stored Procedures harden web apps; Is a piece of code, custom written by devs of the app and stored in the
Database.
99 of 178
This code only respond to a specific query format defined by the developer, this can prevent SQL injection
or common bad queries used by attackers.
Using only stored procedures is a really secure practice; this practice can avoid attackers manipulate/abuse the
SQL queries (SQL injection) to obtain sensitive information.
5. Encryption / Code signing
Code signing means to sign an individual executable/interpred code digitally so that users have confidence the
code they run is the actual code from the developer.
6. Obfuscation
To make harder an attacker reverse-engineer the code
7. Code reuse / Dead Code
Using old code to build new applications; If the code has security flaws and vulnerabilities, reusing the code
spreads it to other applications.
Get rid of dead code inside the web app. (e.g Commented unecessary code).
All code is an opportunity for a security problem.
8. Server-side vs. Client-side
In general, a server-side platform is more secure than a client-side platform, but client-side is generally faster and
may receive big chunks of code to the client, to prevent that you can use encryption.
9. Memory Management
Watch out the memory leaks to avoid buffer overflow attack and code reuse.
Never trust data input - malicious users can attempt to circumvent the code.
10. Third-party libraries
Security risks:
Application code written by someone else
Might be secure, Might not be secure
Extensive testing is required
100 of 178
Weaknesses of third-party libraries can result on bad actor exploring this. To avoid this type of risk, maintain patch
updates, stay on top of any announcements, check the dependencies of the third-party libraries using OWASP
dependency checker.
11. Data Exposure
If you have data that is a part of your app some of that data has risk of exposure. And our job as developers is to
reduce if not eliminate any risk of that data exposure especially if it's personally identifiable information (PII) or
personal health information (PHI). We almost always today go through aggressive encryptions any time.
How is the application handling the data?
Is the data encrypted when stored?
The connection is encrypted?
What type of information is displaying to the end-user?
