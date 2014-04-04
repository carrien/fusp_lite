function [ ] = fusp_playback_start()
%FUSP_PLAYBACK_START  Start fusp playback of previous vec hist.
%   Rewrite to allow for one cpset that sets params simultaneously?

send_fusp_cpset('inbuffer_source',5); % Do we need this here? Set once in expt?
send_fusp_cpset('iframe2play',-1);
send_fusp_cpset('playing',1);
fusp_record_start;

end