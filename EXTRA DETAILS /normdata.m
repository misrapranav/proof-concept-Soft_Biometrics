% normData = zeros(26,580)+0.0;
% normData(1:3,:) = data(1:3,:);
% for i = 4:26
%     normData(i,:) = 0.5*(tanh( 0.01*(data(i,:)-meani(i,1))/stdvs(i,1) )+1);
% end

% =========
% testing data creator
% normdat = zeros(26, 580-58);
% for i = 1:58
%     normdat(1:26, (i-1)*9+1:(i-1)*9+9) = normData(1:26, (i-1)*10+1:(i-1)*10+9);
% end

testdat = zeros(26,58);
for i = 1:58
    testdat(1:26, i) = data(1:26, (i-1)*10+10);
end

% =========

