function [fusp_init] = set_fusp_init_params(p,basedir)
%SET_FUSP_INIT_PARAMS  Set default fusp init

if nargin < 1 || isempty(p), p.expr_root_dir = 'expr'; p.speaksubdir = 'speak'; end
if nargin < 2 || isempty(basedir), basedir = cd; end

fusp_init.expr_dir = p.expr_root_dir;             % experiment-specific
fusp_init.expr_subdir = p.speaksubdir;            % experiment-specific
fusp_init.expr_log = 'expr.log';
fusp_init.num_threads = 4;
fusp_init.clone_stack_size = 20000000;
fusp_init.no_clone = 1;
fusp_init.make_vec_histories = 1;
fusp_init.make_debug_vec_histories = 1;
fusp_init.nframes_per_trial = 1000;               % experiment-specific
fusp_init.ntrials_per_block = 9;                  % experiment-specific
fusp_init.port_number = get_port_number(basedir);
fusp_init.audio_device = 'plughw:0,0';
fusp_init.sample_rate = 11025;
fusp_init.sample_size = 16;
fusp_init.nchannels = 4;
fusp_init.data_size = 32;
fusp_init.duplex_link_mode = 1;
fusp_init.sched_priority = 70;
fusp_init.require_highest_priority = 0;
fusp_init.fft_frame_size = 8192;
fusp_init.magspec_size = 4097;
fusp_init.nlpc = 12;                              % experiment-specific
fusp_init.indsig_freq_requested = 275;
fusp_init.indsig_ampl = 800;