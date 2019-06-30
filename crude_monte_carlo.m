%prediction for visability:
lower_bound = 0.25;
upper_bound =2.5;
predict = crude_mont_carlo(100,lower_bound, upper_bound);
function mem_p= crude_mont_carlo(num_samples,lower_bound, upper_bound)
    
    sum_of_samples = 0;
    x = get_rand_number(lower_bound, upper_bound);
    mem_p=zeros(1,num_samples);
    for i = 1:num_samples/2
        mem_p(i) = get_rand_number(lower_bound, x);
        sum_of_samples =sum_of_samples+mem_p(i);
    end
    for j=num_samples/2:num_samples
        mem_p(j)=get_rand_number(x,upper_bound);
        sum_of_samples =sum_of_samples+mem_p(j);
    end
    
    
   
end

%this function return a number between the range thet sent
function rand_num=get_rand_number(lower,upper)
    range = upper-lower;
    choice = rand();
    rand_num=lower + range*choice;
end

