CREATE TABLE CTFD_CHALLENGES (
    challenge_id      NUMBER(10) NOT NULL,
    challenge_type    VARCHAR2(50) NOT NULL,
    name              VARCHAR2(150) NOT NULL,
    category          VARCHAR2(100),
    state             VARCHAR2(20) DEFAULT 'visible',
    value             NUMBER(10),
    max_attempts      NUMBER(6),
    description       CLOB,
    connection_info   CLOB,
    CONSTRAINT PK_CTFD_CHALLENGES PRIMARY KEY (challenge_id)
);

CREATE TABLE CTFD_FLAGS (
    flag_id          NUMBER(10) NOT NULL,
    challenge_id     NUMBER(10) NOT NULL,
    flag_type        VARCHAR2(50) NOT NULL,
    content          VARCHAR2(4000) NOT NULL,
    data             CLOB,
    CONSTRAINT PK_CTFD_FLAGS PRIMARY KEY (flag_id),
    CONSTRAINT FK_FLAGS_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id)
);

CREATE TABLE CTFD_HINTS (
    hint_id          NUMBER(10) NOT NULL,
    challenge_id     NUMBER(10) NOT NULL,
    cost             NUMBER(10) DEFAULT 0,
    content          CLOB NOT NULL,
    requirements     CLOB,
    CONSTRAINT PK_CTFD_HINTS PRIMARY KEY (hint_id),
    CONSTRAINT FK_HINTS_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id)
);

CREATE TABLE CTFD_CHALLENGE_TAGS (
    challenge_id     NUMBER(10) NOT NULL,
    tag_id           NUMBER(10) NOT NULL,
    CONSTRAINT PK_CTFD_CHALLENGE_TAGS PRIMARY KEY (challenge_id, tag_id),
    CONSTRAINT FK_CTAG_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id),
    CONSTRAINT FK_CTAG_TAG FOREIGN KEY (tag_id)
        REFERENCES CTFD_TAGS (tag_id)
);

CREATE TABLE CTFD_CHALLENGE_TOPICS (
    challenge_id     NUMBER(10) NOT NULL,
    topic_id         NUMBER(10) NOT NULL,
    CONSTRAINT PK_CTFD_CHALLENGE_TOPICS PRIMARY KEY (challenge_id, topic_id),
    CONSTRAINT FK_CTOPIC_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id),
    CONSTRAINT FK_CTOPIC_TOPIC FOREIGN KEY (topic_id)
        REFERENCES CTFD_TOPICS (topic_id)
);

CREATE TABLE CTFD_CHALLENGE_FILES (
    challenge_id     NUMBER(10) NOT NULL,
    file_id          NUMBER(10) NOT NULL,
    CONSTRAINT PK_CTFD_CHALLENGE_FILES PRIMARY KEY (challenge_id, file_id),
    CONSTRAINT FK_CFILE_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id),
    CONSTRAINT FK_CFILE_FILE FOREIGN KEY (file_id)
        REFERENCES CTFD_FILES (file_id)
);
