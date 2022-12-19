import datetime
import dbdb
import cx_Oracle

def connection():
    conn = cx_Oracle.connect("sp/smhrd@project-db-stu.ddns.net:1524/xe")
    return conn

def parking_check(apt_dong,dvc_num):
    conn = connection()
    cs = conn.cursor()
    dvc_num=dvc_num
    apt_dong=apt_dong
    sql = f"select DVC_NUM,CAR_NUM from PARKING_INFO WHERE APT_DONG={apt_dong} and DVC_NUM={dvc_num}"
    rs = cs.execute(sql)
    #print(cursor.fetchall())
    info = cs.fetchone()
    #print('info>>',info)
    conn.close()
    if info==None:
        info = 0
        return info    
    else:
        return info
    

def car_in(info):
    conn = connection()
    cs = conn.cursor()
    sql = f"insert into PARKING_INFO(DVC_NUM,APT_DONG,APT_NUM,DVC_STATE,CAR_NUM,IN_TIME) values('{info[0]}','{info[1]}','{info[2]}','{info[3]}','{info[4]}','{info[5]}')"
    rs = cs.execute(sql)
    conn.commit()
    conn.close()
    #print('insert rs : ',rs)
    
def car_out(info):
    dvc_num = info[0]
    conn = connection()
    cs = conn.cursor()
    sql = f"UPDATE PARKING_INFO SET OUT_TIME = '{info[1]}' WHERE DVC_NUM={info[0]}"
    rs = cs.execute(sql)
    conn.commit()

    set_data(dvc_num)
    conn.close()
    #print('insert rs : ',rs)
    
def set_data(info):
    conn = connection()
    cs = conn.cursor()
    #sql = f'select CAR_NUM,IN_TIME,OUT_TIME from PARKING_INFO where DVC_NUM={info}'
    sql = f'select CAR_NUM,IN_TIME,OUT_TIME from PARKING_INFO where DVC_NUM={info}'
    rs = cs.execute(sql)
    time_data = cs.fetchall()
    
    sql = f"insert into P_TIME_INFO values(T_INFO_seq.nextval,'{time_data[0][0]}', '{time_data[0][1]}', '{time_data[0][2]}')"
    rs = cs.execute(sql)
  
    sql = f'DELETE FROM PARKING_INFO WHERE DVC_NUM={info}'
    rs = cs.execute(sql)
    
    
    conn.commit()
    