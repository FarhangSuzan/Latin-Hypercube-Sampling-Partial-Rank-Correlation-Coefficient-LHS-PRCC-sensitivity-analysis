%% The results should be compared to the PRCC results section in
%% Supplementary Material D and Table D.1 for different N (specified by
%% "runs" in the script below
clear variables;
close all;

if exist('Model_LHS_10000_Aug2120','file')~=0
    resp = input('This file already exists, rerun? Y/N\n','s');
    if strcmpi(resp,'Y')
        run_sims=1;
    else
        run_sims=0;
    end
else
    run_sims = 1;
end

if run_sims

    %% Sample size N
    runs=10000;

    %% LHS MATRIX  %%
    Parameter_settings_LHS;

    fprintf('Setting random parameters...\n');
    alpha1_LHS=LHS_Call(0.0000001, params.alpha1, 0.00001, 0, runs,'unif');
    gammav_LHS=LHS_Call(0.01, params.gammav, 0.5, 0, runs,'unif');
    mu2_LHS=LHS_Call(0.001, params.mu2, 0.09, 0, runs,'unif');
    gammat_LHS=LHS_Call(0.001, params.gammat, 0.09, 0, runs,'unif');
    mu3_LHS=LHS_Call(1, params.mu3, 5, 0, runs,'unif');
    gammaf_LHS= LHS_Call(0.01 , params.gammaf , 0.2 , 0 , runs , 'unif');
    alpha3_LHS=LHS_Call(0.0001,params.alpha3,0.008, 3,runs,'unif'); 
    mu4_LHS=LHS_Call(0.01,params.mu4,5, 0 ,runs,'unif'); 
    gammai_LHS=LHS_Call(0.00001, params.gammai, 0.005, 0, runs,'unif');
    alpha4_LHS=LHS_Call(0.00001,params.alpha4,0.001, 0 ,runs,'unif'); 
    mu5_LHS=LHS_Call(0.001,params.mu5,0.1, 0 ,runs,'unif');  
    alpha5_LHS=LHS_Call(0.001,params.alpha5,0.5, 0 ,runs,'unif');
    Si_LHS=LHS_Call(10,params.Si,0.5, 5000 ,runs,'unif');
    gammab_LHS=LHS_Call(0.001,params.gammab,0.1, 0 ,runs,'unif'); 
    mu6_LHS=LHS_Call(1,params.mu6,15, 0 ,runs,'unif'); 
    gammaa_LHS=LHS_Call(0.0001,params.gammaa,0.1, 0 ,runs,'unif'); 
    alpha6_LHS=LHS_Call(0.00000001,params.alpha6,0.000005, 0,runs,'unif');
    mu7_LHS=LHS_Call(0.0001,params.mu7,0.01, 0 ,runs,'unif'); 
    alpha7_LHS=LHS_Call(0.001,params.alpha7,0.2, 0 ,runs,'unif');
    Sf_LHS=LHS_Call(10,params.Sf,2000, 0 ,runs,'unif');
    gammac_LHS=LHS_Call(0.001,params.gammac,0.1, 0 ,runs,'unif'); 
    fprintf('Random parameters set...\n');

    %% LHS MATRIX and PARAMETER LABELS
    LHSmatrix=[alpha1_LHS gammav_LHS mu2_LHS gammat_LHS mu3_LHS gammaf_LHS alpha3_LHS mu4_LHS gammai_LHS alpha4_LHS...
                  mu5_LHS alpha5_LHS Si_LHS gammab_LHS mu6_LHS gammaa_LHS alpha6_LHS mu7_LHS alpha7_LHS Sf_LHS gammac_LHS];
    tic
    parfor x=1:runs %Run solution x times choosing different values
        f=@ODE_LHS;
        fprintf('Running simulation for parameter set %i...\n',x);
    %     LHSmatrix(x,:)
%         y0 = [params.N-LHSmatrix(x,end);0;0;0;0;0;0;0;0;0;LHSmatrix(x,end);0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
%         y0 = y0/params.N0;
        odeopts = odeset('NonNegative',1,'RelTol',1e-8,'AbsTol',1e-9);
        [t,y]=ode23t(@(t,y)f(t,y,LHSmatrix,x,runs),tspan,y0,odeopts);
       % It=sum(y(:,11:14)')';
          It1=y(:, 2);%T
          It2=y(:, 3);%F
          It3=y(:, 4);%I
          It4=y(:, 5);%B
          It5=y(:, 6);%A
          It6=y(:, 7);%C
        %T
        max_spot1=find(It1==max(It1));
        peak_val1(x) = It1(max_spot1);
        %F
        max_spot2=find(It2==max(It2));
        peak_val2(x) = It2(max_spot2);
        %I
        max_spot3=find(It3==max(It3));
        peak_val3(x) = It3(max_spot3);
        %B
        max_spot4=find(It4==max(It4));
        peak_val4(x) = It4(max_spot4);
        %A
        max_spot5=find(It5==max(It5));
        peak_val5(x) = It5(max_spot5);
        %C
        max_spot6=find(It6==max(It6));
        peak_val6(x) = It6(max_spot6);
        %peak_time(x) = t(max_spot);
        Z=[t y]; % [time y]
        %% Save the outputs at ALL time points [tspan]
        %T_lhs(:,x)=Anew(:,1);
        %CD4_lhs(:,x)=Anew(:,2);
        %T1_lhs(:,x)=Anew(:,3);
        %T2_lhs(:,x)=Anew(:,4);
        %V_lhs(:,x)=Anew(:,5);

        %% Save only the outputs at the time points of interest [time_points]:
        %% MORE EFFICIENT
        time(:,x) = Z(time_points+1,1);
        V(:,x) = Z(time_points+1,2);
        T(:,x) = Z(time_points+1,3);
        F(:,x) = Z(time_points+1,4);
        I(:,x) = Z(time_points+1,5);
        B(:,x) = Z(time_points+1,6);
        A(:,x) = Z(time_points+1,7);
        C(:,x) = Z(time_points+1,8);

    end
    time_end = toc;
    fprintf('Simulations completed in %3.2fs...\n',time_end);
    %% Save the workspace
    save Model_LHS.mat;
end

