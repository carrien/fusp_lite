function [ichan4inbuffer] = get_ichan4inbuffer(soundcard_name)
%GET_ICHAN4INBUFFER  Get the channel number for a given sound card name.

switch soundcard_name
    case {'delta44', 'scarlett2i2'}
        ichan4inbuffer = 1;
    case 'delta1010'
        ichan4inbuffer = 3;
end