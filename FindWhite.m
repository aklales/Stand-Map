lastframe = log(abs(TrM(:,:,end)));
%imagesc(lastframe)

whitestamp = zeros(size(lastframe));

stablecutoff = 22;

for ii = 1:size(lastframe,1)
    for jj = 1:size(lastframe,2)
        if lastframe(ii,jj)<stablecutoff
            whitestamp(ii,jj) = 1;
        end
    end
end
imagesc(whitestamp)
