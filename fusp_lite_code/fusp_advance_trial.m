function [] = fusp_advance_trial(itrial,itrial2play)
%FUSP_ADVANCE_TRIAL  Advance to a given experiment trial and inform fusp.
%   FUSP_ADVANCE_TRIAL(ITRIAL,ITRIAL2PLAY)

if nargin < 2 || isempty(itrial2play), itrial2play = itrial; end

% inform fusp of current trialnum
fusp_itrial = itrial-1;
fusp_itrial2play = itrial2play-1;
send_fusp_cpset('itrial',fusp_itrial);
send_fusp_cpset('itrial2play',fusp_itrial2play);