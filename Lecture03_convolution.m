clear;
close all;
clc;

% Use the same random noise each time
rng(1);

%% Create a clean discrete-time signal

n = 0:100;
clean = sin(0.1*pi*n);

%% Add noise

noise = 0.4*randn(size(n));
measured = clean + noise;

%% Display the clean and noisy signals

figure;

plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.6 0.6 0.6]);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Clean and Noisy Signals');
legend('Clean Signal','Noisy Signal');

%% Task 1: Amplitude Scaling

scaled = 2*measured;

figure;
plot(n,measured,'Color',[0.6 0.6 0.6],'LineWidth',1.0);
hold on;
plot(n,scaled,'r','LineWidth',1.3);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Amplitude Scaling of the Noisy Signal');
legend('Noisy Signal','Scaled Signal (x2)','Location','best');

saveas(gcf,'signal_operations.png');

%% Task 2: Signal Delay

delay = 5;

% Add five zeros before the original signal to create a 5-sample delay
delayed = [zeros(1,delay), measured];

n_measured = 0:length(measured)-1;
n_delayed = 0:length(delayed)-1;

figure;
plot(n_measured,measured,'Color',[0.4 0.4 0.4],'LineWidth',1.0);
hold on;
plot(n_delayed,delayed,'m--','LineWidth',1.3);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Original and 5-Sample Delayed Signals');
legend('Noisy Signal','Delayed Signal','Location','best');

%% Task 3: Five-Point Moving-Average Filter

h5 = ones(1,5)/5;

% h5 is the impulse response h[n] of the 5-point moving-average filter
filtered5 = conv(measured,h5,'same');

figure;
plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.7 0.7 0.7],'LineWidth',0.9);
plot(n,filtered5,'r','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Noise Reduction with a 5-Point Moving-Average Filter');
legend('Clean Signal','Noisy Signal','5-Point Filtered Signal','Location','best');

saveas(gcf,'noise_filtering.png');

%% Task 4: Compare Two Filter Lengths

h15 = ones(1,15)/15;
filtered15 = conv(measured,h15,'same');

figure;
plot(n,clean,'b','LineWidth',1.5);
hold on;
plot(n,measured,'Color',[0.75 0.75 0.75],'LineWidth',0.9);
plot(n,filtered5,'r-','LineWidth',1.4);
plot(n,filtered15,'k--','LineWidth',1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Comparison of 5-Point and 15-Point Moving-Average Filters');
legend('Clean Signal','Noisy Signal','5-Point Filtered','15-Point Filtered', ...
       'Location','best');

saveas(gcf,'filter_comparison.png');
