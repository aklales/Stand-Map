function[M] = StabilityMovie(TrM,nt,x,y,k,pausetime)



bob = log(abs(TrM(:,:,end)));
minbob = min(min(bob));
maxbob = max(max(bob));

mycolors = ones(81,3);
mycolors(:,2) = linspace(1,0,81);
mycolors(:,1) = linspace(1,0,81);


for ii = 1:nt
    
    clim = ([minbob,maxbob]);
    colormap(mycolors)

    imagesc(x,y,log(abs(TrM(:,:,ii))),clim)
    title(sprintf('K = %f',k))
    M(ii) = getframe;
    pause(pausetime)

end

sprintf('Done.')

