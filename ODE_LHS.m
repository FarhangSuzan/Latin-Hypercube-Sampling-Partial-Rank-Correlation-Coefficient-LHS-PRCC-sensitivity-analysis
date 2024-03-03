function dy=covidmodel(t,y,LHSmatrix,x,runs)
%% PARAMETERS %%
Parameter_settings_LHS;

params.alpha1=LHSmatrix(x,1);
params.gammav=LHSmatrix(x,2);%Chosen
params.mu2=LHSmatrix(x,3);
params.gammat=LHSmatrix(x,4);
params.mu3=LHSmatrix(x,5);
params.gammaf=LHSmatrix(x,6);
params.alpha3=LHSmatrix(x,7);
params.mu4=LHSmatrix(x,8);
params.gammai=LHSmatrix(x,9);
params.alpha4=LHSmatrix(x,10);
params.mu5=LHSmatrix(x,11);
params.alpha5=LHSmatrix(x,12);
params.Si=LHSmatrix(x,13);
params.gammab=LHSmatrix(x,14);
params.mu6=LHSmatrix(x,15);
params.gammaa=LHSmatrix(x,16);
params.alpha6=LHSmatrix(x,17);
params.mu7=LHSmatrix(x,18);
params.alpha7=LHSmatrix(x,19);
params.Sf=LHSmatrix(x,20);
params.gammac=LHSmatrix(x,21);
%params.Sf=LHSmatrix(x,16);



dy = zeros(7,1);
        
V = y(1);
T = y(2);
F = y(3);
I = y(4);
B = y(5);
A = y(6);
C = y(7);


               
        dy(1) = -params.alpha1*V*A-params.gammav*V;
        dy(2) = params.mu2*V-params.gammat*T;
        dy(3) = params.mu3*T-params.gammaf*F-params.alpha3*F*C;
        dy(4) = params.mu4*T-params.gammai*I-params.alpha4*I*B;
        dy(5) = params.mu5*T+params.alpha5*(I/(params.Si+I))*B-params.gammab*B;
        dy(6) = params.mu6*B-params.gammaa*A-params.alpha6*A*V;
        dy(7) = params.mu7*V+params.alpha7*(F/(params.Sf+F))*C-params.gammac*C;
end