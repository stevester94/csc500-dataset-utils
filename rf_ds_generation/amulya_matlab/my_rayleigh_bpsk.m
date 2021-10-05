clear
clc
%% init
j = sqrt(-1);
num_samples = 10000;
target_snr=20 % -10:2:20
Phase_low = 0;
% Phase_high = pi/8;
Phase_high = 0;

%% get train data
% bpsk
disp('bpsk begin');
x = zeros(1, num_samples);
noise = zeros(1, num_samples);
mod = comm.BPSKModulator();
const = constellation(mod);

% Random SNR for this row
P = 10^(target_snr/10);

% What is this?
h = sqrt(1/2)*(randn+j*randn);

for col = 1:num_samples
    % Get a random constellation point
    s = const(unidrnd(length(const)));
    
    % phase jitter ~ U(-PhaseHigh, PhaseHigh)
    phase_jitter = 2*Phase_high*rand() - Phase_high; 
    
    
    x(col) = sqrt(P)*h*exp(j*phase_jitter)*s;
    noise(col) = sqrt(1/2)*(randn+j*randn);
    
    
    % This is her AWGN only signal data line
%     x(col) = sqrt(P)*exp(j*phase_jitter)*s + sqrt(1/2)*(randn+j*randn);
end

calculated_snr = snr(abs(x), abs(noise))
% x = x + noise;

scatter(real(x), imag(x))
xlim([-15 15])
ylim([-15 15])