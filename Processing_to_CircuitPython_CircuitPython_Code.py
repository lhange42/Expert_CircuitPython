import board #pylint: disable-msg-import-error
import busio #pylint: disable-msg-import-error
import time #pylint: disable-msg-import-error
import analogio #pylint: disable-msg-import-error
import pulseio #pylint: disable-msg-import-error
from adafruit_motor import servo #pylint: disable-msg-import-error 

uart = busio.UART(board.TX, board.RX, baudrate=9600)

newString = ""
xCoord = ""
yCoord = ""
servoPosX = 0
servoPosY = 0

pwm1 = pulseio.PWMOut(board.A2, duty_cycle=2 ** 15, frequency=50)
servoX = servo.Servo(pwm1)

pwm2 = pulseio.PWMOut(board.A4, duty_cycle=2 ** 15, frequency=50)
servoY = servo.Servo(pwm2)

while True:
    #print('')
    output = uart.read(1)
    #output.decode("utf-8")


    #print(output)
    if output is not None:

            decodedOutput = output.decode("utf-8")

                
                

            if(decodedOutput == ","):
                xCoord = newString.replace("$","").replace(".0","")
                servoPosX = int(xCoord)
                print(servoPosX)
  
                newString = ""

                servoX.angle = servoPosX    

            if(decodedOutput == "$"):
                yCoord = newString.replace(",","").replace(".0","")
                servoPosY = int(yCoord)
                print(servoPosY)
               
                newString = ""
                servoY.angle = servoPosY 


                
            newString = newString + str(decodedOutput)
            
            

                

    time.sleep(.05)