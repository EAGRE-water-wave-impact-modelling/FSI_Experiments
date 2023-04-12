clear

%% Put the file name in commas
h5mfile_in='80372_02CB_05_051_001_01.h5m';

%% Read data from accelerometers
t1=h5read(h5mfile_in,'/1200.31 Hz/Time'); % time axis for accelerometers
AX1=h5read(h5mfile_in,'/1200.31 Hz/AX.1'); % accelerometer at the free end
AX2=h5read(h5mfile_in,'/1200.31 Hz/AX.2');
AX3=h5read(h5mfile_in,'/1200.31 Hz/AX.3');
AX4=h5read(h5mfile_in,'/1200.31 Hz/AX.4');
AX5=h5read(h5mfile_in,'/1200.31 Hz/AX.5');
AX6=h5read(h5mfile_in,'/1200.31 Hz/AX.6'); % accelerometer at the fixed end
%% Wave Probes and carriage
t_wave=h5read(h5mfile_in,'/200.05 Hz/Time'); % time axis for the waves
WAVE_FORE=h5read(h5mfile_in,'/200.05 Hz/WAVE.FORE'); % probe in front of the beam (26.25 m away from wavemaker)
WAVE_SB=h5read(h5mfile_in,'/200.05 Hz/WAVE.SB'); % probe parallel to the beam (30 m away from wavemaker)

% The time step of the wave elevation 
dt = t_wave(2000) - t_wave(1999);
disp(dt);

%% Waveflap wavemaker position
t3 = h5read(h5mfile_in,'/100.00 Hz/Time'); % time axis for the wavemaker
flap_pos=h5read(h5mfile_in,'/100.00 Hz/Flap 3 Pos'); % position of the waveflap wavemaker

% The time step of the wavemaker motion
dt3 = t3(2000) - t3(1999);
disp(dt3);

%% Waveflap Wavemaker position
plot(t3, flap_pos,'DisplayName', 'Wavemaker position')
ax = gca;
ax.FontSize = 15;
xlabel('Time [s]')
ylabel('Wavemaker position [deg]')
grid

% % Top plot
figure
ax1 = nexttile;
plot(t3, flap_pos,'DisplayName', 'Wavemaker position')
title(ax1,'Wavemaker position [deg]')
ax1.FontSize = 20;
ylabel('Wavemaker position [deg]')
grid(ax1,'on')

% % Bottom plot
ax2 = nexttile;
plot(t_wave,WAVE_SB,'DisplayName', 'WAVE_SB')
title(ax2,'Wave elevation measured by the probe ')
ax2.FontSize = 20;
ylabel('Wave elevation [m]')
xlabel('Time [s]')
grid(ax2,'on')

%% Sensor at the free end of the beam
figure
plot(t1, AX1,'DisplayName', 'AX1')
ax = gca;
ax.FontSize = 15;
xlabel('Time [s]')
ylabel('Acceleration (AX1)')
grid

%% Sensor at the fixed end of the beam
figure
plot(t1, AX6,'DisplayName', 'AX6')
ax = gca;
ax.FontSize = 15;
xlabel('Time [s]')
ylabel('Acceleration (AX6)')
legend
title('Beam acceleration in x direction')
grid

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
