Navigating the Microsoft Entra ID (formerly Azure AD) portal can feel like looking at a digital birth certificate for a user. Each attribute serves a specific purpose for authentication, billing, or organizational structure.

Here is the breakdown of the attributes you provided, categorized for clarity:

1. Primary Identity & Security
These are the "hard" identifiers used by the system to recognize who the user is.
	• User Principal Name (UPN): The primary login username (e.g., user1@spectrum27.onmicrosoft.com). It follows the RFC 822 email format but is technically an identity identifier.
	• Object ID: A globally unique identifier (GUID) assigned to the user. While UPNs can change, the Object ID is permanent and is used by APIs and internal logs.
	• Identities: Lists the methods the user can use to sign in (e.g., via the local domain or a social provider).
	• Sign in sessions valid from date time: A security timestamp. If an admin "revokes sessions," this date updates, and any tokens issued before this time become invalid.
	• Last password change date time: Exactly what it sounds like. Useful for enforcing password rotation policies.
	• Password policies/profile: Defines if the user has a "Password Never Expires" policy or if they are required to change it at next login.
	• Authorization info: Contains details about the user's security permissions and MFA (Multi-Factor Authentication) settings.

2. Lifecycle & Account Status
These attributes tell you when the account was born and if it’s currently allowed to "speak" to the network.
	• Account status / Account enabled: A simple toggle. If set to No/Disabled, the user cannot log in, regardless of their password.
	• Created date time: The timestamp of when the object was first created in Entra ID.
	• User type: Usually Member (internal employees) or Guest (external partners brought in via B2B).
	• Creation type: Indicates how the account was made (e.g., "Invitation" for guests).
	• B2B invitation / Invitation state: Tracks the status of an external guest (e.g., "Pending Acceptance" or "Accepted").
	• External user state change date time: Records when a guest user’s status last changed.

3. Organizational & Job Info
These are "soft" attributes. They don't affect login but are vital for Dynamic Groups (e.g., "Add everyone in the 'Sales' Department to this group").
	• Display name / First name / Last name: How the user appears in the Address Book.
	• Job Information (Title, Dept, Company, Employee ID): Used for HR reporting and automated access assignments.
	• Manager / Sponsors: Defines the reporting hierarchy. "Sponsors" are typically used for Guest users to track who is responsible for them.
	• Employee hire date / Employee type: High-level HR data often synced from an external HRIS like Workday.

4. Memberships & Licensing
This is the "What do they have access to?" section.
	• Group memberships: A count of the security or Microsoft 365 groups the user belongs to.
	• Applications: The number of Enterprise Applications assigned specifically to this user.
	• Assigned roles: Administrative privileges (e.g., "Global Administrator" or "Helpdesk Admin").
	• Assigned licenses: Which paid services (like Office 365 E5) are active for this user.

5. Contact & Messaging
	• Contact Info (Address, Phone, Email): Standard contact details.
	• Other emails / Proxy addresses: Additional email aliases. If a user has a proxy address, they can receive mail there, though they usually still log in with their UPN.
	• Mail nickname: The "alias" part of the email (the text before the @ symbol).
	• IM addresses: Used for Teams/Skype communication routing.

6. On-Premises Synchronization
If you use Microsoft Entra Connect to sync users from a local Active Directory (server in your office), these fields become active.
	• On-premises sync enabled: If No, this user was created directly in the cloud. If Yes, they are managed from your local server.
	• On-premises last sync date time: When the local server last "talked" to the cloud about this user.
	• On-premises immutable ID: The "anchor" that links the local user object to the cloud user object.
	• Distinguished name / SAM account name: Legacy AD identifiers (e.g., CN=User1,OU=Users,DC=Corp).

7. Settings & Compliance
	• Usage location: Crucial. This must be set (e.g., "US") to assign licenses, as service availability varies by country.
	• Preferred language: Sets the default language for the user's Microsoft 365 interface.
	• Parental controls (Age group/Consent): Used for legal compliance (COPPA/GDPR) regarding minors and data privacy.
	• Extension attributes: 15 custom slots (ExtensionAttribute1-15) used by admins to store unique data not covered by standard fields.
Would you like me to show you how to use some of these attributes to create a Dynamic Membership Rule for a group?

From <https://gemini.google.com/app/10e248558f45ccdd?utm_source=app_launcher&utm_medium=owned&utm_campaign=base_all> 
