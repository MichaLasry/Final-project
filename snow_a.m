function snow_a()
%SNOW_A calculate the snow attenuation dry and wet.
snow_kind_massage='Enter snow kind, for dry enter 1, for wet 0 \n';
snow_kind=input(snow_kind_massage);
snow_rate_massage='Enter snow rate at mm/h \n ';
snow_rate=input(snow_rate_massage);

i=1;
attenuation=1:i;
while(snow_rate~=-1)
    snow=snow_attenuation(snow_rate,snow_kind);
    attenuation(i)=snow;
    fprintf('The snow attenuation is %4.5f dB \n',attenuation(i));
    i=i+1;
    snow_rate_massage='Enter snow rate at mm/h \n ';
    snow_rate=input(snow_rate_massage);
end
y=1:10;
figure;
plot(y,attenuation,'-s')
title('snow attenuation vs snowfall precipitation rate')
xlabel('snowfall rate (mm/h)')
ylabel('Attenuation (dB/km)')
end
function snow_att=snow_attenuation(snow_rate,snow_kind)

wevelength=get_rand_number(1.15,1.95);
S=snow_rate;
if snow_kind==1
    a=0.0000542*wevelength+5.4958776;
    b=1.38;
    snow_att=a*S^b;
elseif snow_kind==0
    a=0.0001023*wevelength+3.7855466;
    b=0.72;
    snow_att=a*S^b;
else    
    warning('problem with the snow kind!');
    snow_att='Error!';
end
end
function rand_num=get_rand_number(lower,upper)
    range = upper-lower;
    choice = rand();
    rand_num=lower + range*choice;
end