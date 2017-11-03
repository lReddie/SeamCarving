function im=seamcarvingt(im,k)
%% illustrative example of Seam carving for content aware image resizing

% im = Img_d;
% k = 100;

%%

im=im2double(im);

for jj=1:k
    G=costfunction(im);
    %find shortest path in G
    Pot=G;
    for ii=2:size(Pot,1)
        pp=Pot(ii-1,:);
        ix=pp(1:end-1)<pp(2:end);
        pp([false ix])=pp(ix);
        ix=pp(2:end)<pp(1:end-1);
        pp(ix)=pp([false ix]);
        Pot(ii,:)=Pot(ii,:)+pp;
    end

    %Walk down hill
    pix=zeros(size(G,1),1);
    [mn,pix(end)]=min(Pot(end,:));
    pp=find(Pot(end,:)==mn);
    pix(end)=pp(ceil(rand*length(pp)));
    
    im(end,pix(end),:)=nan;
    for ii=size(G,1)-1:-1:1
        %[mn,gg]=min(Pot(ii,pix+(-1:1)));
        [mn,gg]=min(Pot(ii,max(pix(ii+1)-1,1):min(pix(ii+1)+1,end)));
        pix(ii)=gg+pix(ii+1)-1-(pix(ii+1)>1);
        im(ii,pix(ii),:)=bitand(ii,1);
%        G(ii,pix(ii))=1;
    end

    %remove seam from im & G:
    for ii=1:size(im,1)
%        G(ii,pix(ii):end-1)=G(ii,pix(ii)+1:end);
        im(ii,pix(ii):end-1,:)=im(ii,pix(ii)+1:end,:);
    end
    im(:,end,:)=[];
%    G(:,end)=[];

end


end
