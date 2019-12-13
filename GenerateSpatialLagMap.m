function x = GenerateSpatialLagMap(distMat,d0,rho)

if nargin < 3 || isempty(rho)
    rho = 0.8;
end

numPoints = size(distMat,1);

% W_{ij} = exp(-d_{ij} / d0)
W = exp(-distMat / d0);

% Clear diagonal:
identity = logical(eye(numPoints));
W(identity) = 0;

% Random numbers:
u = randn(numPoints,1);

% keyboard
% x = (identity - rho * W)\u;
% x = inv(identity - rho * W)*u;
x = rho * W * u;

end
