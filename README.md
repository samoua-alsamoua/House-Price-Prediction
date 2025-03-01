# OFDM vs GFDM vs FBMC Comparison under Multipath Fading

This repository contains MATLAB code to compare the performance of **OFDM**, **GFDM**, and **FBMC** modulation schemes under multipath fading conditions. The code simulates the transmission of data over a multipath fading channel and evaluates the **Bit Error Rate (BER)** for each modulation scheme.

---


## Introduction
Orthogonal Frequency Division Multiplexing (OFDM), Generalized Frequency Division Multiplexing (GFDM), and Filter Bank Multi-Carrier (FBMC) are popular multi-carrier modulation techniques used in modern communication systems. This project aims to compare their performance in terms of BER under multipath fading channels.

---

## Code Overview
The MATLAB script `OFDM_GFDM_FBMC_Comparison.m` performs the following tasks:
1. Generates random data and modulates it using QPSK.
2. Applies OFDM, GFDM, and FBMC modulation techniques.
3. Simulates transmission over a multipath fading channel.
4. Adds AWGN noise to the transmitted signal.
5. Demodulates the received signal and calculates the BER for each scheme.
6. Plots the BER vs SNR for OFDM, GFDM, and FBMC.

---

## Requirements
To run this code, you need:
- MATLAB (tested on MATLAB R2021a or later).
- Communication Toolbox.
- Signal Processing Toolbox (for functions like `pskmod`, `pskdemod`, `awgn`, etc.).

---

## Results
The output of the script is a plot of BER vs SNR for the three modulation schemes. The plot helps visualize the performance differences between OFDM, GFDM, and FBMC under multipath fading conditions.

---

## Contributing
Contributions are welcome! If you find any issues or want to enhance the code, feel free to open an issue or submit a pull request.

---

## Contact
- **Author**: Samoua Alsamoua
- **GitHub**: [samoua-alsamoua](https://github.com/samoua-alsamoua)
- **Website**: [saalsamoua.github.io](https://samoua-alsamoua.github.io/saalsamoua/)
