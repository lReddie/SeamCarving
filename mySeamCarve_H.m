function [E,S] = mySeamCarve_H(EMap)
%find the horizontal seam with lowest energy
%return: E: the energy of the choosen seam, S: the choosen seam

[m,n] = size(EMap);
EMap = [EMap, zeros(m,1)];
EMap = [EMap; zeros(1,n+1)];

ENERGY = zeros(m,1);
LOCATION = zeros(n,m);

for x = 1:m
    point = x;
    for iter = 1:n
        ENERGY(x) = ENERGY(x) + EMap(point,iter);
        LOCATION(iter,x) = point; 
        
        %nextpoint options
        top = max(1,point-1); 
        mid = point;
        bot = min(m,point+1);
        LeastEnergy = min( [EMap(top,iter+1), EMap(mid, iter+1), EMap(bot,iter+1)] );
        
        if LeastEnergy == EMap(mid, iter+1)
            nextpoint = mid;
        elseif LeastEnergy == EMap(bot, iter+1)
            nextpoint = bot;
        else
            nextpoint = top;
        end
  
        point = nextpoint;
    end
end

[E,L] = min(ENERGY);
S = LOCATION(:,L);



end