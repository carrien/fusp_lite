function [root_fusp_dir] = set_root_fusp_dir()
%SET_ROOT_FUSP_DIR  Set root dir to 'T:' (Windows) or '~' (Linux).

if ispc
  root_fusp_dir = 'T:';
else
  root_fusp_dir = '~';
end