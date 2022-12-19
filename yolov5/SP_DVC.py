import datetime as dt
import SP_Oracle_lib as db

apt_num = 1
apt_dong = 102
dvc_num = 2
now = dt.datetime.now()
io_time = now.strftime("%H:%M")

#D_car_number='953우4639'

#Parking_info(TABLE INDEX)
#[0] = dvc_num,[1]=apt_dong,[2]=apt_num,[3]=dvc_state,[4]=car_num,[5]=in_time,[6]=out_time
#state[3] == 0:available, 1: occupied ,2: visit

def recognize(D_car_number):
    
    rc = db.parking_check(apt_dong,dvc_num)
    if rc==0:
        dvc_state=1
        info = [dvc_num,apt_dong,apt_num,dvc_state,D_car_number,io_time]
        db.car_in(info)
        print('car_in')
        #db.send_request(url,dvc_num,dvc_state)
    else:
        dvc_state=0
        info = [dvc_num,io_time]
        db.car_out(info)
        print('car_out')
        #db.send_request(url,dvc_num,dvc_state)
        #print(rc)

def getDVC_INFO():
    dvc_state= db.parking_check(dvc_num)
    
    if dvc_state==0:
        dvc_state = 0
        info =[apt_num,apt_dong,dvc_num,dvc_state]
    else :
        car_num = dvc_state[1]
        dvc_state = dvc_state[0]
        info =[apt_num,apt_dong,dvc_num,dvc_state,car_num]
    
    return info
#recognize(D_car_number)
