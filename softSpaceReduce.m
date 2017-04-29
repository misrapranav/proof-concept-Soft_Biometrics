function [cc1, cc2, cc3] =  softSpaceReduce(option, option2)
    load('./SimilarityMatchingData/testData58.mat');
    testd = testdat;
    if option == 1 || option == 3 || option == 2
    else 
        display('only option 1 2 or 3 are allowed ');
    end
        
    [m,n] = size(testd);
    testToPass(1:23,:) = testd(4:26,:);
    cc1=0;
    cc2=0;
    cc3=0;
    
 %%  cleanly checking if right answer is in top three values   
    for i = 1 : n
        
        if option2 ~=999 && i == option2
             display(i);
             display(testd(1,i));
            k = matching(testToPass(:,i), option); 
        else
            k = matching(testToPass(:,i), option);
        end
        
        if     testd(1,i) == k(1,1) 
            cc1 = cc1+1; 
        elseif testd(1,i) == k(1,2)
            cc2 = cc2 +1;
        elseif testd(1,i) == k(1,3)
            cc3 = cc3 + 1;
        end 
        % to display the top three predictions corresponding to option2
        if option2 ~=999 && i == option2
            display(k(1,:));
            break;
        end
    end
 
end