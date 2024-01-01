# Voice FDM System using SSB Modulation

## Overview
This project implements a Frequency-Division Multiplexing (FDM) system for voice signals using Single Sideband (SSB) modulation. The process involves recording voice segments, filtering, SSB modulation, and demodulation to obtain the original signals.

## Steps

### 1. Voice Recording
Record three 10-second voice segments and save them as 'input1.wav', 'input2.wav', and 'input3.wav'. The sampling frequency is chosen to ensure adequate representation of the voice signals.

### 2. Signal Filtering
Limit the maximum frequency of the signals with a Low-Pass Filter (LPF). Test different cutoff frequencies, listen to the filtered audio, and select values preserving audio quality. Plot the magnitude spectrum before and after filtering.

### 3. SSB Modulation
Perform SSB modulation in the FDM system using suitable carrier frequencies. Ensure compliance with the sampling theorem. Justify the choice of carrier frequencies in the documentation.

### 4. Modulation Spectrum
Plot the magnitude spectrum of the modulated signal to visualize the frequency distribution.

### 5. SSB Demodulation
Perform SSB demodulation to obtain the three original signals. Plot their magnitude spectrum and save as 'output1.wav', 'output2.wav', and 'output3.wav'.
