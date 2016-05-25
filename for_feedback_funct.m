function [prev_user_1_5, prev_user_6_10, prev_user_11_15, prev_user_16_20, prev_user_1_5_2, prev_user_6_10_2, prev_user_11_15_2, prev_user_16_20_2] = for_feedback_funct  

 %clear all
%user_number = 6;

%stan_tad_mat ADDED AS A GLOBAL - ALSO IN GUIMAIN_3.M BOTH IN OVERALL AND
%SUBFUNCTIONS
global user_number stan_tad_mat

main_nos_tad = zeros(1, (user_number .* 60) - 60) .* NaN;
 
load burst_data_matrix_2;

sum_mat = zeros(1,1);

eye_counter = 1;
eye_counter_2 = 1;

for eye_3 = stan_tad_mat

    for eye = 1:(user_number .* 60) - 60
    
        if burst_data_matrix_2(eye, 10) == eye_3
            
            main_nos_tad(eye_counter_2) = burst_data_matrix_2(eye, 10); 
            
            eye_counter_2 = eye_counter_2 + 1;
            
            if burst_data_matrix_2(eye, 12) > 0
                
                sum_mat(eye) = 1;
                
            else
                
                sum_mat(eye) = 0;
                
            end
            
        end
        
    end
    
    plot_mat(eye_counter) = sum(sum_mat);
    eye_counter = eye_counter + 1;
    
    clear sum_mat
    
end

new_tad_cetr = 1;

for search_tad = stan_tad_mat;
    
    length_matr = find(main_nos_tad == search_tad);
    
    plot_mat_3(new_tad_cetr) = length(length_matr);
    
    new_tad_cetr = new_tad_cetr + 1;
       
end

%stats for previous users

prev_user_1_5 = round((sum(plot_mat(1:5)) ./ sum(plot_mat_3(1:5))) .* 100);
prev_user_6_10 = round((sum(plot_mat(6:10)) ./ sum(plot_mat_3(1:5))) .* 100);
prev_user_11_15 = round((sum(plot_mat(11:12)) ./ sum(plot_mat_3(11:12))) .* 100);
prev_user_16_20 = round((sum(plot_mat(13:15)) ./ sum(plot_mat_3(13:15))) .* 100);

%repeat everything for this user

clear sum_mat main_nos_tad

sum_mat = zeros(1,1);

main_nos_tad = zeros(1, 60) .* NaN;

eye_counter = 1;
eye_counter_2 = 1;

for eye_3 = stan_tad_mat

    for eye = ((user_number .* 60) - 60) + 1:user_number .* 60
    
        if burst_data_matrix_2(eye, 10) == eye_3
            
            main_nos_tad(eye_counter_2) = burst_data_matrix_2(eye, 10); 
            
            eye_counter_2 = eye_counter_2 + 1;
            
            if burst_data_matrix_2(eye, 12) > 0
                
                sum_mat(eye) = 1;
                
            else
                
                sum_mat(eye) = 0;
                
            end
            
        end
        
    end
    
    plot_mat(eye_counter) = sum(sum_mat);
    eye_counter = eye_counter + 1; 
  
    clear sum_mat
    
end

new_tad_cetr = 1;

for search_tad = stan_tad_mat
    
    length_matr = find(main_nos_tad == search_tad);
    
    plot_mat_3(new_tad_cetr) = length(length_matr);
    
    new_tad_cetr = new_tad_cetr + 1;
       
end

%stats for this user

prev_user_1_5_2 = round((sum(plot_mat(1:5)) ./ sum(plot_mat_3(1:5))) .* 100);
prev_user_6_10_2 = round((sum(plot_mat(6:10)) ./ sum(plot_mat_3(6:10))) .* 100);
prev_user_11_15_2 = round((sum(plot_mat(11:12)) ./ sum(plot_mat_3(11:12))) .* 100);
prev_user_16_20_2 = round((sum(plot_mat(13:15)) ./ sum(plot_mat_3(13:15))) .* 100);







            
            
            
            
        
        