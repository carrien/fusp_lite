function [paramval] = get_fusp_lite_init_default(paramname)
%GET_FUSP_LITE_INIT_DEFAULT  Returns default values for a given init param.
%   GET_FUSP_LITE_INIT_DEFAULT(PARAMNAME) queries fusp lite for the
%   Matlab-assigned default values for fusp_init parameters.

fusp_init_defaults = set_fusp_init_params;
paramval = fusp_init_defaults.(paramname);