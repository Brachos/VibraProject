function [newElemList,n] = elemList_fun(elemList,nbElem,nbNodes)
newElemList=zeros(size(elemList,1)*nbElem,2);
n=nbNodes+1;
a=1;
for i=1:size(elemList,1)
    for j=1:nbElem
                if j==1
                    newElemList(a,1)=elemList(i,1);
                    newElemList(a,2)=n;
                    a=a+1;
         
                elseif j==nbElem
                    newElemList(a,1)=n;
                    n=n+1;
                    newElemList(a,2)=elemList(i,2); 
                    a=a+1;
                else
                    newElemList(a,1)=n;
                    n=n+1;
                    newElemList(a,2)=n; 
                    a=a+1;
                end      
    end       
end
end

