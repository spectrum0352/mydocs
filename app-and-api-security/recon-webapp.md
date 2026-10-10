**Q: How do you identify whether a remote web server is running Microsoft IIS or Apache?**

* **HTTP Response Headers:** Inspect the `Server`, `X-Powered-By`, and header order using `curl -I <URL>`.
* **Default Error Pages:** Request non-existent files (`/404\_test`) to inspect formatting; IIS produces distinct numbered error subcodes (e.g., `404.0 - Not Found`), while Apache returns standardized minimalist error templates.
* **URL Case Sensitivity:** Windows/IIS is case-insensitive (`/Default.aspx` vs `/default.aspx`), whereas Linux/Apache is case-sensitive.
* **Header Capitalization & Verb Probing:** Issue alternative HTTP verbs (e.g., `OPTIONS`, `TRACK`) via netcat or OpenSSL and examine response handling.


