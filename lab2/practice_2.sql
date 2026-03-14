CREATE TABLE MANAGER (
    manager_id NUMBER(10) NOT NULL,
    full_name  VARCHAR2(100) NOT NULL,
    phone      VARCHAR2(20),
    email      VARCHAR2(100),
    CONSTRAINT PK_MANAGER PRIMARY KEY (manager_id)
);

CREATE TABLE DISTRICT (
    district_id   NUMBER(10) NOT NULL,
    district_name VARCHAR2(100) NOT NULL,
    city          VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_DISTRICT PRIMARY KEY (district_id)
);

CREATE TABLE GUEST (
    guest_id    NUMBER(10) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    first_name  VARCHAR2(50) NOT NULL,
    phone       VARCHAR2(20),
    email       VARCHAR2(100),
    document_no VARCHAR2(30),
    CONSTRAINT PK_GUEST PRIMARY KEY (guest_id)
);

CREATE TABLE HOTEL (
    hotel_id    NUMBER(10) NOT NULL,
    hotel_name  VARCHAR2(100) NOT NULL,
    address     VARCHAR2(200),
    category    VARCHAR2(30),
    phone       VARCHAR2(20),
    district_id NUMBER(10) NOT NULL,
    manager_id  NUMBER(10) NOT NULL,
    CONSTRAINT PK_HOTEL PRIMARY KEY (hotel_id),
    CONSTRAINT FK_HOTEL_DISTRICT FOREIGN KEY (district_id)
        REFERENCES DISTRICT (district_id),
    CONSTRAINT FK_HOTEL_MANAGER FOREIGN KEY (manager_id)
        REFERENCES MANAGER (manager_id)
);

CREATE TABLE ROOM (
    room_id      NUMBER(10) NOT NULL,
    room_number  VARCHAR2(10) NOT NULL,
    room_type    VARCHAR2(30),
    capacity     NUMBER(2),
    daily_rate   NUMBER(10,2),
    is_active    CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
    hotel_id     NUMBER(10) NOT NULL,
    CONSTRAINT PK_ROOM PRIMARY KEY (room_id),
    CONSTRAINT FK_ROOM_HOTEL FOREIGN KEY (hotel_id)
        REFERENCES HOTEL (hotel_id)
);

CREATE TABLE RESERVATION (
    reservation_id   NUMBER(10) NOT NULL,
    guest_id         NUMBER(10) NOT NULL,
    room_id          NUMBER(10) NOT NULL,
    check_in_date    DATE NOT NULL,
    check_out_date   DATE NOT NULL,
    reservation_date DATE,
    status           VARCHAR2(20),
    CONSTRAINT PK_RESERVATION PRIMARY KEY (reservation_id),
    CONSTRAINT FK_RESERVATION_GUEST FOREIGN KEY (guest_id)
        REFERENCES GUEST (guest_id),
    CONSTRAINT FK_RESERVATION_ROOM FOREIGN KEY (room_id)
        REFERENCES ROOM (room_id)
);
