CREATE TABLE INSTRUCTOR (
    instructor_id NUMBER(10) NOT NULL,
    name          VARCHAR2(100) NOT NULL,
    street        VARCHAR2(100),
    city          VARCHAR2(60),
    state         VARCHAR2(30),
    postal_code   VARCHAR2(20),
    phone_number  VARCHAR2(20),
    CONSTRAINT PK_INSTRUCTOR PRIMARY KEY (instructor_id)
);

CREATE TABLE COURSE (
    course_id      NUMBER(10) NOT NULL,
    name           VARCHAR2(100) NOT NULL,
    duration       NUMBER(4),
    fee            NUMBER(10,2),
    instructor_id  NUMBER(10) NOT NULL,
    CONSTRAINT PK_COURSE PRIMARY KEY (course_id),
    CONSTRAINT FK_COURSE_INSTRUCTOR FOREIGN KEY (instructor_id)
        REFERENCES INSTRUCTOR (instructor_id)
);

CREATE TABLE STUDENT (
    student_id     NUMBER(10) NOT NULL,
    name           VARCHAR2(100) NOT NULL,
    street         VARCHAR2(100),
    city           VARCHAR2(60),
    state          VARCHAR2(30),
    postal_code    VARCHAR2(20),
    phone_number   VARCHAR2(20),
    CONSTRAINT PK_STUDENT PRIMARY KEY (student_id)
);

CREATE TABLE COURSE_ENROLLMENT (
    course_id    NUMBER(10) NOT NULL,
    student_id   NUMBER(10) NOT NULL,
    enrolled_on  DATE,
    CONSTRAINT PK_COURSE_ENROLLMENT PRIMARY KEY (course_id, student_id),
    CONSTRAINT FK_CE_COURSE FOREIGN KEY (course_id)
        REFERENCES COURSE (course_id),
    CONSTRAINT FK_CE_STUDENT FOREIGN KEY (student_id)
        REFERENCES STUDENT (student_id)
);
