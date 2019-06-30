function monte_carlo_wevelength_23()
gama=mc_wl_23();
disp(gama);
subplot(2,1,1);
hist(gama);
subplot(2,1,2);
y=rand(50,1);
scatter(gama,y);
end
function wevelength=mc_wl_23()
rund_numbers=1:30;
wevelength=1:50;
field1=0;
field2=0;
field3=0;
for h=1:50
for i=1:30
   rund_numbers(i)=get_rand_number(22.90,23.01);
end
for j=1:30
    if rund_numbers(j)>=22.999499 && rund_numbers(j)<23.0005
        field1=field1+1;
    elseif rund_numbers(j)>=23.0005 && rund_numbers(j)<23.01
        field2=field2+1;
    elseif rund_numbers(j)>=22.90  && rund_numbers(j)<22.999499
        field3=field3+1;
    end
end

if field1> field2 && field1> field3  
    wevelength(h)=get_rand_number(22.999499 ,23.0005);
elseif field2> field1 && field2> field3  
    wevelength(h)=get_rand_number(23.0005,23.01);
elseif field3> field1 && field3> field2  
    wevelength(h)=get_rand_number(14.990,22.999499);
end
field1=0;
field2=0;
field3=0;
end

end
function rand_num=get_rand_number(lower,upper)
    range = upper-lower;
    choice = rand();
    rand_num=lower + range*choice;
end
