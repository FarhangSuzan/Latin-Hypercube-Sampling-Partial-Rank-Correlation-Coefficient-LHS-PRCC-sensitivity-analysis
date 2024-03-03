close all
clear variables

file_to_load = 0;
%0 - 3000 data point file on Aug 21

alpha = 0.05;

switch file_to_load
    case 0
        file_title='prcc_Model_LHS';
        load([file_title(6:end),'.mat']);
        
end

% CALCULATE PRCC for T
%[prcc{1},sign{1},sign_label{1}]=PRCC(LHSmatrix,T,1:length(time_points),PRCC_var,alpha);
[prcc{1},sign{1},sign_label{1}]=PRCC(LHSmatrix,peak_val1,1,PRCC_var,alpha);
% CALCULATE PRCC for F
[prcc{2},sign{2},sign_label{2}]=PRCC(LHSmatrix,peak_val2,1,PRCC_var,alpha);
% CALCULATE PRCC for I
[prcc{3},sign{3},sign_label{3}]=PRCC(LHSmatrix,peak_val3,1,PRCC_var,alpha);
% CALCULATE PRCC for B
[prcc{4},sign{4},sign_label{4}]=PRCC(LHSmatrix,peak_val4,1,PRCC_var,alpha);
% CALCULATE PRCC for A
[prcc{5},sign{5},sign_label{5}]=PRCC(LHSmatrix,peak_val5,1,PRCC_var,alpha);
% CALCULATE PRCC for C
[prcc{6},sign{6},sign_label{6}]=PRCC(LHSmatrix,peak_val6,1,PRCC_var,alpha);

% file_title=strcat(file_title,'-',strrep(strrep(datestr(clock),':','-'),' ','-'),'.mat');
save(file_title,'prcc','sign','sign_label','PRCC_var');

