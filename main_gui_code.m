global age sex hour minute month day user_number first_row       

rand_mat_tad(1,:) = randperm(3); %3 is the number of different simulation types, a particular one run at random when a user logs on.
%sim_no = rand_mat_tad(1);
sim_no = 3;

gui_close_cntr = 1;
load burst_data_matrix

if sim_no == 1 %this is the 'unif random training' testing regime.%at present, the number of presentations in sim_no 1, 2 and 3 should be the same to maintain data structure.
    
    sub_choice_perm = randperm(100); %100 is here becuase provisionally we are going for a range of numbers of tadpoles between 1 and 100.
    no_tad_subp = sub_choice_perm(1:45); %45 here because we 45 individuals runs
    
    for sim_no_tad_cntr = no_tad_subp
        
        train_test = 1;
    
        n = sim_no_tad_cntr;
        
        %dbstop in burst
        
        %calling the function
        
        [clickcount, t] = GUIshoal2dv5_4(n);
        
        %writing data to data matrix
       
        burst_data_matrix(first_row, :) = [user_number sex age hour minute month day sim_no train_test n clickcount t];
        
        %ensures if no object is hit, time  = 0
        
        if gui_close_cntr > 1
        
            if ismember(burst_data_matrix(first_row, 12), burst_data_matrix(((user_number .* 60) - 60) + 1 : first_row - 1, 12))
                  
                   burst_data_matrix(first_row, 12) = 0;
                   
            end
        
        end
 
        first_row = first_row + 1;
       
       %add write to matrix statement here
        
       %close the second gui 
       
       if gui_close_cntr == 1
        
            close GUIMAIN_2
        
        end
        
        gui_close_cntr = gui_close_cntr + 1;
        
        %clear xy C GotOne clickcount trial trials t 
        
        %close all
        
    end
    
    %the 'standard' test presentations
    
    stan_tad_mat = [1 3 5 10 15 20 25 30 40 50 60 70 80 90 100]; %the numbers of tads you want presented as standard 
    randperm_tad_1 = randperm(15);
    
    for standard_tad_ctr = randperm_tad_1 %change if more standard presentations are made.
        
        train_test = 2;
        
        n = stan_tad_mat(standard_tad_ctr);
        
        [clickcount, t] = GUIshoal2dv5_4(n);
        
        burst_data_matrix(first_row, :) = [user_number sex age hour minute month day sim_no train_test n clickcount t];
        
        if ismember(burst_data_matrix(first_row, 12), burst_data_matrix(((user_number .* 60) - 60) + 1 : first_row - 1, 12))
              
               burst_data_matrix(first_row, 12) = 0;
               
        end
        
        first_row = first_row + 1;
        
        %add write to matrix statement here
        
    end

	save burst_data_matrix burst_data_matrix 
	
    %adding a screen that shows the simulation has finished
    
	h1_tad = plot(1,1,'o','markersize',5,'markeredgecolor',[0 0 0.0],'markerfacecolor',[0 0 0.0],'visible','off'); 
	axis ([-20 20 -20 20])
	axis square
	axis on
	box on
	set(gca,'xtick',[],'ytick',[])
	ht=text(0,0,({['\fontsize{30}The simulation is now finished.']; ['Thanks for taking part.']}),'color','r','horizontalalignment','center');

elseif sim_no == 2 %this is the 'normal random training' testing regime.%at present, the number of presentations in sim_no 1, 2 and 3 should be the same to maintain data structure.
    
    yeyyye = (randn(1,100) + 4) ./ 8;
    sub_choice_perm = ceil(yeyyye .* 100); %100 is here becuase provisionally we are going for a range of numbers of tadpoles between 1 and 100.
    no_tad_subp = sub_choice_perm(1:45); %45 here because we 45 individuals runs
    
    for sim_no_tad_cntr = no_tad_subp
        
        train_test = 1;
    
        n = sim_no_tad_cntr;
        
        %dbstop in burst
        
        [clickcount, t] = GUIshoal2dv5_4(n);
       
        burst_data_matrix(first_row, :) = [user_number sex age hour minute month day sim_no train_test n clickcount t];
        
        if gui_close_cntr > 1
        
            if ismember(burst_data_matrix(first_row, 12), burst_data_matrix(((user_number .* 60) - 60) + 1 : first_row - 1, 12))
                  
                   burst_data_matrix(first_row, 12) = 0;
                   
            end
        
        end
 
        first_row = first_row + 1;
       
       %add write to matrix statement here
        
        if gui_close_cntr == 1
        
            close GUIMAIN_2
        
        end
        
        gui_close_cntr = gui_close_cntr + 1;
        
        %clear xy C GotOne clickcount trial trials t 
        
        %close all
        
    end
    
    stan_tad_mat = [1 3 5 10 15 20 25 30 40 50 60 70 80 90 100]; %the numbers of tads you want presented as standard 
    randperm_tad_1 = randperm(15);
    
    for standard_tad_ctr = randperm_tad_1 %change if more standard presentations are made.
        
        train_test = 2;
        
        n = stan_tad_mat(standard_tad_ctr);
        
        [clickcount, t] = GUIshoal2dv5_4(n);
        
        burst_data_matrix(first_row, :) = [user_number sex age hour minute month day sim_no train_test n clickcount t];
        
        if ismember(burst_data_matrix(first_row, 12), burst_data_matrix(((user_number .* 60) - 60) + 1 : first_row - 1, 12))
              
               burst_data_matrix(first_row, 12) = 0;
               
        end
        
        first_row = first_row + 1;
        
        %add write to matrix statement here
        
    end

	save burst_data_matrix burst_data_matrix 
	
	h1_tad = plot(1,1,'o','markersize',5,'markeredgecolor',[0 0 0.0],'markerfacecolor',[0 0 0.0],'visible','off'); 
	axis ([-20 20 -20 20])
	axis square
	axis on
	box on
	set(gca,'xtick',[],'ytick',[])
	ht=text(0,0,({['\fontsize{30}The simulation is now finished.']; ['Thanks for taking part.']}),'color','r','horizontalalignment','center');

elseif sim_no == 3 %at present, the number of presentations in sim_no 1, 2 and 3 should be the same to maintain data structure.
    
    for eye_tad = 1:4
    
        stan_tad_mat = [1 3 5 10 15 20 25 30 40 50 60 70 80 90 100]; %the numbers of tads you want presented as standard 
        randperm_tad_1 = randperm(15);
        
        for standard_tad_ctr = randperm_tad_1 %change if more standard presentations are made.
            
            train_test = 2;
            
            n = stan_tad_mat(standard_tad_ctr);
            
            [clickcount, t] = GUIshoal2dv5_4(n);
            
            burst_data_matrix(first_row, :) = [user_number sex age hour minute month day sim_no train_test n clickcount t];
            
            if gui_close_cntr > 1
            
                if ismember(burst_data_matrix(first_row, 12), burst_data_matrix(((user_number .* 60) - 60) + 1 : first_row - 1, 12))
                      
                       burst_data_matrix(first_row, 12) = 0;
                       
                end
            
            end
            
            first_row = first_row + 1;
            
            if gui_close_cntr == 1
        
                close GUIMAIN_2
        
            end
            
            gui_close_cntr = gui_close_cntr + 1;
            
        end
    
    end
    
    save burst_data_matrix burst_data_matrix 
	
	h1_tad = plot(1,1,'o','markersize',5,'markeredgecolor',[0 0 0.0],'markerfacecolor',[0 0 0.0],'visible','off'); 
	axis ([-20 20 -20 20])
	axis square
	axis on
	box on
	set(gca,'xtick',[],'ytick',[])
	ht=text(0,0,({['\fontsize{30}The simulation is now finished.']; ['Thanks for taking part.']}),'color','r','horizontalalignment','center');
    
end

user_number = user_number + 1;
save user_number user_number;

clear all
    