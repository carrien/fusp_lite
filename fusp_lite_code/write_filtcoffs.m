function [] = write_filtcoffs(p,filtcoffs2update)
%WRITE_FILTCOFFS  Send cpsets for filter coefficients.
%   WRITE_FILTCOFFS(FFD,P) sends cpsets for vechist2free, vechist2load,
%   vechist4filtcoffs, and sets update_filtcoffs4{abs_inbuffer,outbuffer,
%   noise,inbuffer4peaksenv,inbuffer4formants,outbuffer4peaksenv,
%   outbuffer4formants} to 1 if update is needed.

global ffd;
fs = p.fusp_init.sample_rate;

[Boutfilt,Aoutfilt] = butter(3,4000/(fs/2));
fusp_upload_filtcoffs(ffd,Boutfilt,Aoutfilt,'outbuffer',p.current_fusp_datadir,p.block0dir);

if isfield(p,'fpreemph_cut_Hz')
  [bcoffs4formants,acoffs4formants] = butter(2,(p.fpreemph_cut_Hz/(fs/2)),'high');
  fusp_upload_filtcoffs(ffd,bcoffs4formants,acoffs4formants,'inbuffer4formants',p.current_fusp_datadir,p.block0dir);
end
if isfield(p,'fpreemph_cut_Hz')
  [bcoffs4formants,acoffs4formants] = butter(2,(p.fpreemph_cut_Hz/(fs/2)),'high');
  fusp_upload_filtcoffs(ffd,bcoffs4formants,acoffs4formants,'outbuffer4formants',p.current_fusp_datadir,p.block0dir);
end