CREATE TABLE STUDENT (
    student_id NUMBER(10) NOT NULL,
    last_name  VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_STUDENT PRIMARY KEY (student_id)
);

CREATE TABLE GRADE (
    grade_code        VARCHAR2(10) NOT NULL,
    grade_description VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_GRADE PRIMARY KEY (grade_code)
);

CREATE TABLE TEACHER (
    teacher_number NUMBER(10) NOT NULL,
    teacher_name   VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_TEACHER PRIMARY KEY (teacher_number)
);

CREATE TABLE DEPARTMENT (
    department_code NUMBER(10) NOT NULL,
    department_name VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY (department_code)
);

CREATE TABLE COURSE (
    course_number   NUMBER(10) NOT NULL,
    course_name     VARCHAR2(100) NOT NULL,
    department_code NUMBER(10) NOT NULL,
    teacher_number  NUMBER(10) NOT NULL,
    CONSTRAINT PK_COURSE PRIMARY KEY (course_number),
    CONSTRAINT FK_COURSE_DEPARTMENT FOREIGN KEY (department_code)
        REFERENCES DEPARTMENT (department_code),
    CONSTRAINT FK_COURSE_TEACHER FOREIGN KEY (teacher_number)
        REFERENCES TEACHER (teacher_number)
);

CREATE TABLE ENROLLMENT (
    student_id     NUMBER(10) NOT NULL,
    course_number  NUMBER(10) NOT NULL,
    grade_code     VARCHAR2(10) NOT NULL,
    CONSTRAINT PK_ENROLLMENT PRIMARY KEY (student_id, course_number),
    CONSTRAINT FK_ENROLLMENT_STUDENT FOREIGN KEY (student_id)
        REFERENCES STUDENT (student_id),
    CONSTRAINT FK_ENROLLMENT_COURSE FOREIGN KEY (course_number)
        REFERENCES COURSE (course_number),
    CONSTRAINT FK_ENROLLMENT_GRADE FOREIGN KEY (grade_code)
        REFERENCES GRADE (grade_code)
);
