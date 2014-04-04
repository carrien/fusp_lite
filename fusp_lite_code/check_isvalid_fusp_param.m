function [isValid,varFormat] = check_isvalid_fusp_param(paramname)
%CHECK_ISVALID_FUSP_PARAM  Returns 1 for valid param, 0 otherwise.
%   CHECK_ISVALID_FUSP_PARAM(ISVALID,VARFORMAT) checks and returns the
%   result in ISVALID.  The format expected for the param PARAMNAME is
%   optionally returned in VARFORMAT as a string (e.g. '%s' or '%d').

init_fusp_expr_paths; % sets current_fusp_datadir

% read param file into cell array
paramfile = fullfile(current_fusp_datadir,'params.cps');
paramarray = file2cell(paramfile);

% search for paramname
allmatches = find(strncmp(paramname,paramarray,length(paramname)));

% only grab line with exact paramname (look for following left-paren)
lineind = 0;
for i=allmatches
    if strcmp('(',paramarray{i}(length(paramname)+1))
        lineind = i;
        break;
    end
end

if lineind
    isValid = 1;
    varFormat = paramarray{lineind}(end-1:end); %grab last two chars
else
    isValid = 0;
    varFormat = [];
end