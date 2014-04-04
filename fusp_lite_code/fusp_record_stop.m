function [ ] = fusp_record_stop()
%FUSP_LITE_RECORD_STOP  Stop fusp recording.

send_fusp_cpset('recording',0);

end