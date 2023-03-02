clear

%% READ the .h5m files
t1=h5read('TIME_ACC.h5m','/1200.31 Hz/Time');
t2=h5read('TIME_WAVE.h5m','/200.05 Hz/Time');

AX1_t1=h5read('AX1.h5m','/1200.31 Hz/AX.1');
AX2_t1=h5read('AX2.h5m','/1200.31 Hz/AX.2');
AX3_t1=h5read('AX3.h5m','/1200.31 Hz/AX.3');
AX4_t1=h5read('AX4.h5m','/1200.31 Hz/AX.4');
AX5_t1=h5read('AX5.h5m','/1200.31 Hz/AX.5');
AX6_t1=h5read('AX6.h5m','/1200.31 Hz/AX.6');
WAVE_FORE=h5read('WAVE_FORE.h5m','/200.05 Hz/WAVE.FORE');
WAVE_SB=h5read('WAVE_SB.h5m','/200.05 Hz/WAVE.SB');
C_SPEED=h5read('C_SPEED.h5m','/200.05 Hz/C.SPEED');


%% Top plot
ax1 = nexttile;
plot(t1, AX1_t1,'DisplayName', 'AX(t1)')
title(ax1,'Plot 1')
ax1.FontSize = 20;
ylabel('Acceleration [m/s]')
grid(ax1,'on')


%% Bottom plot
ax2 = nexttile;
plot(t2, WAVE_SB,'DisplayName', 'Wave')
title(ax2,'Plot 2')
ax2.FontSize = 20;
xlabel('Time [s]')
ylabel('Wave [m]')
grid(ax2,'on')

