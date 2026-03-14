CREATE TABLE CTFD_BRACKETS (
    bracket_id    NUMBER(10) NOT NULL,
    name          VARCHAR2(100) NOT NULL,
    description   CLOB,
    hidden        CHAR(1) DEFAULT 'N' CHECK (hidden IN ('Y', 'N')),
    max_attempts  NUMBER(6),
    CONSTRAINT PK_CTFD_BRACKETS PRIMARY KEY (bracket_id)
);

CREATE TABLE CTFD_TEAMS (
    team_id       NUMBER(10) NOT NULL,
    name          VARCHAR2(100) NOT NULL,
    email         VARCHAR2(150),
    website       VARCHAR2(200),
    affiliation   VARCHAR2(150),
    country       VARCHAR2(100),
    hidden        CHAR(1) DEFAULT 'N' CHECK (hidden IN ('Y', 'N')),
    banned        CHAR(1) DEFAULT 'N' CHECK (banned IN ('Y', 'N')),
    created_at    TIMESTAMP,
    bracket_id    NUMBER(10),
    CONSTRAINT PK_CTFD_TEAMS PRIMARY KEY (team_id),
    CONSTRAINT FK_TEAMS_BRACKET FOREIGN KEY (bracket_id)
        REFERENCES CTFD_BRACKETS (bracket_id)
);

CREATE TABLE CTFD_USERS (
    user_id         NUMBER(10) NOT NULL,
    name            VARCHAR2(100) NOT NULL,
    email           VARCHAR2(150) NOT NULL,
    password_hash   VARCHAR2(255) NOT NULL,
    user_type       VARCHAR2(30) NOT NULL,
    website         VARCHAR2(200),
    affiliation     VARCHAR2(150),
    country         VARCHAR2(100),
    hidden          CHAR(1) DEFAULT 'N' CHECK (hidden IN ('Y', 'N')),
    banned          CHAR(1) DEFAULT 'N' CHECK (banned IN ('Y', 'N')),
    created_at      TIMESTAMP,
    team_id         NUMBER(10),
    bracket_id      NUMBER(10),
    CONSTRAINT PK_CTFD_USERS PRIMARY KEY (user_id),
    CONSTRAINT UQ_CTFD_USERS_EMAIL UNIQUE (email),
    CONSTRAINT FK_USERS_TEAM FOREIGN KEY (team_id)
        REFERENCES CTFD_TEAMS (team_id),
    CONSTRAINT FK_USERS_BRACKET FOREIGN KEY (bracket_id)
        REFERENCES CTFD_BRACKETS (bracket_id)
);

CREATE TABLE CTFD_TAGS (
    tag_id     NUMBER(10) NOT NULL,
    value      VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_CTFD_TAGS PRIMARY KEY (tag_id),
    CONSTRAINT UQ_CTFD_TAGS_VALUE UNIQUE (value)
);

CREATE TABLE CTFD_TOPICS (
    topic_id    NUMBER(10) NOT NULL,
    value       VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_CTFD_TOPICS PRIMARY KEY (topic_id),
    CONSTRAINT UQ_CTFD_TOPICS_VALUE UNIQUE (value)
);

CREATE TABLE CTFD_FILES (
    file_id      NUMBER(10) NOT NULL,
    location     VARCHAR2(400) NOT NULL,
    sha1sum      VARCHAR2(40),
    file_type    VARCHAR2(50),
    CONSTRAINT PK_CTFD_FILES PRIMARY KEY (file_id)
);
