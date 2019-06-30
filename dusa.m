function dusa()
soil_type_massage='Enter soil type, for sandy press 1,for clay press 2 and for laomy press 3\n';
soil_type=input(soil_type_massage);
if soil_type~=1 && soil_type~=2 && soil_type~=3
    warning('Soil type is error choice!');
end
frequency_massage='Enten the level of frequency sending\n';
frequency=input(frequency_massage);
visability_massage='Enter visabiliy at kilometer\n';
i=1;
visability=0.1:0.1:i;
dusa_attenuation=0.1:0.1:i;
temp_vis=input(visability_massage);
while temp_vis~=0
    visability(i)=temp_vis;
    dusa_attenuation(i)=dus_a(visability(i),soil_type,frequency);
    i=i+1;
    visability_massage='Enter visabiliy at kilometer\n';
    temp_vis=input(visability_massage);
end
plot(visability,dusa_attenuation,'-s');
title('Attenuation vs Visability');
xlabel('visability');
ylabel('attenuation(dB)');
end
function dandsand_a = dus_a(visability,soil_type,frequency)
[imaginary_dialektrc, real_dialektric]=det_bandweidth(frequency,soil_type);
x=(1886*imaginary_dialektrc)/((real_dialektric+2)+imaginary_dialektrc^2);
y=137*10^3*imaginary_dialektrc*(6*(7*real_dialektric^2+7*imaginary_dialektrc^2+4*real_dialektric-20)/(5*((real_dialektric+2)^2+imaginary_dialektrc^2)^2)+1/15+5/(3*((2*real_dialektric+3)^2+4*imaginary_dialektrc)));
z=379*10^4*(((real_dialektric-1)^2*(real_dialektric+2)+(2*(real_dialektric-1)*(real_dialektric+2)-9)+imaginary_dialektrc^4)/(((real_dialektric+2)^2+imaginary_dialektrc^2)^2));
re=0.001;
dandsand_a = (re/visability)*(x+y*re^2*frequency^2+z*re^3*frequency^3);
end
function [imaganary, real]=det_bandweidth(frequency,soil_type)
if soil_type==1
    if frequency<=4 && frequency>=1 
        real=2.55;
        imaganary=0.016;
    elseif frequency<=12 && frequency>=8 
        real=2.53;
        imaganary=0.01;
    elseif frequency<=18 && frequency>=12
        real=2.8;
        imaganary=0.035;
    elseif frequency<=26.5 && frequency>18
        real=3.4;
        imaganary=0.2;
    elseif frequency<=40 && frequency>=26.5
        real=2.5;
        imaganary=0.028;
    elseif frequency<=100 && frequency>=56
    end
elseif soil_type==2
    if frequency<=4 && frequency>=1 
        real=2.20;
        imaganary=0.034;
    elseif frequency<=12 && frequency>=8 
        real=2.53;
        imaganary=0.01;
    elseif frequency<=18 && frequency>12
        real=2.8;
        imaganary=0.035;
    elseif frequency<=26.5 && frequency>18
        real=4.7;
        imaganary=1.1;
    elseif frequency<=40 && frequency>26.5
        real=2.515;
        imaganary=0.073;
    elseif frequency<=100 && frequency>=56
    end
elseif soil_type==3
    if frequency<=4 && frequency>=1 
        real=2.44;
        imaganary=0.003;
    elseif frequency<=12 && frequency>=8 
        real=2.44;
        imaganary=0.003;
    elseif frequency<=18 && frequency>=12
        real=2.8;
        imaganary=0.035;
    elseif frequency<=26.5 && frequency>=18
        real=13.6;
        imaganary=6.8;
    elseif frequency<=40 && frequency>=26.5
        real=2.53;
        imaganary=0.065;
    elseif frequency<=100 && frequency>=56
    end

end

end