# Lecture 03: Convolution and Moving-Average Filtering

This exercise creates a discrete-time sinusoidal signal, adds random noise, applies basic signal operations, and then uses convolution with moving-average filters to reduce the noise.

## Files

- `Lecture03_convolution.m` — MATLAB script for all tasks.
- `signal_operations.png` — noisy signal compared with the signal scaled by 2.
- `noise_filtering.png` — clean, noisy, and 5-point filtered signals.
- `filter_comparison.png` — comparison of the clean/noisy signals with 5-point and 15-point moving-average outputs.

## README Questions

### 1. Which operation changed the signal amplitude?

Amplitude scaling changed the signal amplitude. In the script, the noisy signal is multiplied by 2 using `scaled = 2*measured`. In the `signal_operations.png` figure, every positive and negative sample becomes twice as large. The frequency and the sample locations do not change because only the amplitude values are multiplied.

### 2. How did the five-sample delay change the signal?

The delay shifts the noisy signal five samples to the right. I created it by placing five zeros before the original samples. The waveform itself keeps the same shape after the shift, but each original sample occurs five sample positions later. In a real system, this type of delay can be caused by processing time, communication latency, buffering, or signal propagation.

### 3. What does the impulse response `h[n]` represent?

The impulse response describes how a discrete-time linear time-invariant filter responds to a unit impulse. It also completely describes the filter behavior for this type of system. Here, `h5 = ones(1,5)/5` means that the filter averages five neighboring samples with equal weights of `1/5`.

### 4. How did convolution change the noisy signal?

Convolution applies the moving-average impulse response to the measured signal. Instead of using each noisy sample by itself, the output is based on an average of nearby samples. This reduces fast random changes, so the filtered signal looks smoother and follows the clean sinusoidal signal more closely. With `conv(...,'same')`, the output length stays the same as the input length.

### 5. What differences did you observe between the 5-point and 15-point filters?

The 5-point filter smooths the random noise while still keeping the sinusoidal shape and most of its amplitude. The 15-point filter produces a much smoother curve, but it also reduces the amplitude of the useful sinusoidal signal more strongly. Because the clean sinusoid has a period of about 20 samples, averaging across 15 samples covers a large part of one cycle, so positive and negative values partly cancel.

### 6. Which filter removed more noise?

The 15-point filter removed more of the rapid noise variation because it averages over more samples. In the comparison figure, its output has fewer short, sharp fluctuations than the 5-point output. However, stronger noise reduction is not the only goal because the useful signal should also be preserved.

### 7. Did the longer filter remove or distort useful signal information?

Yes. The 15-point moving average noticeably attenuates the useful sinusoidal waveform. Its peaks and valleys are smaller than those of the clean signal. There can also be edge effects near the beginning and end because the `'same'` convolution result effectively includes samples outside the measured range as zeros.

### 8. Which filter would you recommend for this signal? Explain your decision.

I would recommend the 5-point moving-average filter for this signal. It gives a useful compromise: it reduces much of the random noise while preserving the sinusoidal shape and amplitude better than the 15-point filter. The 15-point filter is smoother, but it removes too much of the wanted waveform for this particular signal.

### 9. Give one real engineering application for moving-average filtering.

One application is smoothing noisy temperature-sensor measurements. Individual readings can contain small random fluctuations, so a moving-average filter can reduce those fluctuations and make the underlying temperature trend easier to observe.

## Figure Observations

- `signal_operations.png`: the scaled signal has twice the amplitude of the noisy signal, but the same sample positions and frequency.
- `noise_filtering.png`: the 5-point output follows the clean sinusoid more closely than the raw noisy measurements.
- `filter_comparison.png`: the 15-point output is smoother than the 5-point output, but its useful sinusoidal amplitude is reduced much more.

## AI Usage

**Tool used:** ChatGPT (OpenAI)

