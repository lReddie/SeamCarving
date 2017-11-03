function rImg = mySeamCarveResize(Img,rC,rR)
%rC: number of columns to be removed
%rR: number of row to be removed
%%
% Img = Img_d;
% rC =100;
% rR = 100;
%%
nImg = Img;

for iterc = 1:rC
[m,n,c] = size(nImg);    
gradImg = myEnergyFunc(nImg);
[E,S] = mySeamCarve_V(gradImg);
tImg = nImg;
for it = 1:length(S)
    tImg(it,S(it):end-1,:) = nImg(it,S(it)+1:end,:);
end
tImg(:,end,:) = [];
nImg = tImg;
% iterc
end
vImg = nImg;

for iterr = 1:rR
[m,n,c] = size(nImg);    
gradImg = myEnergyFunc(nImg);
[E,S] = mySeamCarve_H(gradImg);

tImg = nImg;
for it = 1:length(S)
    tImg(S(it):end-1,it,:) = nImg(S(it)+1:end,it,:);
end
tImg(end,:,:) = [];
nImg = tImg;
end

rImg = nImg;
end