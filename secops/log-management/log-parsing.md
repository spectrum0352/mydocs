Log Parsing
Data parsing is the process of converting data from one format (e.g., text file) to another (e.g., database table) to make it easier to understand and analyse. It is like cleaning and organizing data for better use.

There are different ways to parse data, like using regular expressions (patterns to find specific pieces of data) or parser generators (tools to build parsers for specific formats).

Data parsing is used in many places. Search engines use it to find relevant information on webpages, PDF viewers use it to extract text and images, and social media platforms use it to process user posts.

Log Data Parsing Data parsing is the process of converting data from one format to another, typically to structure and organize it for easier understanding and analysis. It essentially involves cleaning and organizing raw data into a usable format. Data parsing is the process of converting data from one format to another for easier understanding and analysis. Examples include converting raw text to database tables or HTML to plain text.

Importance: • Makes data more readable, understandable, and accessible. • A fundamental skill for anyone working with data.

Methods • Regular Expressions: Using patterns to match and extract specific data from text strings. Example: extracting numbers using \d+. • Parser Generators: Tools like ANTLR that create parsers for specific data formats (e.g., programming languages).

Parsing in Sentinel • Purpose: To gain insights into security posture and identify potential threats from log data.

• Methods: o Log Analytics Queries:  Used to filter, extract, and manipulate log data.  Examples: extracting IP addresses, filtering events based on criteria, grouping data.  Capabilities include field extraction, timestamp conversion, and metric calculation. o Log Analytics Functions:  Pre-built functions for parsing and analysing log data.  Capabilities include JSON and XML parsing, in addition to the abilities of the queries. o Azure Monitor Workbooks:  Create interactive reports to visualize and analyze log data.  Enable custom reports for specific needs (e.g., top error-generating IPs, hourly security event counts). • Example use case: o Filtering windows event logs, then extracting the IP addresses of the machines that generated those logs.

• General capabilities of Log Analytics: o Extracting specific fields from log events o Converting timestamps o Calculating metrics o Filtering log data based on specific criteria o Grouping log data based on specific criteria o Parsing JSON and XML data.

Real-World Applications of Data Parsing • Search Engines: Extracting relevant information from web pages. • PDF Viewers: Extracting text and images from PDF files. • Social Media Platforms: Processing user posts for display. • Spreadsheet Applications: Extracting data for calculations and analysis. • Programming Languages: Compilers and interpreters use it to break down code.

Log Correlation Log correlation is a subset of log analysis that involves analysing log data from diverse sources to identify relationships and patterns between events. It aims to uncover hidden insights, detect security threats, troubleshoot issues, and enhance overall security and operational efficiency. Log correlation is a part of log analysis that involves analysing logs from various sources to identify event patterns and relationships. It aids in threat detection, troubleshooting, and security improvement.

Purpose: • Enhance security by detecting attack patterns. • Ensure compliance with regulations. • Boost performance by troubleshooting application and system issues. • Improve capacity planning by identifying bottlenecks.

Benefits: • Enhanced security through attack pattern detection. • Improved compliance with regulations (HIPAA, PCI DSS). • Efficient performance troubleshooting. • Effective capacity planning.

Methods • Time-based correlation: Analyze the sequence of events around a specific incident to understand their relationships and establish a timeline. • Rule-based correlation: Compare events based on predefined rules using variables like timestamps, transaction types, or locations. Less flexible due to manual rule creation. • Pattern-based correlation: Combine time-based and rule-based methods to check if event relationships match a predefined pattern. Offers increased flexibility. • Topology-based correlation: Map events to the network or device topologies they originate from. Provides a visual representation of incidents within the IT infrastructure.

Process • Collect logs from diverse sources (system, application, network, security). • Normalize logs to a common format. • Correlate logs using methods like pattern matching, rule-based correlation, or machine learning. • Analyze correlated logs for trends, patterns, and anomalies. • Act based on the analysis (incident investigation, error resolution).

Implementation Tips • Identify log types: Determine specific logs to correlate based on needs (security vs. performance). • Choose a log correlation tool: Select a tool (commercial or open-source) that fits budget and requirements. • Configuration: Configure the tool with log types, correlation rules, and desired alerts. • Deployment and Monitoring: Deploy and monitor the tool to ensure proper functioning and alert generation.

Advanced Security Information Model (ASIM) A normalization layer in Microsoft Sentinel that converts proprietary telemetry into user-friendly data. Uses query-time parsers (KQL functions) to map data to normalized schemas.

Benefits: • Normalization of data from different sources. • Extensibility for adding new schemas and parsers. • Performance for handling large data volumes. • Security to protect data.

Log Normalization Log normalization is the process of converting logs from different formats into a standardized format.

Benefits: • Improved visibility and observability across log sources. • Reduced costs by eliminating format-specific analysis tools. • Enhanced compliance with data storage regulations.

Benefits of log normalization include: • Improved visibility: Easier to search and analyse logs across different sources. • Reduced costs: Eliminates need for separate analysis tools for various log formats. • Improved compliance: Helps meet regulations requiring standardized log data storage.

Process

Identify Common Fields: Decide which data points (like timestamp, source, message) you want to unify across all your logs.
Create Mapping Table: Define how each field translates between original and common formats. This includes field names, data types, and any necessary transformations.
Use a Log Normalization Tool: Automate the process using a tool that applies the mapping table and transforms your log data.
Verify Accuracy: Ensure the normalized logs are in the correct format and the data is accurate.
Example Mapping Table • timestamp -> timestamp (datetime, Convert to UTC) • source -> source (string, None) • hostname -> hostname (string, None) • application name -> application_name (string, None) • log level -> log_level (string, Convert to uppercase) • message -> message (string, None) • event ID -> event_id (integer, None)

Original field Normalized field Data type Transformation timestamp timestamp datetime Convert to UTC source source string None hostname hostname string None application name application_name string None log level log_level string Convert to uppercase message message string None event ID event_id integer None