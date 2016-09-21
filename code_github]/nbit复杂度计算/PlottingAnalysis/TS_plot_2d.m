function TS_plot_2d(Features,TimeSeries,featureLabels,groupNames,annotateParams,showDistr,classMethod)
% TS_plot_2d   Plots a dataset in a two-dimensional space.
%
% e.g., The space of two chosen features, or two principal components.
%
%---INPUTS:
% Features, an Nx2 vector of where to plot each of the N data objects in the
%           two-dimensional space
%
% TimeSeries, structure array for time series metadata
%
% featureLabels, cell of labels for each feature
%
% groupLabels, cell of labels for each group of timeseries
%
% annotateParams, a structure containing all the information about how to annotate
%           data points. Fields can include:
%               - n, the number of data points to annotate
%               - userInput, 0: randomly selected datapoints, 1: user clicks to annotate datapoints
%               - fdim, 1x2 vector with width and height of time series as fraction of plot size
%               - maxL, maximum length of annotated time series
%               - textAnnotation: 'Name', 'tsid', or 'none' to annotate this data
%               - cmap, a cell of colors, with elements for each group
%               - theMarkerSize, a custom marker size
%               - theLineWidth: line width for annotated time series
%
% showDistr, if 1 (default), plots marginal density estimates for each variable
%                   (above and to the right of the plot), otherwise set to 0.
%
% classMethod, can select a classifier to fit to the different classes (e.g.,
%               'linclass' for a linear classifier).

% ------------------------------------------------------------------------------
% Copyright (C) 2015, Ben D. Fulcher <ben.d.fulcher@gmail.com>,
% <http://www.benfulcher.com>
%
% If you use this code for your research, please cite:
% B. D. Fulcher, M. A. Little, N. S. Jones, "Highly comparative time-series
% analysis: the empirical structure of time series and their methods",
% J. Roy. Soc. Interface 10(83) 20130048 (2013). DOI: 10.1098/rsif.2013.0048
%
% This work is licensed under the Creative Commons
% Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of
% this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send
% a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
% California, 94041, USA.
% ------------------------------------------------------------------------------

% ------------------------------------------------------------------------------
%% Check Inputs:
% ------------------------------------------------------------------------------

% Features should be a Nx2 vector of where to plot each of the N data objects in the two-dimensional space
if nargin < 1
    error('You must provide two-dimensional feature vectors for the data.')
end

if nargin < 5 || isempty(annotateParams)
    annotateParams = struct('n',0); % don't annotate
end

% By default, plot kernel density estimates above and on the side of the plot:
if nargin < 6 || isempty(showDistr)
    showDistr = 1;
end

if nargin < 7 || isempty(classMethod)
    classMethod = 'linclass';
end

makeFigure = 1; % default is to plot on a brand new figure('color','w')

% ------------------------------------------------------------------------------
% Compute linear classification rates just for fun
% ------------------------------------------------------------------------------
classRate = zeros(3,1); % classRate1, classRate2, classRateboth
if isfield(TimeSeries,'Group')
    groupLabels = [TimeSeries.Group]'; % Convert GroupIndices to group form
    numGroups = length(unique(groupLabels));

    classify_fn = @(XTrain,yTrain,Xtest,ytest) ...
                    mean(ytest == classify(Xtest,XTrain,yTrain,'linear'));
    try
        classRate(1) = mean(classify_fn(Features(:,1),groupLabels,Features(:,1),groupLabels));
        classRate(2) = mean(classify_fn(Features(:,2),groupLabels,Features(:,2),groupLabels));
        classRate(3) = mean(classify_fn(Features(:,1:2),groupLabels,Features(:,1:2),groupLabels));
        fprintf(1,'Linear in-sample classification rates computed.\n');
    catch emsg
        fprintf(1,'Linear classification rates not computed\n(%s)\n',emsg.message);
        classRate(:) = NaN;
    end
else
    % No group information assigned to time series
    numGroups = 1;
    groupLabels = ones(length(TimeSeries),1);
end

% ------------------------------------------------------------------------------
%% Plot
% ------------------------------------------------------------------------------
if makeFigure % can set extras.makeFigure = 0 to plot within a given setting
    f = figure('color','w'); box('on'); % white figure
    f.Position = [f.Position(1), f.Position(2), 600, 550];
end

% Set colors
if isstruct(annotateParams) && isfield(annotateParams,'cmap')
    if ischar(annotateParams.cmap)
        groupColors = BF_getcmap(annotateParams.cmap,numGroups,1);
    else
        groupColors = annotateParams.cmap; % specify the cell itself
    end
else
    if numGroups < 10
        groupColors = BF_getcmap('set1',numGroups,1);
    elseif numGroups <= 12
        groupColors = BF_getcmap('set3',numGroups,1);
    elseif numGroups <= 22
        groupColors = [BF_getcmap('set1',numGroups,1); ...
                    BF_getcmap('set3',numGroups,1)];
    elseif numGroups <= 50
        groupColors = mat2cell(jet(numGroups),ones(numGroups,1));
    else
        error('There aren''t enough colors in the rainbow to plot this many classes!')
    end
end
if (numGroups == 1)
    groupColors = {[0,0,0]}; % Just use black...
end
annotateParams.groupColors = groupColors;

% ------------------------------------------------------------------------------
%% Plot distributions
% ------------------------------------------------------------------------------
if showDistr
    % Top distribution (marginal of first feature)
    subplot(4,4,1:3); hold on; box('on')
    maxx = 0; minn = 100;
    for i = 1:numGroups
        fr = BF_plot_ks(Features(groupLabels==i,1),groupColors{i},0);
        maxx = max([maxx,fr]); minn = min([minn,fr]);
    end
    axTop = gca;
    set(axTop,'XTickLabel',[]);
    set(axTop,'YTickLabel',[]);
    set(axTop,'ylim',[minn,maxx]);

    % Side distribution (marginal of second feature)
    subplot(4,4,[8,12,16]); hold on; box('on')
    maxx = 0; minn = 100;
    for i = 1:numGroups
        fr = BF_plot_ks(Features(groupLabels==i,2),groupColors{i},1);
        maxx = max([maxx,fr]); minn = min([minn,fr]);
    end
    axSide = gca;
    set(axSide,'XTickLabel',[]);
    set(axSide,'YTickLabel',[]);
    set(axSide,'xlim',[minn,maxx]);
end


% ------------------------------------------------------------------------------
%% Set up a 2D plot
% ------------------------------------------------------------------------------
if showDistr
    subplot(4,4,[5:7,9:11,13:15]); box('on');
    axMain = gca;
end
hold on;

if isfield(annotateParams,'theMarkerSize');
    theMarkerSize = annotateParams.theMarkerSize; % specify custom marker size
else
    theMarkerSize = 12; % Marker size for '.'
end

for i = 1:numGroups
    plot(Features(groupLabels==i,1),Features(groupLabels==i,2),...
                '.','color',groupColors{i},'MarkerSize',theMarkerSize)
end

% Link axes
if showDistr
    linkaxes([axMain,axTop],'x');
    linkaxes([axMain,axSide],'y');
end

% ------------------------------------------------------------------------------
%% Plot a classify boundary?
% ------------------------------------------------------------------------------
didClassify = 0;
if (numGroups == 2) && strcmp(classMethod,'linclass');
    whatClassifier = 'linear'; % or 'quadratic'

    xlim = get(gca,'XLim'); ylim = get(gca,'YLim');
    [X, Y] = meshgrid(linspace(xlim(1),xlim(2),200),linspace(ylim(1),ylim(2),200));
    X = X(:); Y = Y(:);
    [~,~,~,~,coeff] = classify([X Y],Features(:,1:2), groupLabels, whatClassifier);

    hold on;
    K = coeff(1,2).const; L = coeff(1,2).linear;
    if strcmp(whatClassifier,'linear')
        Q = zeros(2,2);
    else
        Q = coeff(1,2).quadratic;
    end
    f = sprintf('0 = %g+%g*x+%g*y+%g*x^2+%g*x.*y+%g*y.^2',K,L,Q(1,1),Q(1,2)+Q(2,1),Q(2,2));
    h2 = ezplot(f,[xlim(1), xlim(2), ylim(1), ylim(2)]);
    set(h2,'LineStyle','--','color',ones(1,3)*0.5,'LineWidth',1.5)

    % Label that classification was performed
    didClassify = 1;
end


% ------------------------------------------------------------------------------
%% Label Axes
% ------------------------------------------------------------------------------
if didClassify
    labelText = cell(2,1);
    for i = 1:2
        labelText{i} = sprintf('%s (acc = %.2f %%)',featureLabels{i}, ...
                                round(classRate(i,1)*100));
    end
else
    labelText = featureLabels;
end

xlabel(labelText{1},'interpreter','none')
ylabel(labelText{2},'interpreter','none')

% Set Legend
if numGroups > 1
    legendText = cell(numGroups,1);
    for i = 1:numGroups
        if ~isempty(groupNames)
            legendText{i} = sprintf('%s (%u)',groupNames{i},sum(groupLabels==i));
        else
            legendText{i} = sprintf('Group %u (%u)',i,sum(groupLabels==i));
        end
    end
    legend(legendText);
end

%-------------------------------------------------------------------------------
% Annotate points:
%-------------------------------------------------------------------------------
if isfield(TimeSeries,'Data')
    % Only attempt to annotate if time-series data is provided

    % Produce xy points
    xy = Features;

    % Go-go-go:
    BF_AnnotatePoints(xy,TimeSeries,annotateParams);
end

%-------------------------------------------------------------------------------
% Set title:
%-------------------------------------------------------------------------------
if didClassify
    title(sprintf('Combined classification rate (%s) = %.2f%%',classMethod, ...
                    round(classRate(3,1)*100)),'interpreter','none');
end

end
