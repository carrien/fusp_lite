function [fusp_ctrl] = set_fusp_ctrl_params(p)
%SET_FUSP_CTRL_PARAMS  Set default fusp control parameters.
%   SET_FUSP_CTRL_PARAMS() returns a the struct FUSP_CTRL with common
%   default parameter values set.

fusp_ctrl.yes_interruptable_rec = 0;
fusp_ctrl.yes_fix_divzero = 1; % if set, warn and fix, dont error out for divide by zero
fusp_ctrl.vechist2play = 'inbuffer';
fusp_ctrl.yes_filt_abs_inbuffer = 1;
fusp_ctrl.mean_abs_inbuffer_weight = 0.2;
fusp_ctrl.process_inbuffer = 1; %% yes_passthru_audio --> 0
fusp_ctrl.outbuffer_scale_fact = 10;
fusp_ctrl.noise_scale_fact = 0;
fusp_ctrl.yes_voice_detect = 0;
fusp_ctrl.voice_detect_thresh = 50;  % params.c default is 0
fusp_ctrl.ms_inbuffer_lt_thresh = 50; % params.c default is 0
fusp_ctrl.ms_inbuffer_gt_thresh = 50; % params.c default is 0
fusp_ctrl.yes_filt_inbuffer4peaksenv = 1; % params.c default is 0
fusp_ctrl.yes_filt_inbuffer4formants = 1; % params.c default is 0
fusp_ctrl.inbuffer_source = p.ichan4inbuffer - 1;

ms_anal_win = 36.3; % this is already the fusp default
fusp_ctrl.ms_frame4peaks = ms_anal_win;
fusp_ctrl.ms_frame4lpc = ms_anal_win;
fusp_ctrl.ms_frame4env = ms_anal_win;
fusp_ctrl.ms_frame4pitch = ms_anal_win;

fusp_ctrl.perpeak_halfrange2look_hz = 20;
fusp_ctrl.minpitch = 70;
fusp_ctrl.maxpitch = 300;
fusp_ctrl.pitch_strength4pitch = 0;
fusp_ctrl.ms_pitch_statbuf = 30; % fusp default is already 30
fusp_ctrl.get_envelope_comparison_mode = 0; % only used for debugging
fusp_ctrl.get_envelope_mode = 1; % replaces use_magfft4env
fusp_ctrl.altspeech_mode = 1;
fusp_ctrl.yes_voice_trig_alt = 0;
fusp_ctrl.smoothed_peakspec4synth_scalefact = 1.5; % replaces filt_magfft_scalefact
fusp_ctrl.smkern4synth_size_Hz = 1000; % replaces filter_size
fusp_ctrl.chanrange_Hz = 100;
fusp_ctrl.yes_filt_outbuffer4peaksenv = 1; % params.c default is 0
fusp_ctrl.yes_filt_outbuffer4formants = 1; % params.c default is 0

%% optional params down here -- perhaps have a binary argument to not eval these

% % params for output_testtone(), used to generate tones instead of speech
% fusp_ctrl.yes_output_testtone = 1;
% fusp_ctrl.testtone_freq = 220;
% fusp_ctrl.testtone_ampl = 100;
% fusp_ctrl.testtone_mslat = 1000;
% fusp_ctrl.testtone_msdur = 200;

%% params that require converting to 0 indexing

% fusp_ctrl.peaktrack_a_idx; % for debugging phase continuity problems
% fusp_ctrl.peaktrack_b_idx;
% fusp_ctrl.peaktrack_c_idx;
% 
%   fusp_new_cpset(ffd,'peaktrack_a_idx(%d)',peaktrack_a_idx - 1); % convert from matlab to c indexing
%   fusp_new_cpset(ffd,'peaktrack_b_idx(%d)',peaktrack_b_idx - 1); % convert from matlab to c indexing
%   fusp_new_cpset(ffd,'peaktrack_c_idx(%d)',peaktrack_c_idx - 1); % convert from matlab to c indexing
%   fusp_new_cpset(ffd,'debug_stopat_iframe2record(%d)',debug_stopat_iframe2record - 1); % convert from matlab to c indexing


