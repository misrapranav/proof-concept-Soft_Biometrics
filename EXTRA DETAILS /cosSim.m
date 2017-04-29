function cc = cosSim(u,v,w, option)
    [m,n]  =  size(u);
    cc = 0;
    n = max([m n]);
    for i = 1:n   
    % w(i) denotes the discriminating power of the ith attribute as passed in the function
        if     option == 1 %using absolute difference for calculating cost
             cc = cc + abs((u(i)-v(i)));
        elseif option == 2 %using discriminating power for calculating cost
             cc = cc + abs((u(i)-v(i)))*w(i);
        elseif option == 3 %using discriminating power & reinforcement learning inspired penalties for calculating cost
            if  w(i)> 0.04 && abs(u(i)-v(i)) == 0
                cc = cc-3.9;
            elseif  w(i)> 0.04 && w(i)<0.07 && abs(u(i)-v(i)) <= 1
                cc = cc + 2*abs(u(i)-v(i));
            elseif  w(i)> 0.04 && w(i)> 0.07 && abs(u(i)-v(i)) >=1
                cc = cc + 10*abs(u(i)-v(i));
            elseif  w(i)> 0.04 &&  abs(u(i)-v(i)) > 1
                cc = cc + abs(u(i)-v(i))^2;
            else
                cc = cc +  abs(u(i)-v(i));  
            end
        end
        
    end
end


% only a limited number of people can be identiifed using soft biometrics
% since the value are discrete. Permutation and combination has the answer.
% For a very large set of faces we will need other methods upon the reduced
% search space that soft biometrics gives us