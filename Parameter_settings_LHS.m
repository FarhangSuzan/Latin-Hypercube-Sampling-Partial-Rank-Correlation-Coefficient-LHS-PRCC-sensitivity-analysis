% PARAMETER BASELINE VALUES
params.alpha1=0.000001;
params.gammav=0.2;
params.mu2=0.035;
params.gammat=0.055;
params.mu3=2.55;
params.gammaf=0.13;
params.alpha3=0.006;
params.mu4=1.3;
params.gammai=0.0008;
params.alpha4=0.0001;
params.mu5=0.02;
params.alpha5=0.05;
params.gammab=0.06;
params.mu6=7;
params.gammaa=0.06;
params.alpha6=0.0000001;
params.mu7=0.002;
params.alpha7=0.09;
params.gammac=0.01;
params.Si=1000;
params.Sf=600;


% Parameter Labels 
PRCC_var={'\alpha_1','\gamma_v','\mu_2','\gamma_t', '\mu_3','\gamma_f', '\alpha_3','\mu_4', '\gamma_i','\alpha_4',...
    '\mu_5','\alpha_5','S_i','\gamma_b', '\mu_6','\gamma_a','\alpha_6','\mu_7', '\alpha_7','S_f','\gamma_c'};% 

%% TIME SPAN OF THE SIMULATION
t_end=3*365; % length of the simulations
tspan=(0:1:t_end);   % time points where the output is calculated
time_points=[round(t_end/2) t_end]; % time points of interest for the US analysis

% INITIAL CONDITION FOR THE ODE MODEL       
y0 = [1000;0;0;0;0;0;0];

% Variables Labels
y_var_label={'V';'T';'F';'I';'B';'A';'C'};
