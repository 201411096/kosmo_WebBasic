CREATE TABLE comment_tab(
    comment_no number(19),
    user_id varchar2(20),
    comment_content varchar2(500),
    reg_date date,
    CONSTRAINT comment_tab_pk PRIMARY KEY(comment_no)
);

create sequence seq_comment;

INSERT INTO comment_tab VALUES(SEQ_COMMENT.nextval, 'abc', 'comment1', sysdate);
INSERT INTO comment_tab VALUES(SEQ_COMMENT.nextval, 'bcd', 'comment2', sysdate);
INSERT INTO comment_tab VALUES(SEQ_COMMENT.nextval, 'cde', 'comment3', sysdate);
INSERT INTO comment_tab VALUES(SEQ_COMMENT.nextval, 'def', 'comment4', sysdate);
INSERT INTO comment_tab VALUES(SEQ_COMMENT.nextval, 'efg', 'comment5', sysdate);