clear
tdry=h5read('dry_004_01.h5m','/1200.31 Hz/Time');
twet1=h5read('wet1_001_01.h5m','/1200.31 Hz/Time');
twet2=h5read('wet2_006_01.h5m','/1200.31 Hz/Time');

L = length(tdry);
L2 = length (twet1);
L3 = length (twet2);

t2dry = linspace(0,12,L);
t2wet1 = linspace(0,12,L2);
t2wet2 = linspace(0,12,L3);
AX1_tdry=h5read('dry_004_01.h5m','/1200.31 Hz/AX.1');
AX1_wet1=h5read('wet1_001_01.h5m','/1200.31 Hz/AX.1');
AX1_wet2=h5read('wet2_006_01.h5m','/1200.31 Hz/AX.1');



plot(tdry, AX1_tdry,'DisplayName', 'AX(dry)')
ax = gca;
ax.FontSize = 30;
hold on
plot(twet1, AX1_wet1,'DisplayName', 'AX(wet1)')
hold on
plot(twet2, AX1_wet2,'DisplayName', 'AX(wet2)')
xlabel('Time [s]')
ylabel('Acceleration')
legend
title('Beam acceleration in x direction')
hold off


AX_tdry = AX1_tdry(9684 : 89543);
t2dry = linspace(0,12,length(AX_tdry));
AX_wet1 = AX1_wet1( 6136 : 84622);
t2wet1 = linspace(0,12,length(AX_wet1));

AX_wet2 = AX1_wet2( 3087 : 98185);
t2wet2 = linspace(0,12,length(AX_wet2) );
figure
plot(t2dry, AX_tdry,'DisplayName', 'AX(dry)')
ax = gca;
ax.FontSize = 30;
hold on
plot(t2wet1, AX_wet1,'DisplayName', 'AX(wet1)')
hold on
plot(t2wet2, AX_wet2,'DisplayName', 'AX(wet2)')
xlabel('Time [s]')
ylabel('Acceleration')
legend
title('Beam acceleration in x direction')
hold off

fAX_tdry = fft(AX_tdry);
fAX_wet1 = fft(AX_wet1) ;
fAX_wet2 = fft(AX_wet2);

fdry = 1./t2dry;
fwet1 = 1./t2wet1;
fwet2 = 1./t2wet2;

figure
%plot(fdry, fAX_tdry,'DisplayName', 'dry')
plot(fdry, abs(fAX_tdry),'DisplayName', 'dry')
ax = gca;
ax.FontSize = 30;
hold on
%plot(fwet1, fAX_wet1,'DisplayName', 'wet1')
plot(fwet1, abs(fAX_wet1),'DisplayName', 'wet1')
hold on
%plot(fwet2, fAX_wet2,'DisplayName', 'wet2')
plot(fwet2, abs(fAX_wet2),'DisplayName', 'wet2')
xlabel('Frequency [s^-1]')
ylabel('Acceleration')
legend
%title('Beam acceleration in x direction')
hold off