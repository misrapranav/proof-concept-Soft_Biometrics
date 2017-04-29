function [cc1, cc2, cc3] =  softSpaceReduceNN(option2) 
%% loading data
    load('~/NeuralNetwork/normXinputToTestNN.mat'); 
    outs = myNeuralNetworkFunction(testX);
    ids = [53,57,60,63,65,67,68,69,71,72,73,76,77,79,83,84,85,86,87,88,89,91,92,93,101,113,115,116,129,137,138,141,143,152,153,155,156,160,161,162,164,166,174,203,204,225,227,228,254,260,263,269,278,279,281,282,283,288];
%% testing network for all values
    [m,n] = size(outs);
    keys = zeros(2,m);
    cc1=0;
    cc2=0;
    cc3=0; 
%% traversing NN outputs column by column    
    for i = 1:n
        %% making variable keys with first row as ids in order and second row with NN output corresponding to ith column
        keys(1,:)= [53,57,60,63,65,67,68,69,71,72,73,76,77,79,83,84,85,86,87,88,89,91,92,93,101,113,115,116,129,137,138,141,143,152,153,155,156,160,161,162,164,166,174,203,204,225,227,228,254,260,263,269,278,279,281,282,283,288];
        keys(2,:)= outs(:,i);
        keys = sortrows(keys',2);  
        keys = keys';
        %% calculating the top three ids that the NN classifies the ith column to using sorted keys[]
        idTop3 = zeros(2,3);
        cnt=0;
        for j = m:-1:1
            if fix(idTop3(1,1))~=fix(keys(1,j)) && fix(idTop3(1,2))~=fix(keys(1,j)) && fix(idTop3(1,3))~=fix(keys(1,j))
               cnt = cnt +1;
               idTop3(:,cnt) = keys(:,j);
            end
            if cnt == 3           
                break;
            end       
        end%%                
            
        %% calculating how many columns of input data were matched correctly in first go, second go and third go
        if     idTop3(1,1) == ids(i)
            cc1 = cc1 +1;
        elseif idTop3(1,2) == ids(i)
            cc2 = cc2 +1;
        elseif idTop3(1,3) == ids(i)
            cc3 = cc3 + 1;
        end %%     
                
        if option2 ~= 999 && i == option2
            display(i); display(ids(1,i));  display(idTop3(1,:)); 
            break;
        end
    end%%
end%%