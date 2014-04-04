function [strct] = extend_struct(strct,newstrct)

newfields = fieldnames(newstrct);
for i=1:length(newfields)
    strct.(newfields{i}) = newstrct.(newfields{i});
end