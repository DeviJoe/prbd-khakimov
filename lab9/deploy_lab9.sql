CREATE TABLE OU_EMPLOYEE (
    employee_id VARCHAR2(6) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_OU_EMPLOYEE PRIMARY KEY (employee_id)
);

CREATE TABLE OU_PROJECT (
    project_number VARCHAR2(6) NOT NULL,
    title          VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_OU_PROJECT PRIMARY KEY (project_number)
);

CREATE TABLE OU_JOB_ASSIGNMENT (
    employee_id    VARCHAR2(6) NOT NULL,
    project_number VARCHAR2(6) NOT NULL,
    date_assigned  DATE NOT NULL,
    duration       NUMBER(4),
    CONSTRAINT PK_OU_JOB_ASSIGNMENT PRIMARY KEY (
        employee_id,
        project_number,
        date_assigned
    ),
    CONSTRAINT FK_OU_JOB_ASSIGNMENT_EMPLOYEE
        FOREIGN KEY (employee_id)
        REFERENCES OU_EMPLOYEE (employee_id),
    CONSTRAINT FK_OU_JOB_ASSIGNMENT_PROJECT
        FOREIGN KEY (project_number)
        REFERENCES OU_PROJECT (project_number)
);
