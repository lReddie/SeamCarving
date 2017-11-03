function E = myEnergyFunc(Img)
%%
%Img = Img_d;
%%
[m,n,z] = size(Img);
[Gx(:,:,1), Gy(:,:,1)] = gradient(Img(:,:,1)); 
[Gx(:,:,2), Gy(:,:,2)] = gradient(Img(:,:,2));
[Gx(:,:,3), Gy(:,:,3)] = gradient(Img(:,:,3));
[Gx, Gy] = gradient(Img);
G = abs(Gx) + abs(Gy);

G = sum(G,3);
E = abs(G); % ./ mHoG;
%imshow(E);
end
        
