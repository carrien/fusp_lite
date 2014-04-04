function [] = fusp_noise_set(noise_level)
%FUSP_NOISE_SET  Sets the noise scale factor to a given level.
%   FUSP_NOISE_SET(NOISE_LEVEL)

send_fusp_cpset('noise_scale_fact',noise_level);