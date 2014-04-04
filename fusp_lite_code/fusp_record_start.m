function [ ] = fusp_record_start()
%FUSP_LITE_RECORD_START  Start fusp recording.
%   Rewrite to allow for one cpset that sets params simultaneously?

send_fusp_cpset('iframe2record',-1);
send_fusp_cpset('recording',1);

end