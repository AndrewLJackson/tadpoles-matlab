load burst_data_matrix_aj

%counter = 1;
counter_2 = 1;
counter_3 = 1;
counter_4 = 1;
counter_5 = 1;
counter_6 = 1;
counter_7 = 1;
counter_8 = 1;
counter_9 = 1;
counter_10 = 1;
counter_11 = 1;
counter_12 = 1;
counter_13 = 1;
counter_14 = 1;
counter_15 = 1;
counter_16 = 1;


for counter = 1:5296

    
        
        
    
        if  burst_data_matrix_2(counter,13) == 0 && burst_data_matrix_2(counter,14) == 0 && burst_data_matrix_2(counter,15) == 1 && burst_data_matrix_2(counter,16) == 0
            
            if burst_data_matrix_2(counter,10) == 1
                
                basic_confus_matrix(counter_2,1) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_2,2) = burst_data_matrix_2(counter,1);
                
                counter_2 = counter_2 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 5
                
                basic_confus_matrix(counter_3,3) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_3,4) = burst_data_matrix_2(counter,1);
                
                counter_3 = counter_3 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 10
                
                basic_confus_matrix(counter_4,5) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_4,6) = burst_data_matrix_2(counter,1);
                
                counter_4 = counter_4 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 15
                
                basic_confus_matrix(counter_5,7) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_5,8) = burst_data_matrix_2(counter,1);
                
                counter_5 = counter_5 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 20
                
                basic_confus_matrix(counter_6,9) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_6,10) = burst_data_matrix_2(counter,1);
                
                counter_6 = counter_6 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 25
                
                basic_confus_matrix(counter_7,11) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_7,12) = burst_data_matrix_2(counter,1);
                
                counter_7 = counter_7 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 30
                
                basic_confus_matrix(counter_8,13) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_8,14) = burst_data_matrix_2(counter,1);
                
                counter_8 = counter_8 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 35
                
                basic_confus_matrix(counter_9,15) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_9,16) = burst_data_matrix_2(counter,1);
                
                counter_9 = counter_9 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 40
                
                basic_confus_matrix(counter_10,17) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_10,18) = burst_data_matrix_2(counter,1);
                
                counter_10 = counter_10 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 50
                
                basic_confus_matrix(counter_11,19) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_11,20) = burst_data_matrix_2(counter,1);
                
                counter_11 = counter_11 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 60
                
                basic_confus_matrix(counter_12,21) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_12,22) = burst_data_matrix_2(counter,1);
                
                counter_12 = counter_12 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 70
                
                basic_confus_matrix(counter_13,23) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_13,24) = burst_data_matrix_2(counter,1);
                
                counter_13 = counter_13 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 80
                
                basic_confus_matrix(counter_14,25) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_14,26) = burst_data_matrix_2(counter,1);
                
                counter_14 = counter_14 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 90
                
                basic_confus_matrix(counter_15,27) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_15,28) = burst_data_matrix_2(counter,1);
                
                counter_15 = counter_15 + 1;
                
            end
            
            if burst_data_matrix_2(counter,10) == 100
                
                basic_confus_matrix(counter_16,29) = burst_data_matrix_2(counter,12);
                basic_confus_matrix(counter_16,30) = burst_data_matrix_2(counter,1);
                
                counter_16 = counter_16 + 1;
                
            end
            
            
        end
    
    
    
end



%%%STILL HAVE TO LOOP THE FOLLOWING CODE AND STILL HAVE TO ADD CE FOR THE
%%%MEDIANS, THEN HAVE TO ADD VALUES TO THE APPROPRIATE PLACE IN
%%%'basic_confus_matrix'

%loading c values for later use in ce of median procedure (dont loop)
load c_values

next_bttt = size(basic_confus_matrix);
next_bttt_2 = next_bttt(1);

for hello_yes_yes = 1:2:30
    
    %N for each column (including zeros)
    stat_1 = length(find(basic_confus_matrix(:,hello_yes_yes + 1) > 0));
    
    %mean of values > zero in each column
    mean_gtr_0 = mean(basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes));
    
    % %median of all vlaues in each column
    % meadian_all = median(basic_confus_matrix(1:stat_1, 2-1));
    
    %median of values > zero in each column
    median_gtr_0 = median(basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes));
    
    %proportion of all efforts to click tadpole that failed in each column
    propn_failed = length(find((basic_confus_matrix(1:stat_1, hello_yes_yes)) == 0)) ./ stat_1;
    
    [h,sig,ci] = ttest((basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes)),0);
    
    %+- confidence intervals of the mean for values > 0 in each column.
    ce_mean_gtr_zeros = ci(2) - mean_gtr_0;
    
    
    % confidence interval for the median for values > 0
    
    % n
    enn = length(basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes));
    
    %sorting relevant data
    first = sort(basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes));
    
    %lower limit
    
    if enn <= 100
    
        CEmdn_lower_limit = first(c_values(enn) + 1);
    
    else
    
        CEmdn_lower_limit = first(c_values(100) + 1);
    
    end
    
    %upper limit
    
    if enn <= 100
        
        CEmdn_upper_limit = first(enn - c_values(enn));
    
    else
    
        CEmdn_upper_limit = first(enn - c_values(100));
    
    end
    
    basic_confus_matrix(next_bttt_2 + 4, hello_yes_yes) = mean_gtr_0;
    basic_confus_matrix(next_bttt_2 + 5, hello_yes_yes) = median_gtr_0;
    basic_confus_matrix(next_bttt_2 + 6, hello_yes_yes) = propn_failed;
    basic_confus_matrix(next_bttt_2 + 7, hello_yes_yes) = ce_mean_gtr_zeros;
    basic_confus_matrix(next_bttt_2 + 8, hello_yes_yes) = CEmdn_lower_limit;
    basic_confus_matrix(next_bttt_2 + 9, hello_yes_yes) = CEmdn_upper_limit;
    basic_confus_matrix(next_bttt_2 + 10, hello_yes_yes) = stat_1;
    basic_confus_matrix(next_bttt_2 + 11, hello_yes_yes) = enn;
    
    new_new_new_y = basic_confus_matrix((find(basic_confus_matrix(1:stat_1,hello_yes_yes) > 0)), hello_yes_yes);
    basic_confus_matrix((next_bttt_2 + 15):(next_bttt_2 + 15 + enn - 1), hello_yes_yes) = new_new_new_y; 
    
end



