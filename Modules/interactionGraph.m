function [r] = interactionGraph(A, reorder)
%
% function [r] = interactionGraph(A, reorder)
%
% Author:
%   (c) Matthias Chung (mcchung@vt.edu)
%       Justin Krueger (kruegej2@vt.edu)
%
% Date: June 2015
%
% MATLAB Version: 8.4.0.150421 (R2014b)
%
% Description:
%   This code produces a directed graph with the colors of the edge from
%   node j to node i given by the value of entry a_{i,j} in the matrix A.
%
% Input arguments:
%   A        - values assigned to graph edges
%   reorder  - switch variable that reorders the rows and columns of A when
%              turned on
%
% Output arguments:
%   r       - final ordering of nodes
%
% Example:
%   A = randn(6,6);
%   interactionGraph(A, 1);
%
% References:
%

% get size of A
[M,N] = size(A);

% input matrix A must be square
if M ~= N
    error('Matrix must be squared')
end

% if only one input, do not reorder
if nargin < 2
    reorder = 0;
end

% reorder A such that non-zeros are near diagonal
if reorder
    r = symrcm(A);
    A = A(r, r);
else
    r = 1:N;
end

% find entry with largest magnitude and discretize matrix value interval
maxA = max(max(abs(A)));
matrixSpectrum = linspace(-maxA, maxA, 64);

% creat colormap
colorGrad1 = linspace(0.5, 1, 32)';
colorGrad2 = linspace(0, 1, 32)';
colorSpectrum = [colorGrad2, colorGrad2, colorGrad1; ...
    flipud([colorGrad1, colorGrad2, colorGrad2])];

% assign a color to each matrix value
s = interp1(matrixSpectrum, colorSpectrum, A(:), 'linear');
s = reshape(s, N, N, 3);

% initialize figure, colormap, and colorbar
figure(gcf);
hold on;
colormap(colorSpectrum);
colorbar;
caxis([-maxA, maxA]);

% create coordinates for nodes
C = [sin(2*pi*(0:N-1)/N); cos(2*pi*(0:N-1)/N)]';

% label nodes
text(1.2*C(:,1), 1.2*C(:,2), num2str(r'), 'FontName', 'Times', ...
    'FontSize', 12, 'HorizontalAlignment', 'center', 'Color', 'k');

% plot node markers
plot(C(:,1), C(:,2), '.', 'color', 'k', 'MarkerSize', 25);

% create variables for ordering plots of edges based on the corresponding
% magnitudes of the entries in A
magA = zeros(N^2, 1);
k = N^2;

% plot graph edges
t = 0:0.01:1;   % time steps for parametric equations
for j = 1:N
    for i = j:N
        if i==j     % edge between the same node
            p1 = C(j, :)';              % node location
            p3 = 1.4*C(i, :)';          % diameter of edge circle
            pMid = 0.5*(p1+p3);         % center of edge circle
            radius = norm(p3-pMid, 2);  % radius of edge circle
            bCurve = bsxfun(@times, pMid, ones(size(t))) - radius*[sin(2*pi*(t+(i-1)/N)); cos(2*pi*(t+(i-1)/N))];       % edge
            arrow = [p3+0.05*p1, bCurve(:,55), p3-0.05*p1];                                                             % arrow for edge
            plot(bCurve(1,:), bCurve(2,:), arrow(1,:), arrow(2,:), 'Color', reshape(s(i,j,:), 1, 3), 'LineWidth', 1.5); % plot edge and arrow
            magA(k) = abs(A(i,j));  % store magnitude of edge value
            k = k - 1;              % update index
        else        % edges between two different nodes
            p1 = C(j, :)';                                      % node j location
            p3 = C(i, :)';                                      % node i location
            pMid = 0.5*(p1+p3);                                 % midpoint beween nodes j and i
            biSect = [sin(pi*(i+j-2)/N); cos(pi*(i+j-2)/N)];    % angle between midpoint and center of graph
            p2 = pMid + 0.15*biSect;                            % point along vector from midpoint to give curvature to the first edge
            p4 = pMid - 0.15*biSect;                            % point in opposite direction along along vector from midpoint to give curvature to the second edge
            bCurve = bsxfun(@times,(1-t).^2,p1) + bsxfun(@times,2*(1-t).*t,p2) + bsxfun(@times,t.^2,p3);                    % first edge
            arrow = [bCurve(:,51)+0.05*biSect, bCurve(:,55), bCurve(:,51)-0.05*biSect];                                     % first arrow
            plot(bCurve(1,:), bCurve(2,:), arrow(1,:), arrow(2,:), 'Color', reshape(s(i,j,:), 1, 3), 'LineWidth', 1.5);     % plot first edge and arrow
            magA(k) = abs(A(i,j));  % store magnitude of edge value                               
            k = k - 1;              % update index
            bCurve = bsxfun(@times,(1-t).^2,p3) + bsxfun(@times,2*(1-t).*t,p4) + bsxfun(@times,t.^2,p1);                    % second edge
            arrow = [bCurve(:,51)+0.05*biSect, bCurve(:,55), bCurve(:,51)-0.05*biSect];                                     % second arrow
            plot(bCurve(1,:), bCurve(2,:), arrow(1,:), arrow(2,:), 'Color', reshape(s(j,i,:), 1, 3), 'LineWidth', 1.5);     % plot second edge and arrow
            magA(k) = abs(A(j,i));  % store magnitude of edge value
            k = k - 1;              % update index
        end
    end
end

% sort values stored in magA and create new plotting order
[~, idx] = sort(magA, 'descend');                                   % sort values in magA
idx = 2*[N^2; kron(idx, [1;1])] - [-1; kron(ones(N^2,1), [0; 1])];  % create new plotting order (includes edges, arrows, and nodes)

% update plotting order using results stored in idx
plotHandles = get(gca, 'Children');         % collect plot handles
plotHandles(1:2*N^2+1) = plotHandles(idx);  % reorder plot handles
set(gca, 'Children', plotHandles);          % update plot handles