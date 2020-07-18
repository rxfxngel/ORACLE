# Exam Questions 1Z0-144

**NEW QUESTION 1 :** Which statement is true about triggers on data definition language (DDL) statements?

- A. They can be used to track changes only to a table or inde
- B. They can be defined by all users in the database or only by a specific use
- C. They are fired only when the owner of the object Issues the DDL statemen
- D. They can be used to track changes to a table, table space, view, or synony

`Answer: D`

**NEW QUESTION 2:** Examine the following package specification.
```
SQL>CREATE OR REPLACE PACKAGE emp_pkf IS
PROCEDURE search_emp (empdet NUMBER);
PROCEDURE search_emp (empdet DATE);
PROCEDURE search_emp (empdet NUMBER); RETURN VERCHAR2
PROCEDURE search_emp (empdet NUMBER); RETURN DATE
END emp_pkg
/
```
The package is compiled successfully
Why would it generate an error at run tune?

- A. Because function cannot be overload
- B. Because function cannot differ only in return typ
- C. Because all the functions and procedures In the package cannot have the same number of parameters with the same parameter name
- D. Because the search EMP (EMPDET NUMBER) procedure and the SEARCH_DEPT (EMPDET NUMBER) cannot have identical parameter names and data types
`Answer: B`

