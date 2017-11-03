function [E,S] = mySeamCarve_V(EMap)
%find the vertical seam with lowest energy
%return: E: the energy of the choosen seam, S: the choosen seam

[m,n] = size(EMap);
EMap = [EMap; zeros(1,n);];

ENERGY = zeros(n,1);
LOCATION = zeros(m,n);

for y = 1:n
    point = y;
    for iter = 1:m
        ENERGY(y) = ENERGY(y) + EMap(iter,point);
        LOCATION(iter,y) = point; 
        
        %nextpoint options
        left = max(1,point-1); mid = point; right = min(n,point+1);
        LeastEnergy = min( [EMap(iter+1,left), EMap(iter+1, mid), EMap(iter+1, right)] );
        
        if LeastEnergy == EMap(iter+1, left)
            nextpoint = left;
        elseif LeastEnergy == EMap(iter+1, right)
            nextpoint = right;
        else
            nextpoint = mid;
        end
  
        point = nextpoint;
    end
end

[E,L] = min(ENERGY);
S = LOCATION(:,L);
end