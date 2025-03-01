% Comparing OFDM, GFDM, and FBMC under Multipath Fading

clc;
clear;
close all;

% Parameters
N = 64;                 % Number of subcarriers
M = 4;                  % Modulation order (QPSK)
numSymbols = 1000;      % Number of symbols
SNR_dB = 0:2:20;       % SNR range in dB
numIter = 100;          % Number of iterations for averaging

% Multipath Channel
channel = [0.8; 0.4; 0.2]; % Simple multipath channel

% Initialize BER arrays
BER_OFDM = zeros(length(SNR_dB), 1);
BER_GFDM = zeros(length(SNR_dB), 1);
BER_FBMC = zeros(length(SNR_dB), 1);

% Main loop for SNR
for snrIdx = 1:length(SNR_dB)
    snr = SNR_dB(snrIdx);
    ber_ofdm = 0;
    ber_gfdm = 0;
    ber_fbmc = 0;
    
    for iter = 1:numIter
        % Generate random data
        data = randi([0 M-1], N, numSymbols);
        
        % QPSK Modulation
        modData = pskmod(data(:), M, pi/4);
        modData = reshape(modData, N, numSymbols);
        
        % OFDM
        ofdmSymbols = ifft(modData, N);
        ofdmSymbols = [ofdmSymbols(end-N/2+1:end, :); ofdmSymbols]; % Add CP
        ofdmSignal = ofdmSymbols(:);
        
        % GFDM
        gfdmSymbols = gfdm_modulate(modData, N, M);
        gfdmSignal = gfdmSymbols(:);
        
        % FBMC
        fbmcSymbols = fbmc_modulate(modData, N, M);
        fbmcSignal = fbmcSymbols(:);
        
        % Pass through multipath channel
        ofdmRx = filter(channel, 1, ofdmSignal);
        gfdmRx = filter(channel, 1, gfdmSignal);
        fbmcRx = filter(channel, 1, fbmcSignal);
        
        % Add AWGN noise
        ofdmRx = awgn(ofdmRx, snr, 'measured');
        gfdmRx = awgn(gfdmRx, snr, 'measured');
        fbmcRx = awgn(fbmcRx, snr, 'measured');
        
        % OFDM Receiver
        ofdmRx = reshape(ofdmRx, N + N/2, numSymbols);
        ofdmRx = ofdmRx(N/2+1:end, :); % Remove CP
        ofdmRx = fft(ofdmRx, N);
        
        % GFDM Receiver
        gfdmRx = reshape(gfdmRx, N, numSymbols);
        gfdmRx = gfdm_demodulate(gfdmRx, N, M);
        
        % FBMC Receiver
        fbmcRx = reshape(fbmcRx, N, numSymbols);
        fbmcRx = fbmc_demodulate(fbmcRx, N, M);
        
        % QPSK Demodulation
        ofdmData = pskdemod(ofdmRx(:), M, pi/4);
        gfdmData = pskdemod(gfdmRx(:), M, pi/4);
        fbmcData = pskdemod(fbmcRx(:), M, pi/4);
        
        % Calculate BER
        [~, ber_ofdm_iter] = biterr(data(:), ofdmData);
        [~, ber_gfdm_iter] = biterr(data(:), gfdmData);
        [~, ber_fbmc_iter] = biterr(data(:), fbmcData);
        
        ber_ofdm = ber_ofdm + ber_ofdm_iter;
        ber_gfdm = ber_gfdm + ber_gfdm_iter;
        ber_fbmc = ber_fbmc + ber_fbmc_iter;
    end
    
    % Average BER
    BER_OFDM(snrIdx) = ber_ofdm / numIter;
    BER_GFDM(snrIdx) = ber_gfdm / numIter;
    BER_FBMC(snrIdx) = ber_fbmc / numIter;
end

% Plot BER vs SNR
figure;
semilogy(SNR_dB, BER_OFDM, 'bo-', 'LineWidth', 2);
hold on;
semilogy(SNR_dB, BER_GFDM, 'rs-', 'LineWidth', 2);
semilogy(SNR_dB, BER_FBMC, 'gd-', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend('OFDM', 'GFDM', 'FBMC');
title('BER Comparison of OFDM, GFDM, and FBMC under Multipath Fading');

% GFDM Modulation Function
function gfdmSymbols = gfdm_modulate(data, N, M)
    % Placeholder for GFDM modulation
    % This is a simplified version, actual implementation may vary
    gfdmSymbols = ifft(data, N);
end

% GFDM Demodulation Function
function gfdmData = gfdm_demodulate(gfdmRx, N, M)
    % Placeholder for GFDM demodulation
    % This is a simplified version, actual implementation may vary
    gfdmData = fft(gfdmRx, N);
end

% FBMC Modulation Function
function fbmcSymbols = fbmc_modulate(data, N, M)
    fbmcSymbols = ifft(data, N);
end

% FBMC Demodulation Function
function fbmcData = fbmc_demodulate(fbmcRx, N, M)
    fbmcData = fft(fbmcRx, N);
end