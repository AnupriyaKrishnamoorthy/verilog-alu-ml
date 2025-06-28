'''### I have created list so far###

delay = []
delay_datawidth = [2,4,8,16,32,64]
delay_gate = [0.2,0.6,0.9,1.2,1.3]
delay_fanin = [3,4,2,5,6,9]
delay_fanout = [4,2,4,6,3,8]
delay = [*delay_datawidth,*delay_gate,*delay_fanin,*delay_fanout]
print (delay)'''

import matplotlib as pyplot
import pandas as pd
data = {
    'delay_datawidth' : [2,4,8,16,32,64],
    'delay_gate' : [0.2,0.6,0.9,1.2,1.3,1.1],
    'delay_fanin' : [3,4,2,5,6,9],
    'delay_fanout' : [4,2,4,6,3,8]
}
df = pd.DataFrame(data)
print (df)