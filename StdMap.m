%%  Implementation of the standard map


function[p,theta] = StdMap(p,theta,K)

p = mod(p + K*sin(theta),2*pi);
if p > pi
    p = p-2*pi;
end

theta = mod(theta + p,2*pi);
