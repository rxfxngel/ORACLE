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

**NEW QUESTION 3:** Which two statements are true about PL/SQL exception propagation? (Choose two.)
- A. The exception reproduces Itself In successive enclosing blocks until a handler is foun
- B. Exception- can propagate across the remote subprograms that are called through database link
- C. If you declare a local exception in a subblock and a global exception in the outer block, the local declaration overrides the global exceptio
- D. If you declare a local exception in a subblock and a global exception in the outer block, the global declaration overrides the local exceptio

`Answer: AC`

**NEW QUESTION 4:** Examine the following PL/SQL code:
```sql
  DECLARE
    CURSOR c1 IS SELECT last_name FROM employees  ORDER BY last_name;
    name1 employees.last_name%TYPE;
    name2 employees.last_name%TYPE;
    name3 employees.last_name%TYPE;
    name4 employees.last_name%TYPE;
  BEGIN
    OPEN c1;
    FETCH c1 INTO name1;
    FETCH c1 INTO name2;
    FETCH c1 INTO name3;
    FETCH c1 INTO name4;
    CLOSE c1;
  END;
  /
```
Which statement is true about the fetch statements in the PL/SQL code?
- A. Each fetch retrieves the first row and assigns values to the target variable
- B. Each fetch retrieves the next consecutive row and assigns values to the target variable
- C. They produce an error because you must close and reopen the cursor before each fetch -statemen
- D. Only the first fetch retrieves the first row and assigns values to the target variables- the second produces an erro

`Answer: B`

**NEW QUESTION 5:** View the Exhibit and examine the code
```sql
CREATE OR REPLACE PROCEDURE wording IS
  TYPE Definition IS RECORD(
    word VARCHAR2(20),
    meaning VARCHAR(200)
  );
  lexicon Definition;
  PROCEDURE add_entry(wordlist IN OUT Definition) IS
  BEGIN
     wordlist:= 'aardvark';
     lexicon.word:='aardwolf';
  END add_entry;
BEGIN
  add_entry(lexicon);
  DBMS_OUTPUT.PUT_LINE(wordlist.word);
  DBMS_OUTPUT.PUT_LINE(lexicon.word);
END wording;
/
```
Why does the code give an error on execution?
- A. because the WORD_LIST variable is not visible in procedure wording
- B. because the lexicon variable is not visible in procedure ADD_ENTRY
- C. because the lexicon variable is not initialized in procedure wording
- D. because the WORD_LIST parameter in out mode cannot be of a record data type

`Answer: A`


**NEW QUESTION 6:** Which two statements are true about statement-level and row-level triggers? (Choose two.)
- A. A row trigger fires once even if no rows are affecte
- B. A statement trigger fires once even if no rows are affecte
- C. Row triggers are useful if the trigger action depends on the data of rows that are affected or on data that is provided by the triggering event itsel
- D. Statement triggers are useful if the trigger action depends on the data of rows that are affected or on data that is provided by the triggering event itsel

`Answer: BC`

**NEW QUESTION 7:** View the Exhibit to examine the PL/SQL code.
```sql
DECLARE
    type t_rec is record
    (
        v_sal    number(8),
        v_minsal number(8) default 1000,
        v_hire_date employees.hire_date%type,
        v_rec1 employees%rowtype
    );
    v_myrec t_rec;
BEGIN
    v_myrec.v_sal:=v_myrec.v_minsal+500;
    v_myrec.v_hire_date := sysdate;
    SELECT * INTO v_myrec.v_rec1
        FROM EMPLOYEES WHERE employee_id= 100;
    DBMS_OUTPUT.PUT_LINE(v_myrec.v_rec1.last_name ||' '||to_char(v_myrec.v_hire_date)||' '||to_char(v_myrec.v_sal));

END;
```
The record for the employee with employee__id 100 in the employees table is as follows;
```
SQL> SELECT employee_id,first_name,last_name,email,hire_date,job_id,salary 
  2          FROM EMPLOYEES WHERE employee_id= 100;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                                              HIRE_DAT JOB_ID         SALARY
----------- -------------------- ------------------------- -------------------------------------------------- -------- ---------- ----------
        100 Steven               King                      SKING                                              17/06/87 AD_PRES         24000
```        
        
- A. King 17-JUN-87 1500
- B. King 17-JUN-87 24000
- C. King current sysdate 1500
- D. King current sysdate 24000

`Answer: A`
