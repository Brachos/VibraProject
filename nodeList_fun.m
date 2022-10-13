function [newNodeList] = nodeList_fun(nodeList,nbElem,elemList)
newNodeList = nodeList;
for i = 1:length(elemList)
    xNew = linspace(nodeList(elemList(i,1),1),nodeList(elemList(i,2),1),nbElem+1);
    yNew = linspace(nodeList(elemList(i,1),2),nodeList(elemList(i,2),2),nbElem+1);
    zNew = linspace(nodeList(elemList(i,1),3),nodeList(elemList(i,2),3),nbElem+1);
    newCoordonates = [xNew(2:end-1).' yNew(2:end-1).' zNew(2:end-1).'];
    newNodeList = [newNodeList; newCoordonates];
end
end

