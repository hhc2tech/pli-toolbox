function pli_addpath()
%PLI_ADDPATH Add paths of the pli-toolbox to MATLAB search paths
%
%   PLI_ADDPATH
%
%   Note
%   ----
%       This function does not save path to harddisk. To preserve
%       the paths for future sessions, one can call savepath.
%

tbdir = fileparts(mfilename('fullpath'));

directories = { ...
    'bases', ...
    'common', ...
    'distributions', ...
    'metrics' };

dirpaths = cellfun(@(x) fullfile(tbdir, x), directories, ...
    'UniformOutput', false);

addpath(dirpaths{:});


