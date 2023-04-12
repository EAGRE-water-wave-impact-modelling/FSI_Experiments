#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 12 15:22:39 2023

@author: mmwr
"""

import h5py   
import numpy as np  
import pandas as pd
import matplotlib.pyplot as plt

  
# Write the file name within commas
filename = "exp1_c1.h5m"

#__________________  FIGURE PARAMETERS  _____________________#

tsize = 18 # font size of image title
tsize2 = 12
tic_size = 14
size = 16  # font size of image axes
tic_size = 14

#________________ READ .h5m FILE  _________________________#

with h5py.File(filename, "r") as f:
    # Print all root level object names (aka keys) 
    # these can be group or dataset names 
    print("Keys: %s" % f.keys())
    
    # Time array for the signals obtained from  waveflap wavemaker position
    t3 = f['/100.00 Hz/Time'][()]

    # Waveflap wavemaker motion
    Wave_maker = f['/100.00 Hz/Flap 3 Pos'][()]
    

##____________________ COMPUTE TIME STEP ___________________##

time_3 = np.array(t3)
dt_wavemaker = time_3[2000] - time_3[1999]

print('Time step for the wavemaker motion =', dt_wavemaker )

##____________________ INTERPOLATE WAVEMAKER MOTION ___________________##

wm1 = pd.Series(np.array(Wave_maker))

wm_inter = wm1.interpolate(method="polynomial", order=1) 

##_________________  PLOT SIGNALS __________________________##

# plt.title('Wavemaker motion',fontsize=tsize)
# plt.plot(t3, wm_inter, 'r-', linewidth= 0.2, label = 'Interpolated')
# plt.plot(t3, np.array(Wave_maker),'k--', linewidth= 0.5, label = 'Measured')
# plt.xlabel('Time [sec]', fontsize=size)
# plt.ylabel('Wavemaker motion [deg]', fontsize=size)
# plt.yticks(fontsize=tic_size)
# plt.xticks(fontsize=tic_size)
# plt.legend(loc=1)
# plt.grid()


fig, (ax1, ax2) = plt.subplots(2)
ax1.set_title('Waveflap wavemaker position',fontsize=tsize)
ax1.plot(t3, wm_inter, 'r-', linewidth= 0.2, label = 'Interpolated')
ax1.plot(t3, np.array(Wave_maker),'k--', linewidth= 0.5, label = 'Measured')
ax1.set_ylabel('Wavemaker position [deg]  ',fontsize=size)
ax1.tick_params(axis='x', labelsize= tic_size)
ax1.tick_params(axis='y', labelsize= tic_size)
ax1.legend(loc = 1)
ax1.grid()

# ax2.set_title('Wave elevation of the incoming wave',fontsize=tsize)
ax2.plot(t3, wm_inter, 'r-', linewidth= 0.2, label = 'Interpolated')
ax2.plot(t3, np.array(Wave_maker),'k--', linewidth= 0.5, label = 'Measured')
ax2.set_xlabel('$Time [s]$ ',fontsize=size)
ax2.set_ylabel('Wavemaker position [deg]  ',fontsize=size) 
ax2.tick_params(axis='x', labelsize= tic_size)
ax2.tick_params(axis='y', labelsize= tic_size)
ax2.set_xlim([50, 70])
ax2.legend(loc = 1)
ax2.grid()  



plt.show()   
print("---------  Program ends ----------")