import cv2



cap = cv2.VideoCapture(0)

 

while(cap.isOpened()):

    ret, frame = cap.read()

   

    if ret:
        frame  =  cv2.rotate(frame, cv2.ROTATE_180)  # 180도 회전
        cv2.imshow('video', frame)

 

        if cv2.waitKey(1) & 0xFF == ord('q'):

                break

    else:

        break

 

cap.release()

cv2.destroyAllWindows()