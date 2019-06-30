function monte_carlo_wevelength_2_4()
gama=mc_wl_2_4();
disp(gama);
subplot(2,1,1);
hist(gama);
subplot(2,1,2);
y=rand(50,1);
scatter(gama,y);
end
function wevelength=mc_wl_2_4()
rund_numbers=1:30;
wevelength=1:50;
field1=0;
field2=0;
field3=0;
for h=1:50
for i=1:30
   rund_numbers(i)=get_rand_number(2.330,2.40050);
end
for j=1:30
    if rund_numbers(j)>=2.399948 && rund_numbers(j)<2.400052
        field1=field1+1;
    elseif rund_numbers(j)>=2.330 && rund_numbers(j)<2.399948
        field2=field2+1;
    elseif rund_numbers(j)>=2.400052 && rund_numbers(j)<2.40050 
        field3=field3+1;
    end
end

if field1> field2 && field1> field3  
    wevelength(h)=get_rand_number(2.399948,2.400052);
elseif field2> field1 && field2> field3  
    wevelength(h)=get_rand_number(2.330,2.399948);
elseif field3> field1 && field3> field2  
    wevelength(h)=get_rand_number(2.400052,2.40050);
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
