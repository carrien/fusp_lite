function [] = send_fusp_ctrl_params(fusp_ctrl)
%SEND_FUSP_CTRL_PARAMS  Given control param struct, send cpsets to fusp.

ctrl_fields = fieldnames(fusp_ctrl);
for f = 1:length(ctrl_fields)
    thisfield = ctrl_fields{f};
    send_fusp_cpset(thisfield,fusp_ctrl.(thisfield));
end