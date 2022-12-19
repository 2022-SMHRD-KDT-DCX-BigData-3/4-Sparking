import easyocr
import cv2
import matplotlib.pyplot as plt
import numpy as np
import re
import SP_DVC as dvc

def run():
    def display(im_path,name):
        #dpi = 80
        dpi = 40
        im_data = im_path

        height, width  = im_data.shape[:2]
        
        # What size does the figure need to be in inches to fit the image?
        figsize = width / float(dpi), height / float(dpi)

        # Create a figure of the right size with one axes that takes up the full figure
        fig = plt.figure(figsize=figsize)
        ax = fig.add_axes([0, 0, 1, 1])

        # Hide spines, ticks, etc.
        ax.axis('off')

        # Display the image.
        plt.title(name)
        ax.imshow(im_data, cmap='gray')
        plt.xticks([]),plt.yticks([])

        plt.show()

    def grayscale(img):
        return cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

    def thin_font(image):
        import numpy as np
        image = cv2.bitwise_not(image)
        kernel = np.ones((2,2),np.uint8)
        image = cv2.erode(image, kernel, iterations=1)
        image = cv2.bitwise_not(image)
        return (image)

    def thick_font(image):
        import numpy as np
        image = cv2.bitwise_not(image)
        kernel = np.ones((2,2),np.uint8)
        image = cv2.dilate(image, kernel, iterations=1)
        image = cv2.bitwise_not(image)
        return (image)

    def thr(img,thrval,maxval):
        # thrval default : 100
        # maxval defaul : 255
        ret,thr_img = cv2.threshold(img,thrval,maxval,cv2.THRESH_BINARY)
        return (img)

    #find text-block box
    def read(img_name,set_conf):
        img_path = img_name
        result = reader.readtext(img_path)
        
        r = []
        for bbox, text, conf in result:
            if conf > set_conf:
                r.append(text)
                cv2.rectangle(img, pt1=(int(bbox[0][0]), int(bbox[0][1])), pt2=(int(bbox[2][0]), int(bbox[2][1])), color=(0, 255, 0), thickness=3)
        numbers = str(r)[2:-2]
        numbers_list = list(numbers)
        for i in numbers_list:
            if i==' ':
                numbers_list.remove(i)
        return numbers_list

    def correct(found):
        numbers = ['0','1','2','3','4','5','6','7','8','9']
        char = ['가', '나', '다', '라', '마', '너', '더', '러', '머', '버', '서', '어', '저', '고', '노', '도', '로', '모', '보', '소', '오', '조', '구', '누', '두', '루', '무', '부', '수', '우', '주', '아', '바', '사', '자', '배', '하', '허', '호']
        unsorted_list = []
        char_ch = 0
        for i in reversed(found):
            if i in char:
                if char_ch==0:
                    #print('찾은값 : ',i)
                    char_ch+=1
                    unsorted_list.append(i)
            elif i in numbers:
                #print('찾은값 : ',i)
                unsorted_list.append(i)
        #print('unsorted : ',unsorted_list)
        if (len(unsorted_list)>=7 and len(unsorted_list)<=8) and char_ch==1:
            #print('plating')
            plate = car_plate(unsorted_list)
            return plate
        else :
            #print('tempring')
            temp = temp_comp(found)
            return (temp,False)
        
            
    def car_plate(unsorted_list):
        car_plate = []
        for i in reversed(unsorted_list):
            car_plate.append(i)
        print('final_car_number : ',car_plate)
        if len(car_plate)>8:
            car_plate = car_plate[1::]
        else:
            car_plate=car_plate
        return (car_plate,True)

    def temp_comp(temp):
        numbers = ['0','1','2','3','4','5','6','7','8','9']
        temp_list=[]
        cnt = 0
        char = 0
        
        for i in temp :
            kor = re.findall('[가-힣]{1}', i) 
            num = re.findall('[0-9]', i)
            if kor :
                char+=1
                temp_list.append(kor[0])
            if num:
                cnt+=1
                temp_list.append(num[0])
        if (cnt>=5 and char==1):
            print('temp_outed')
            if len(temp_list)>8:
                temp_list = temp_list[1::]
            else:
                temp_list=temp_list
            return temp_list

    # init
    thrval = 90
    maxval = 255
    conf = 0.4
    corr=False
    temp=[]
    cnt=0
    # 1. Inverted Images
    img = cv2.imread('./Detected.png')

    inverted_img = img.copy()
    inverted_img = cv2.bitwise_not(img)
    #display(img,'original')
    #display(inverted_img,'inverted')

    # 2. Binarization
    gray_img = img.copy()
    gray_img = grayscale(img)
    thr_img = thr(gray_img,thrval,maxval)
    #display(gray_img,'gray')
    #display(thr_img,'threshold')

    # 3.Dilation and Erosion
    ed_img = thr_img.copy()
    eroded_image = thin_font(ed_img)
    dilated_image = thick_font(ed_img)
    #display(eroded_image,'eroded_img')
    #display(dilated_image,'dilated_img')

    reader = easyocr.Reader(['ko'])
    for i in range(0,1,1):
        ori_result=read(img,conf)
        print('ori_result : ',ori_result)
        if len(ori_result)>=7:
            compare = correct(ori_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
                else:
                    temp.append(compare[0])
                    continue
                
        inv_result=read(inverted_img,conf)
        print('inv_result : ',inv_result)
        if len(inv_result)>=7:
            compare = correct(inv_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
                else:
                    temp.append(compare[0])
                    continue
                
        gray_result=read(gray_img,conf)
        print('gray_result : ',gray_result)
        if len(gray_result)>=7:
            compare = correct(gray_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
                else:
                    temp.append(compare[0])
                    continue
                
    while True:   
        i+=5
        if i>100:
            break
        print('thr_idx : ',i)
        ret,thr_img = cv2.threshold(gray_img,0+i,maxval-i,cv2.THRESH_BINARY)
        thr_result=read(thr_img,conf)
        print('thr_result : ',thr_result)
        #display(thr_img,'threshold')
        
        if len(thr_result)>=7:
            compare = correct(thr_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
                else :
                    temp.append(compare[0])
                    continue    

        eroded_result=read(eroded_image,conf)
        print('eroded_result : ',eroded_result)
        if len(eroded_result)>=7:
            compare = correct(eroded_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
                else :
                    temp.append(compare[0])
                    continue

        dilated_result=read(dilated_image,conf)
        print('dilated_result : ',dilated_result)
        if len(dilated_result)>=7:
            compare = correct(dilated_result)
            print('==============================================================================')
            if compare!=None:
                if compare[1]==True:
                    corr=True
                    break
            else:
                temp.append(compare[0])
                continue
        os.system('cls')
    if corr==True:
        car_number = ''.join(compare[0])
        print('플라스크로 보낼 번호',car_number)
        dvc.recognize(car_number)
    else:
        car_number = temp[0]
        print("임시번호 : ",car_number)
        dvc.recognize(car_number)
        
