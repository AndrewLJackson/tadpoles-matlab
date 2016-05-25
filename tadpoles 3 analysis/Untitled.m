clear all

load burst_data_matrix_aj

data = burst_data_matrix_2;
data = data(find(isfinite(data(:,1))),:);
clear burst_data_matrix_2

subjects = unique(data(:,1));

nscreens = zeros(numel(subjects),1);

ct = 0;
for i = subjects'
    
    ct = ct + 1;
    
    ithsubject = find(data(:,1)==i);
%     sub = data(ithsubject,:)
    
    nscreens(ct) = numel(ithsubject);
    
end


[subjects,nscreens]