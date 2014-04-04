function [ ] = fusp_playback_stop()
%FUSP_PLAYBACK_START  Start fusp playback of previous vec hist.
%   Rewrite to allow for one cpset that sets params simultaneously?

send_fusp_cpset('inbuffer_source',0);
send_fusp_cpset('playing',0);
fusp_record_stop;

end