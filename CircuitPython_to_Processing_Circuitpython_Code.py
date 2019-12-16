import time #pylint: disable-msg=import-error
import board#pylint: disable-msg=import-error
from analogio import AnalogIn#pylint: disable-msg=import-error

potentiometer = AnalogIn(board.A1)

uart = busio.UART(board.TX, board.RX, budrate=9600)





while True:

    print(potentiometer.value)

    mappedPotVal = map(potentiometer.value,0,1000,0,255)

    uart.write(bytes([potentiometer.value]))

    time.sleep(.15)