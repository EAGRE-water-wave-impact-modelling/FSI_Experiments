clear

%% Put the file name in commas
h5mfile_in='80372_02CB_04_050_001_01.h5m';

%% Read data
t1=h5read(h5mfile_in,'/1200.31 Hz/Time');
AX1=h5read(h5mfile_in,'/1200.31 Hz/AX.1');
AX2=h5read(h5mfile_in,'/1200.31 Hz/AX.2');
AX3=h5read(h5mfile_in,'/1200.31 Hz/AX.3');
AX4=h5read(h5mfile_in,'/1200.31 Hz/AX.4');
AX5=h5read(h5mfile_in,'/1200.31 Hz/AX.5');
AX6=h5read(h5mfile_in,'/1200.31 Hz/AX.6');

t_wave=h5read(h5mfile_in,'/200.05 Hz/Time');
WAVE_FORE=h5read(h5mfile_in,'/200.05 Hz/WAVE.FORE');
WAVE_SB=h5read(h5mfile_in,'/200.05 Hz/WAVE.SB');

%% Sensor at the free end of the beam
plot(t1, AX1,'DisplayName', 'AX1')
ax = gca;
ax.FontSize = 15;
xlabel('Time [s]')
ylabel('Acceleration (AX1)')


%% Sensor at the fixed end of the beam
figure
plot(t1, AX6,'DisplayName', 'AX6')
ax = gca;
ax.FontSize = 15;
xlabel('Time [s]')
ylabel('Acceleration (AX6)')
legend
title('Beam acceleration in x direction')
%% Top plot
figure
ax1 = nexttile;
plot(t_wave,WAVE_SB,'DisplayName', 'WAVE_SB')
title(ax1,'Plot 1')
ax1.FontSize = 20;
ylabel('Wave elevation')
grid(ax1,'on')

% % Bottom plot
ax2 = nexttile;
plot(t1, AX1,'DisplayName', 'AX1')
title(ax2,'Plot 2')
ax2.FontSize = 20;
xlabel('Time [s]')
ylabel('Acceleration')
grid(ax2,'on')
