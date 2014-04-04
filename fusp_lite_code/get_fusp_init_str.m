function [init_string] = get_fusp_init_str(fusp_init)
%GET_FUSP_INIT_STR  Given param struct, return string for writing to file.

init_string = sprintf('%%%% startup params file\n%%%% generated by init_fusp_lite.m\n');
init_fields = fieldnames(fusp_init);
for f = 1:length(init_fields)
    thisfield = init_fields{f};
    if ischar(fusp_init.(thisfield))
        init_string = [init_string sprintf('%s(%s)\n',thisfield,fusp_init.(thisfield))]; %#ok<*AGROW>
    else
        init_string = [init_string sprintf('%s(%d)\n',thisfield,fusp_init.(thisfield))];
    end
end