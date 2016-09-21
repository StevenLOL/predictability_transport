function out = DN_Withinp(x,p)
% DN_Withinp    Proportion of data points within p standard deviations of the mean.
%
%---INPUTS:
% x, the input data vector
% p, the number (proportion) of standard deviations.

% ------------------------------------------------------------------------------
% Copyright (C) 2015, Ben D. Fulcher <ben.d.fulcher@gmail.com>,
% <http://www.benfulcher.com>
%
% If you use this code for your research, please cite:
% B. D. Fulcher, M. A. Little, N. S. Jones, "Highly comparative time-series
% analysis: the empirical structure of time series and their methods",
% J. Roy. Soc. Interface 10(83) 20130048 (2013). DOI: 10.1098/rsif.2013.0048
%
% This function is free software: you can redistribute it and/or modify it under
% the terms of the GNU General Public License as published by the Free Software
% Foundation, either version 3 of the License, or (at your option) any later
% version.
%
% This program is distributed in the hope that it will be useful, but WITHOUT
% ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
% FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
% details.
%
% You should have received a copy of the GNU General Public License along with
% this program. If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Check inputs:
%-------------------------------------------------------------------------------
if nargin < 2 || isempty(p)
    p = 1; % 1 std from mean
end

%-------------------------------------------------------------------------------
% Compute the property:
%-------------------------------------------------------------------------------

mu = mean(x); % mean of the time series
sig = std(x); % standard deviation of the time series
N = length(x); % length of the time series

out = sum(x >= mu-p*sig & x <= mu+p*sig)/N;

end
