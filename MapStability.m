%%  Standard Map short time stability
clear all;


JustLastPanel = 0;
pausetime = 0.1;
K = 4;
%K = 8+8/9.0;



nt = 80;
xres = 200;

p0 = linspace(-pi+0.01,pi-0.01,xres);
x0 = linspace(0.1,2*pi,xres);

[X,P] = meshgrid(x0,p0);




if JustLastPanel == 0
    TrM = zeros(length(x0),length(x0),nt);
else
    TrM = zeros(length(x0)); 
end



for ii = 1:length(x0)
    ii
    %x0(ii)
    for jj = 1:length(p0)

        p = P(ii,jj);
        x = X(ii,jj);
        
        MM = [1 0; 0 1];
        
        for kk = 1:nt
            km = [1 K*cos(x); 1 1+K*cos(x)];
            MM = km*MM;
            [p,x] = StdMap(p,x,K);
            if JustLastPanel == 0
                TrM(ii,jj,kk) = MM(1,1) + MM(2,2);
            elseif kk==nt
                TrM(ii,jj) = MM(1,1) + MM(2,2);
            end
        end

    end
end


%stability = log(abs(TrM(:))+1);

%scatter(X(:),P(:),10,stability,'fill')

if JustLastPanel == 0
    M = StabilityMovie(TrM,nt,x0,p0,K,pausetime);
else
    stability = log(abs(TrM));
    imagesc(stability)
end
