create table GuestTB(
    MESSAGE_ID NUMBER,
    GUEST_NAME VARCHAR2(10) NOT NULL,
    PASSWORD VARCHAR2(10) NOT NULL,
    MESSAGE VARCHAR2(1024) NOT NULL,
    CONSTRAINT guesttb_pk PRIMARY KEY(MESSAGE_ID)
);
CREATE SEQUENCE seq_messageId_guestTb;
drop table GuestTB;
drop sequence seq_messageId_guestTb;

select * from GuestTB;
-- 1. 정렬하고자 하는 컬럼이 PK
select rownum, empno FROM emp; 
-- 정렬하고자 하는 컬럼이 PK가 아닌 경우
select rownum, ename FROM emp; 
select rownum, MESSAGE_ID FROM guesttb;
-- 2. 기존 컬럼으로 정렬
select rownum, empno from emp order by empno;
-- 새 컬럼으로 정렬
select rownum, MESSAGE_ID from guesttb order by rownum asc, message_id asc;
-- 3. 기존 컬럼으로 정렬 후 rownum 추출
select rownum, ename 
from (select ename from emp order by empno desc);


select rownum, MESSAGE_ID from guesttb order by message_id desc;
select rownum, message_id
from ( select rownum, MESSAGE_ID from guesttb order by message_id desc );
-- 4. rownum을 부분 검색
select rnum, message_id
from ( select rownum as rnum, message_id from ( select rownum, MESSAGE_ID from guesttb order by message_id desc ) )
where rnum>=1 and rnum<=3;

--5. 해당 번호의 레코드를 검색
select *
from emp
where empno in(
    select empno
    from (select rownum as rnum, empno
            from (select empno from emp order by empno desc) )
            where rnum>=1 and rnum<=3
)
order by empno desc;

/* ------------------------------------------------------------
1. 정렬하고 싶은 기준으로 정렬(message_id)
2. 1번에서 rownum을 새로 뽑아옴(1번에서 바로 가져오면 rownum이 섞임)
3. 뽑고 싶은 rownum 번호 사이에서 뽑아옴(message_id 와 rownum)
4. pk를 기준으로 뽑아오고 정렬하고 싶은 기준으로 정렬
*/ ------------------------------------------------------------
select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rnum>=1 and rnum<=3
)
order by message_id desc;

select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rnum>=1 and rnum<=3
)
order by message_id desc;


----------------------------------------------------------------------
select *
from guesttb
where message_id in(
    select message_id
    from (select rownum as rnum, message_id
            from (select message_id from guesttb order by message_id desc) )
            where rownum>=1 and rownum<=3
)
order by message_id desc;
----------------------------------------------------------------------

