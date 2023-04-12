#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

@author: mmwr

"""

# https://docs.h5py.org/en/stable/quick.html

import h5py   
import numpy as np  
import matplotlib.pyplot as plt

  
# Write file name within commas
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
    
    # Time array for the signals obtained from accelerometers
    t1 = f['/1200.31 Hz/Time'][()]
    
    # Time array for the signals obtained from  wave probe
    t2 = f['/200.05 Hz/Time'][()]
    
    # Time array for the signals obtained from  waveflap wavemaker position
    t3 = f['/100.00 Hz/Time'][()]
    
    # Accelerations in x-direction obtained from accelerometer at the submerged free end of the beam (AX1)
    AX1 = f['/1200.31 Hz/AX.1'][()] 
    
    # Accelerations in x-direction obtained from accelerometer above the submerged free end of the beam (AX2)
    AX2 = f['/1200.31 Hz/AX.2'][()] 
    
    # Accelerations in x-direction obtained from the third accelerometer from the submerged free end of the beam (AX3)
    AX3 = f['/1200.31 Hz/AX.3'][()] 
    
    # Accelerations in x-direction obtained from the fourth accelerometer from the submerged free end of the beam (AX4)
    AX4 = f['/1200.31 Hz/AX.4'][()] 
    
    # Accelerations in x-direction obtained from the fifth accelerometer from the submerged free end of the beam (AX5)
    AX5 = f['/1200.31 Hz/AX.5'][()]  
    
    # Accelerations in x-direction obtained from the  accelerometer at the fixed end of the beam (AX6)
    AX6 = f['/1200.31 Hz/AX.6'][()] 
    
    # Wave elevation obtained from the probe at the front of the beam
    Wave_fore = f['/200.05 Hz/WAVE.FORE'][()]
    
    # Wave elevation obtained from the probe parallel to the beam
    Wave_sb = f['/200.05 Hz/WAVE.SB'][()]
    
    # carriage speed
    C_speed = f['/200.05 Hz/C.SPEED'][()]
    
    # Waveflap wavemaker motion
    Wave_maker = f['/100.00 Hz/Flap 3 Pos'][()]
    

##____________________ Time step details ___________________##

time_2 = np.array(t2)
dt_wave_elevation = time_2[1] - time_2[0]

print('Time step for wave elevation =', dt_wave_elevation)

time_3 = np.array(t3)
dt_wavemaker = time_3[1] - time_3[0]

print('Time step for the wavemaker motion =', dt_wavemaker )


    
##_________________  PLOT SIGNALS __________________________##

fig, (ax1, ax2) = plt.subplots(2)

ax1.set_title('waveflap wavemaker position',fontsize=tsize)
ax1.plot(t3, Wave_maker, 'r-', linewidth= 0.2 ,label = '$Wavemaker pos$ ')
ax1.set_ylabel('Wavemaker position [deg]  ',fontsize=size)
ax1.tick_params(axis='x', labelsize= tic_size)
ax1.tick_params(axis='y', labelsize= tic_size)
ax1.grid()

ax2.set_title('Wave elevation of the incoming wave',fontsize=tsize)
ax2.plot(t2, Wave_fore,  'b-', linewidth= 0.2 ,label = '$Wave_fore$ ')
ax2.set_xlabel('$Time [s]$ ',fontsize=size)
ax2.set_ylabel('Wave elevation [m] ',fontsize=size) 
ax2.tick_params(axis='x', labelsize= tic_size)
ax2.tick_params(axis='y', labelsize= tic_size)
ax2.grid()  


fig, (ax1, ax2) = plt.subplots(2)

ax1.set_title('Acceleration of the submerged free end of the beam',fontsize=tsize)
ax1.plot(t1, AX1, 'r-', linewidth= 0.2 , label = '$AX.1$ ')
ax1.set_ylabel('Accelerations in x-direction [m/s]  ',fontsize=size)
ax1.tick_params(axis='x', labelsize= tic_size)
ax1.tick_params(axis='y', labelsize= tic_size)
ax1.grid()

ax2.set_title('Wave elevation of the incoming wave',fontsize=tsize)
ax2.plot(t2, Wave_fore,  'b-', linewidth= 0.2 , label = '$Wave_fore$ ')
ax2.set_xlabel('$Time [s]$ ',fontsize=size)
ax2.set_ylabel('Wave elevation [m] ',fontsize=size) 
ax2.tick_params(axis='x', labelsize= tic_size)
ax2.tick_params(axis='y', labelsize= tic_size)
ax2.grid()   

plt.show()   
print("---------  Program ends ----------")
