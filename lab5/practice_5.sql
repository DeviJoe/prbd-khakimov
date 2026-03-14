CREATE TABLE EMPLOYEE (
    employee_id NUMBER(10) NOT NULL,
    name        VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY (employee_id)
);

CREATE TABLE PROJECT (
    project_number NUMBER(10) NOT NULL,
    title          VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_PROJECT PRIMARY KEY (project_number)
);

CREATE TABLE WORK_ASSIGNMENT (
    employee_id    NUMBER(10) NOT NULL,
    project_number NUMBER(10) NOT NULL,
    date_assigned  DATE NOT NULL,
    duration       NUMBER(4),
    CONSTRAINT PK_WORK_ASSIGNMENT PRIMARY KEY (
        employee_id,
        project_number,
        date_assigned
    ),
    CONSTRAINT FK_WORK_ASSIGNMENT_EMPLOYEE FOREIGN KEY (employee_id)
        REFERENCES EMPLOYEE (employee_id),
    CONSTRAINT FK_WORK_ASSIGNMENT_PROJECT FOREIGN KEY (project_number)
        REFERENCES PROJECT (project_number)
);

CREATE TABLE PRODUCT (
    product_id   NUMBER(10) NOT NULL,
    name         VARCHAR2(100) NOT NULL,
    description  VARCHAR2(200),
    CONSTRAINT PK_PRODUCT PRIMARY KEY (product_id)
);

CREATE TABLE VENDOR (
    vendor_code NUMBER(10) NOT NULL,
    name        VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_VENDOR PRIMARY KEY (vendor_code)
);

CREATE TABLE SUPPLY (
    product_id     NUMBER(10) NOT NULL,
    vendor_code    NUMBER(10) NOT NULL,
    supply_price   NUMBER(10,2),
    delivery_days  NUMBER(3),
    CONSTRAINT PK_SUPPLY PRIMARY KEY (product_id, vendor_code),
    CONSTRAINT FK_SUPPLY_PRODUCT FOREIGN KEY (product_id)
        REFERENCES PRODUCT (product_id),
    CONSTRAINT FK_SUPPLY_VENDOR FOREIGN KEY (vendor_code)
        REFERENCES VENDOR (vendor_code)
);

CREATE TABLE MOVIE (
    movie_id   NUMBER(10) NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    category   VARCHAR2(50),
    CONSTRAINT PK_MOVIE PRIMARY KEY (movie_id)
);

CREATE TABLE ACTOR (
    actor_code  NUMBER(10) NOT NULL,
    stage_name  VARCHAR2(100),
    real_name   VARCHAR2(100),
    birth_date  DATE,
    CONSTRAINT PK_ACTOR PRIMARY KEY (actor_code)
);

CREATE TABLE CASTING (
    movie_id       NUMBER(10) NOT NULL,
    actor_code     NUMBER(10) NOT NULL,
    role_name      VARCHAR2(100),
    billing_order  NUMBER(3),
    CONSTRAINT PK_CASTING PRIMARY KEY (movie_id, actor_code),
    CONSTRAINT FK_CASTING_MOVIE FOREIGN KEY (movie_id)
        REFERENCES MOVIE (movie_id),
    CONSTRAINT FK_CASTING_ACTOR FOREIGN KEY (actor_code)
        REFERENCES ACTOR (actor_code)
);
