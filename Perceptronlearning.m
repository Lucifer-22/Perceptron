clear, close all, clc;

% Reading data from Excel File
%%filename=input('ENTER EXCEL FILE LOCATION WITH FILENAME\n','s');
%%data = readtable(filename);
data = readtable("data.xlsx")

% Initialization
eta = input('Enter the value of eta : ');
eta
weight = [1 -1 0]
xtrain = [data.x1 data.x2 data.x3]'
target = data.t

%Size of input training set
size_x = size(xtrain);
row_x = size_x(1,1);
col_x = size_x(1,2);

% Logic
count = 0;
y = zeros;

while true
    weight_old = weight;
    i = mod(count,3)+1;
    y(i) = sign(weight * xtrain(:,i));
    if y(i) ~= target(i,:) % not equal in MATLAB is ~= not != 
        temp = eta * (target(i,:) - y(i)) * xtrain(:,i);
        weight_new = weight' + temp;
        weight = weight_new';
    end
    
    
    weight
      
    % Condition for closing loop
    if (weight == weight_old)
            break;
    else
        count = count + 1
    end
    
end
fprintf('Final Weight:')
weight
fprintf('Final Count:')
count


 
