function  [] = plot2(X1,X2,Y)
  [~,idx] = unique(Y,'first');
  list = Y(sort(idx),:);
  col = {'k','b','r','y','c','g'};
  
  for i = 1:size(list,1)
    index = find(Y == list(i,1));
    x1 = X1(index);
    x2 = X2(index);
    hold on
    plot(x1,x2,'color',col{i},'marker','o','Linestyle','none');
    
  endfor
  
endfunction
