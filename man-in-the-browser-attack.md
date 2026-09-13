#  Man in the Browser Attack

MITB stands or Man-in-the-Browser Attack.

MITB attack uses a Trojan Horse to intercept the calls between the browser and its security mechanisms or libraries. It works with an already installed Trojan horse and acts between the browser and its security mechanisms. Its main objective is to cause financial deceptions by manipulating transactions of Internet Banking systems. The man-in-the-browser attack will be successful irrespective of security mechanisms such as SSL, PKI, or two-factor authentication in place, as all the expected controls and security mechanisms would seem to work normally.

**MITB attack Process**

- Trojan first infects the computer's software (OS or application).

- Trojan installs malicious code (extension files) and saves it into the browser configuration.

- After the user restarts the browser, the malicious code in the form of extension files is loaded.

- Extension files register a handler for every visit to the webpage.

- When the page is loaded, the extension uses the URL and matches it with a list of known sites targeted for attack.

- The user logs in securely to the website.

- It registers a button event handler when a specific page load is detected for a specific pattern and compares it with its targeted list.

- When the user clicks on the button, the extension uses the DOM interface and extracts all the data from all form fields and modifies the values.

- The browser sends the form and modified values to the server.

- The server receives the modified values but cannot distinguish between the original and the modified values.

- After the server performs the transaction, a receipt is generated.

- Now, the browser receives the receipt for the modified transaction.

- The browser displays the receipt with the original details.

- The user thinks that the original transaction was received by the server without any interceptions.

## MITB Attack

Man-in-the-Browser (MitB) Attack.

A MitB attack targets a user's web browser, essentially inserting itself between the user and the website they are visiting. Here is how it works:

- **Infection:** A Trojan infects the user's device (computer or phone).

- **Malicious Extension Installation:** The Trojan installs malicious code as browser extensions.

- **Extension Activation:** When the user restarts the browser, the extensions load.

- **Website Monitoring:** These extensions monitor websites visited by the user.

- **Targeted Login:** When the user visits a targeted website (often banking), the extension becomes active.

- **Form Manipulation:** The extension intercepts form submissions and modifies the data entered by the user (e.g., transaction amount).

- **Deception:** The modified data is sent to the website, while the user sees the original values on their screen, remaining unaware of the manipulation.

- **Impact:** Primarily targets financial transactions for fraudulent gains. Bypasses security measures like SSL, PKI, and even two-factor authentication because the attack happens within the user's browser.

**Prevention:**

- Be cautious of suspicious links and attachments that might install malware.

- Use reputable security software and keep it up to date.

- Be mindful of browser extensions and only install those from trusted sources.

- Check the URL and legitimacy of websites before entering sensitive information.
