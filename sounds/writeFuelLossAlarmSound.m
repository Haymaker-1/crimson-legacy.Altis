clear 
close all
clc


sampleRate = 48000;                        % Hz
sampleDuration = 0.4*30;                   % sound sample duration is 5 seconds
sampleLength = sampleDuration*sampleRate;  % array size;
nBits = 16;
filename = 'my-alarm.wav';
waveLength1 = 1/3000;
amplitude1 = 0.99;

waveLength2 = 1/3000;
amplitude2 = 0.00;

waveLength3 = 1/2000;
amplitude3 = 0.00;


t = linspace(0,sampleDuration,sampleLength);
y1 = amplitude1 * sin(t*(2*pi/waveLength1));
y2 = amplitude2 * sin(t*(2*pi/waveLength2));
y3 = amplitude3 * sin(t*(2*pi/waveLength3));

modt = mod(t,0.4);

io1 = modt<0.3;
io2 = 0.05<=modt & modt <=0.50;
io3 = 0.75<modt;

y = (io1.*y1) + (io2.*y2) + (io3.*y3);


wavwrite(y,sampleRate,nBits,filename);
