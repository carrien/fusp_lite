function [] = fusp_lite_finish(ffd,p)
%FUSP_LITE_FINISH  Save params and exit fusp lite gracefully.

fusp_save_init_params(ffd);
fusp_save_control_params(ffd);
shutdown_fusp(ffd);
cd(p.startdir)