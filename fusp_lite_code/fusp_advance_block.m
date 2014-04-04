function [blockdir] = fusp_advance_block(p,iblock,iblock2load)
%FUSP_ADVANCE_BLOCK  Advance to a given experiment block and inform fusp.
%   FUSP_ADVANCE_BLOCK(P,IBLOCK)

if nargin < 3 || isempty(iblock2load), iblock2load = iblock; end

% set absolute path to expr subdir
absSubDir = fullfile(p.current_fusp_datadir,p.fusp_init.expr_dir,p.fusp_init.expr_subdir);

% create block dir if necessary
blockdir = sprintf('block%d',iblock-1);
if ~exist(fullfile(absSubDir,blockdir),'dir')
    mkdir(absSubDir,blockdir);
end
cd(fullfile(absSubDir,blockdir))

% inform fusp of current blocknum
fusp_iblock = iblock-1;
fusp_iblock2load = iblock2load-1;
send_fusp_cpset('iblock',fusp_iblock);
send_fusp_cpset('iblock2load',fusp_iblock2load);