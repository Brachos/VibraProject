function [dofList] = dofList_fun(nbNodes)
 dofList=zeros(nbNodes,6);
 n=1;
 for i=1:nbNodes
     for j=1:6
         dofList(i,j)=n;
         n=n+1;
     end
 end
end

