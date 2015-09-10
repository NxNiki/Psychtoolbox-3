function [Y,index] = Shuffle(X, bindDim)
% [Y,index] = Shuffle(X)
%
% Randomly sorts X.
% If X is a vector, sorts all of X, so Y = X(index).
% If X is an m-by-n matrix, sorts each column of X, so
%	for j=1:n, Y(:,j)=X(index(:,j),j).
%
% Also see SORT, Sample, Randi, and RandSample.

% xx/xx/92  dhb  Wrote it.
% 10/25/93  dhb  Return index.
% 5/25/96   dgp  Made consistent with sort and "for i=Shuffle(1:10)"
% 6/29/96	  dgp  Edited comments above.
% 5/18/02   dhb  Modified code to do what comments say, for matrices.
% 6/2/02    dhb  Fixed bug introduced 5/18.
% 9/10/15   niki Add bindDim. Sortting each column of X can be simply
% implemented by Y = X(index) instead of for j=1:n, Y(:,j)=X(index(:,j),j).

%{
Example:
[~,ind]=Shuffle(rand(5,3,4),[1])
[~,ind]=Shuffle(rand(5,3,4),[2])
[~,ind]=Shuffle(rand(5,3,4),[3])
[~,ind]=Shuffle(rand(5,3,4),[1,3])
%}

if nargin<2
    bindDim = [];
end

bind_ind = false(ndims(X),1);
bind_ind(bindDim) = 1;

siz = size(X);
siz_unbind = siz;
siz_unbind(bind_ind) = 1;

siz_bind = siz;
siz_bind(~bind_ind) = 1;

[~,index] = sort(rand(siz_unbind));
index = repmat(index,siz_bind);
Y = X(index);
 
