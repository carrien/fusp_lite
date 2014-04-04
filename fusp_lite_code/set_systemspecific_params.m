function [params] = set_systemspecific_params(params)
% SET_SYSTEMSPECIFIC_PARAMS  Set fusp param struct for specific systems.
%   SET_SYSTEMSPECIFIC_PARAMS(PARAMS) checks the machine name and sets
%   FUSP_IP, NUM_FUSP_THREADS, CURRENT_FUSP_PROGDIR, AUDIO_DEVICE,
%   ICHAN4BUFFER, NCHANNELS, FS, and DATA_SIZE in the PARAM structure.
%
% CN 12/2013

[systemcall_status,systemcall_result] = system('hostname'); % works for linux and windows
if systemcall_status, error('System call failed.'); end

root_fusp_dir = set_root_fusp_dir;
params.fusp_ip = '127.0.0.1'; % local address of fusp server

fusp_computer_name = deblank(lower(systemcall_result));
switch fusp_computer_name
  case 'oldbooboo'
    params.fusp_ip = '192.168.2.111'; % thelma, on the cart
    params.current_fusp_progdir = sprintf('%s/Dropbox/houdelab/mobilefusp_fusp_code/mobilefusp_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 1; % delta44
  case 'thelma'
    params.current_fusp_progdir = sprintf('%s/Dropbox/houdelab/mobilefusp_fusp_code/mobilefusp_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 1; % delta44
  case 'canuck-fusp'
    params.current_fusp_progdir = sprintf('%s/Dropbox/canuck_fusp_code/canuck_fusp_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 1; % delta44
    params.fusp_init.num_threads = 2;
  case 'neuron67' % BCBL fusp computer
    params.current_fusp_progdir = sprintf('%s/bcbl_fusp_code/bcbl_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 3; % delta1010
    % hack to avoid delay when butter() is called after fusp startup
    [foo1,foo2] = butter(3,4000/(11025/2));
    clear foo1 foo2
  case 'neuron83' % BCBL matlab computer
    params.fusp_ip = '192.168.50.178'; % local addr of neuron67 at BCBL
    params.current_fusp_progdir = sprintf('%s/bcbl_fusp_code/bcbl_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 3; % delta1010
    % hack to avoid delay when butter() is called after fusp startup
    [foo1,foo2] = butter(3,4000/(11025/2));
    clear foo1 foo2
  case 'nicfusp'
    params.current_fusp_progdir = sprintf('%s/Desktop/nicfusp_c_code/',root_fusp_dir);
    params.ichan4inbuffer = 3; % delta1010
  case 'mobile-fusp'
    params.current_fusp_progdir = sprintf('%s/mobilefusp_fusp_code/mobilefusp_new_quatieri_devel',root_fusp_dir);
    params.ichan4inbuffer = 1;
    params.fusp_init.audio_device = 'plughw:1,0';
    params.fusp_init.duplex_link_mode = 0; % for usb-based audio, snd_pcm_link() doesn't seem to work
    params.fusp_init.nchannels = 2;
    params.fusp_init.sample_rate = 11025;
    params.fusp_init.data_size = 32;
  otherwise
    error('fusp_computer(%s) unrecognized',fusp_computer_name);
end