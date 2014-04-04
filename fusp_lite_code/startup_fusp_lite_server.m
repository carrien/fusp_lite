function [p,ffd] = startup_fusp_lite_server(p,yes_debug)
%STARTUP_FUSP_LITE_SERVER  Sends fusp startup command.

if nargin < 2 || isempty(yes_debug), yes_debug = 0; end

if yes_debug
    p.xterm_command = 'xterm -sb -sl 10000 -hold -e'; % use this for debugging
else
    p.xterm_command = 'xterm -sb -sl 1000 -e';
end

p.pc_current_fusp_progdir = ['~' p.current_fusp_progdir(3:length(p.current_fusp_progdir))];
p.pc_current_fusp_datadir = ['~' p.current_fusp_datadir(3:length(p.current_fusp_datadir))];

p.pc_fusp_startup_command = sprintf('Warning: cd to %s !!!; \n%s %s/runfusp %s/%s %s/%s', ...
                               p.pc_current_fusp_datadir, ...
                               p.sudo_command,p.pc_current_fusp_progdir, ...
                               p.pc_current_fusp_progdir,p.fusp_program,p.pc_current_fusp_datadir,p.fusp_startup_params_file);

p.fusp_startup_command = sprintf('cd %s; %s %s %s/runfusp %s/%s %s/%s &', ...
                               p.current_fusp_datadir, ...
                               p.sudo_command,p.xterm_command,p.current_fusp_progdir, ...
                               p.current_fusp_progdir,p.fusp_program,p.current_fusp_datadir,p.fusp_startup_params_file);
if ispc
    fprintf('%s\n',p.pc_fusp_startup_command);
    input('Press [ENTER] to continue after FUSP is running...');
else
    system(p.fusp_startup_command);
    pause(2)
end

ffd = startup_fusp_lite(p);