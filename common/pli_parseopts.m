function S = pli_parseopts(S, oplist)
%PLI_PARSEOPTS Parse option list
%
%   S = PLI_PARSEOPTS(S, oplist);
%
%       Parses option list in the form of name/value pairs, updates
%       the option struct S.
%

%% argument checking

if isempty(oplist)
    return;
end

names = oplist(1:2:end);
vals = oplist(2:2:end);

if ~(isstruct(S) && isscalar(S))
    error('pli_parseopts:invalidarg', 'S should be a single struct.');
end

n = length(names);
if ~(iscellstr(names) && length(vals) == n)
    error('pli_parseopts:invalidarg', 'Invalid option list.');
end

%% main

for i = 1 : n
    cn = names{i};
    cv = vals{i};
    
    if isfield(S, cn)
        S.(cn) = cv;
    else
        error('pli_parseopts:invalidarg', 'Invalid option name %s', cn);
    end
end


