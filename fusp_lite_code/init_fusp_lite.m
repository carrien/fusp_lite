function [p,ffd] = init_fusp_lite(basedir,in_params,yes_running_fake_fusp,yes_debug)
%INIT_FUSP_LITE  Initialization for fusp lite.
%  INIT_FUSP_LITE(BASEDIR,YES_RUNNING_FAKE_FUSP) initalizes a fusp lite
%  experiment

if nargin < 1 || isempty(basedir), basedir = cd; end
if nargin < 2 || isempty(in_params), in_params.fusp_init = []; in_params.fusp_ctrl = []; end
if nargin < 3 || isempty(yes_running_fake_fusp), yes_running_fake_fusp = 0; end
if nargin < 4 || isempty(yes_debug), yes_debug = 0; end

p.startdir = cd;
p.current_fusp_datadir = basedir;
nowdatestr = datestr(now,'yyyy.mm.dd.THH.MM.SS');
p.expr_root_dir = sprintf('expr%s',nowdatestr);
p.speaksubdir = 'speak';
p.listensubdir = 'listen';
p.fusp_startup_params_file = 'fusp_expr_startup_params.txt';
p.paramfilename = 'exprparams.mat';

%% set default init params
p.fusp_init = set_fusp_init_params(p,basedir);

%% set fake fusp params, i.e. testing with VMWare fusp (VM_TIPPY) / fake audio
p.yes_running_fake_fusp = yes_running_fake_fusp;
if ~yes_running_fake_fusp
  p.sudo_command = 'sudo';
  p.fusp_program = 'quat';
else
  p.sudo_command = '';
  p.fusp_program = 'testquat';
  p.fusp_init.fake_audio_infile_dir = p.current_fusp_datadir; %% make sure this is the right dir
  if ~isfield(p,'dir4fake_audio'), dir4fake_audio = uigetdir([],'select directory of inbuffer_hist for fake audio'); end
  cd(dir4fake_audio);
  vh_inbuffer4fakeaudio = get_vec_hist6('inbuffer',3);
  vechist2rawrec(fullfile(p.fusp_init.fake_audio_infile_dir,'fake_audio_input'),vh_inbuffer4fakeaudio,1,p.ichan4inbuffer);
  p.fusp_init.fake_audio_infile = 'fake_audio_input.raw';
  p.fusp_init.fake_audio_outfile = 'fake_audio_output.raw';
  cd(p.startdir);
end

%% set system-specific params
p = set_systemspecific_params(p);

%% set default control params
p.fusp_ctrl = set_fusp_ctrl_params(p);

%% set experiment-specific params (override defaults)
p.fusp_init = extend_struct(p.fusp_init,in_params.fusp_init);
p.fusp_ctrl = extend_struct(p.fusp_ctrl,in_params.fusp_ctrl);
% this should include fusp_init params like expr_dir, expr_subdir

% this also could include trial params so we know how many blocks to make
% and their altspecs, aka design_fusp_expr_lite, aka design_THIS_expr
% make the structure flat (e.g. pertspec)

%% param check
check_fusp_params(p);

%% write fusp startup params file
% generate params string
init_string = get_fusp_init_str(p.fusp_init);

% write string to file
fp_fspf = fopen(fullfile(basedir,p.fusp_startup_params_file),'w');
fprintf(fp_fspf,init_string);
fclose(fp_fspf);

%% startup_fusp_server
%  do this inside of fusp_lite_begin?
global ffd
[p,ffd] = startup_fusp_lite_server(p,yes_debug); % yes_debug = 1 to leave terminal window open

% save params files (.ips and .cps)
fusp_save_init_params(ffd);
fusp_save_control_params(ffd);

% send fusp control params (send cpsets)
send_fusp_ctrl_params(p.fusp_ctrl)

%% todo
% do we need to set these?
% p.framef = []; % % from set_globals
% p.naltfeatures = []; p.altfeatures = []; p.altseqs = []; p.altspecs = []; p.pulse_specs = []; p.pertspecs = []; p.trialspecs = []; p.paramspecs = []; p.exprspecs = [];
% p.dio = []; % from set_globals4prompt_func
% p.mlogtemp = 'mfilelog.temp'; % % from set_begin_fusp_expr_vars
% yes_testaudio = 0;
