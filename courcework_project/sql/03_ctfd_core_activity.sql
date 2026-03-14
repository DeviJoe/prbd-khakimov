CREATE TABLE CTFD_SOLVES (
    solve_id         NUMBER(10) NOT NULL,
    user_id          NUMBER(10),
    team_id          NUMBER(10),
    challenge_id     NUMBER(10) NOT NULL,
    ip               VARCHAR2(64),
    provided         VARCHAR2(4000),
    submitted_at     TIMESTAMP NOT NULL,
    CONSTRAINT PK_CTFD_SOLVES PRIMARY KEY (solve_id),
    CONSTRAINT FK_SOLVES_USER FOREIGN KEY (user_id)
        REFERENCES CTFD_USERS (user_id),
    CONSTRAINT FK_SOLVES_TEAM FOREIGN KEY (team_id)
        REFERENCES CTFD_TEAMS (team_id),
    CONSTRAINT FK_SOLVES_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id)
);

CREATE TABLE CTFD_FAILS (
    fail_id          NUMBER(10) NOT NULL,
    user_id          NUMBER(10),
    team_id          NUMBER(10),
    challenge_id     NUMBER(10) NOT NULL,
    ip               VARCHAR2(64),
    provided         VARCHAR2(4000),
    submitted_at     TIMESTAMP NOT NULL,
    CONSTRAINT PK_CTFD_FAILS PRIMARY KEY (fail_id),
    CONSTRAINT FK_FAILS_USER FOREIGN KEY (user_id)
        REFERENCES CTFD_USERS (user_id),
    CONSTRAINT FK_FAILS_TEAM FOREIGN KEY (team_id)
        REFERENCES CTFD_TEAMS (team_id),
    CONSTRAINT FK_FAILS_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id)
);

CREATE TABLE CTFD_AWARDS (
    award_id         NUMBER(10) NOT NULL,
    user_id          NUMBER(10),
    team_id          NUMBER(10),
    challenge_id     NUMBER(10),
    name             VARCHAR2(150) NOT NULL,
    description      CLOB,
    value            NUMBER(10) NOT NULL,
    awarded_at       TIMESTAMP NOT NULL,
    CONSTRAINT PK_CTFD_AWARDS PRIMARY KEY (award_id),
    CONSTRAINT FK_AWARDS_USER FOREIGN KEY (user_id)
        REFERENCES CTFD_USERS (user_id),
    CONSTRAINT FK_AWARDS_TEAM FOREIGN KEY (team_id)
        REFERENCES CTFD_TEAMS (team_id),
    CONSTRAINT FK_AWARDS_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id)
);

CREATE TABLE CTFD_RATINGS (
    rating_id        NUMBER(10) NOT NULL,
    user_id          NUMBER(10) NOT NULL,
    challenge_id     NUMBER(10) NOT NULL,
    rating_value     NUMBER(1) CHECK (rating_value BETWEEN 1 AND 5),
    rated_at         TIMESTAMP,
    CONSTRAINT PK_CTFD_RATINGS PRIMARY KEY (rating_id),
    CONSTRAINT FK_RATINGS_USER FOREIGN KEY (user_id)
        REFERENCES CTFD_USERS (user_id),
    CONSTRAINT FK_RATINGS_CHALLENGE FOREIGN KEY (challenge_id)
        REFERENCES CTFD_CHALLENGES (challenge_id),
    CONSTRAINT UQ_CTFD_RATINGS UNIQUE (user_id, challenge_id)
);
