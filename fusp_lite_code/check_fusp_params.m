function [p] = check_fusp_params(p)
%CHECK_FUSP_PARAMS  Make sure params are well-formed and supported by fusp.

% make sure fs, sample_size, nchannels, and data_size are supported
supported_fs = [8000 11025 22050 44100];
if ~any(ismember(supported_fs,p.fusp_init.sample_rate))
  error('sample_rate(%d) is not available',p.fusp_init.sample_rate);
end

supported_sample_size = 16;
if ~any(ismember(supported_sample_size,p.fusp_init.sample_size))
  error('sample_size(%d) is not available',p.fusp_init.sample_size);
end

supported_nchannels = [1 2 4];
if ~any(ismember(supported_nchannels,p.fusp_init.nchannels))
  error('nchannels(%d) is not available',p.fusp_init.nchannels);
end

powerofncheck(p.fusp_init.data_size,2);

magspec_size_m1 = p.fusp_init.magspec_size - 1;
powerofncheck(magspec_size_m1,2);
if p.fusp_init.fft_frame_size ~= 2*magspec_size_m1
    error('fft_frame_size(%d) must be twice magspec_size(%d) minus one',p.fusp_init.fft_frame_size,p.fusp_init.magspec_size)
end