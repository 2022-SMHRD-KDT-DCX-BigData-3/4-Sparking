SELECT * FROM PMEMBER;

INSERT INTO PMEMBER (memId, memPw, APT_DONG, APT_HNUM, APT_NUM, Car_Num)  values ('YH123', 'YH123', '101', '1102', 1, '1111223345');

Create table Member(
	mem_Id varchar2(11) not null,
	mem_Pw varchar2(10) not null,
	APT_DONG	VARCHAR2(10),
	APT_HNUM	VARCHAR2(10),
	P_INTIME	DATE null,
	P_OUTTIME	DATE null,
	APT_NUM	NUMBER,
	MEM_GRADE	VARCHAR2(3) default 0,
	CHECK_TIME	DATE default sysdate,
	Car_Num 	VARCHAR2(10),
	primary key(mem_Id) 
);


CREATE TABLE ADD_CAR(
    MEMID VARCHAR2(11) PRIMARY KEY,
    CAR_NUM VARCHAR2(10)
);


CREATE TABLE Update_Info(
    memId VARCHAR2(11) PRIMARY KEY,
    memPw VARCHAR2(20),
    P_INTIME DATE,
    P_OUTTIME DATE,
    CAR_NUM VARCHAR2(10)
);



drop table MEMBER;
select memId,memPw,apt_dong,apt_hnum,to_char(p_intime,'HH24:MI'),to_char(p_outtime,'HH24:MI'),apt_num, car_num from PMember 

SELECT * FROM MEMBER;

SELECT * FROM Update_Info

Insert into Member (mem_Id, mem_Pw, APT_DONG, APT_HNUM, APT_NUM, Car_Num)  values ('admin', 'admin', 'default', 'default', 1, '1111223345');

Insert into Member (mem_Id, mem_Pw, APT_DONG, APT_HNUM, APT_NUM, Car_Num)  values ('1234', '1234', '101', '112', 2, '1111223367');
