# GraphQL Attacks

## 1️⃣ Endpoint Discovery

Some endpoints left in the wild can help attackers implement queries easily.

Common Endpoints

- `/graphql`
- `/graphiql`
- `/explorer`

Common GraphQL IDEs

- GraphQL Playground
- GraphiQL
- etc

---

## 2️⃣ Getting Started with Queries

### Enumeration

- `Enumerate the whole database schema`
- `Enumerate tables, types, and names`

### Query Parameters

- Query types
- Arguments structure
- Number of arguments

> 💡 Wordlists for enumeration can be found in **SecLists GraphQL wordlist**.

---

## 3️⃣ Getting Started with Mutations

### API Documentation Sources

- Organization’s GitHub
- API documentation in the application
- Open-source projects with public documentation
- User documentation
- Extract mutations by type in documentation
- Enumerate schema and sort mutations

### Schema Mutations

- Adding item
- Item deletion
- etc.

### Application Behavior Mutations

- Adding item
- Item deletion
- etc.

> ⚠️ If you can control mutations, you might modify or control data on the server side.

---

## 4️⃣ Mutations Exploit

### Exploit Mutations

- Adding files / attachments
- Deleting resources
- Modifying resources
- User management
- Profiling systems
- Logging systems
- Backup systems
- etc.

### Possible Mutation Functions

- Exploit mutations
- Add / remove items in cart
- etc.

---

## 5️⃣ Authentication Attacks

- **Multiple Brute Forcing**: Brute force multiple credentials via nested queries
- **Sessions / Cookies Retrieval**: Retrieve stored sessions or cookies via crafted GraphQL requests
- **Restrictions Bypass**:
        - Account locking bypass if counter resets or not called properly
        - Ensure attacker can log in again

---

## 6️⃣ Business Logic Attacks

### Mutations

- Modifying item’s price
- Modifying item’s accuracy
- Buying items through checkout without executing the checkout function
- Adding / removing items from other users’ accounts
- etc.
