function [p] = set_fusp_custom_params(p,newparamfile)
%SET_FUSP_CUSTOM_PARAMS  Overwrite default fusp params where defined.

newparams = load(newparamfile);
init = newparams.fusp_init;
init_fields = fieldnames(init);
for f = 1:length(init_fields)
    thisfield = init_fields{f};
    p.fusp_init.(thisfield) = init.(thisfield);
end

ctrl = newparams.fusp_ctrl;
ctrl_fields = fieldnames(ctrl);
for f = 1:length(ctrl_fields)
    thisfield = ctrl_fields{f};
    p.fusp_ctrl.(thisfield) = ctrl.(thisfield);
end