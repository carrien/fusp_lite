function [] = send_fusp_cpset(paramname,paramval)
%SEND_FUSP_CPSET  Wrapper for fusp_new_cpset.

global ffd

% check if paramname is valid fusp control param
[isValid, varFormat] = check_isvalid_fusp_param(paramname);
if ~isValid, error('%s is not a valid fusp parameter.',paramname); end

% send cpset
fusp_new_cpset(ffd,sprintf(['%s(' varFormat ')'],paramname,paramval));