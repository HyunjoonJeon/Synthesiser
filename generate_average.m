clear all; clc; clf; close all;

int32_max = 2147483647;
stepSizes = [102152113, 108226394, 114661870, 121480020, 128703598, 136356712, 144464904, 153055234, 162156372, 171798692, 182014374, 192837512, ];
length = size(stepSizes,2);
%%

averages = zeros(1, length);
for j=1:length
    y = zeros(22000,1);
    for i=1:size(y,1)
        if (i == 1)
            y(i,1) = 0;
        else
            temp = y(i-1,1) + stepSizes(1,j); 
            if temp > 2147483647
                y(i,1) = 0;
            else
                y(i,1) = temp;
            end
        end
    end
    y_mean = mean(y,1:22000);
    
    averages(1,j) = y_mean;
end

%%

sine_f = pi.*int32_max./stepSizes;