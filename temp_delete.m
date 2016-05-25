clear all

load burst_data_matrix_2;

eye_counter = 1;

for eye_3 = [1 5 10 15 20 25 30 35 40 50 60 70 80 90 100]
    
    
%     eye_counter_2 = 16; %delete
    
    
    for eye = 421:1080
        
        
        
        
%         %-------------------------------
%         if eye == eye_counter_2 
%             
%             eye = eye + 45;             %delete all
%             eye_counter_2 = eye_counter_2 + 60;
%             
%         end
        %-------------------------------
            
            
            
    
        if burst_data_matrix_2(eye, 10) == eye_3
            
            if burst_data_matrix_2(eye, 12) > 0
                
                sum_mat(eye) = 1;%burst_data_matrix_2(eye, 11);%= 1;%burst_data_matrix_2(eye, 12);
                
            else
                
                sum_mat(eye) = 0;
                
            end
            
        end
        
    end
    
    plot_mat(eye_counter) = sum(sum_mat);
    eye_counter = eye_counter + 1; 
  
    clear sum_mat
   
end

plot_mat_x = [1 5 10 15 20 25 30 35 40 50 60 70 80 90 100];

plot(plot_mat_x, plot_mat, 'ko-')
            
            
            
            
        
        