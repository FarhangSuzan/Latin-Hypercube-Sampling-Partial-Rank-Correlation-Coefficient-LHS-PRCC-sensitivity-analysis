# Latin Hypercube Sampling (LHS)/Partial Rank Correlation Coefficient(PRCC) 
## Global Sensitivity Analysis

Latin Hypercube Sampling (LHS) combined with the Partial Rank Correlation Coefficient (PRCC) is a statistical method used for performing sensitivity analysis, which evaluates how variations in input variables of a model influence its output. The Partial Rank Correlation Coefficient (PRCC) method is particularly effective for models exhibiting a monotonic relationship between inputs and outputs. This means that as the input increases or decreases, the output consistently moves in one direction (either increasing or decreasing), which is a hallmark of monotonic behaviour. PRCC is well-suited for assessing the strength and direction of these monotonic relationships in models that may be non-linear. It is not typically used for non-monotonic models, where the relationship between inputs and outputs changes direction.

Therefore, PRCC, used in conjunction with Latin Hypercube Sampling (LHS), is an effective approach for sensitivity analysis in models exhibiting monotonic behaviour between inputs and outputs. This method is particularly useful for non-linear models, where traditional linear sensitivity analysis methods may not provide accurate insights. In contrast, methods like EFAST and Sobol are designed to handle both linear and non-linear relationships, including non-monotonic interactions, by analyzing the model's behaviour over its entire parameter space.

To conduct the PRCC analysis, update your model and parameters within "ODE_LHS.m" and "Parameter_settings_LHS.m" respectively, and then execute the following MATLAB scripts in order: 

1-"Model_LHS.m", 
2-"run_prcc.m", 
and 3-"plot_prcc.m".  

# Support
For further support, please reach out to [Suzan Farhang-Sardroodi](https://www.suzanfarhangsardroodi.com/).

# Citation

Please cite 

[Farhang-Sardroodi, Suzan, Chapin S. Korosec, Samaneh Gholami, Morgan Craig, Iain R. Moyles, Mohammad Sajjad Ghaemi, Hsu Kiang Ooi, and Jane M. Heffernan. "Analysis of host immunological response of adenovirus-based COVID-19 vaccines." Vaccines 9, no. 8 (2021): 861.](https://doi.org/10.3390/vaccines9080861). 

or this page: [https://github.com/FarhangSuzan](https://github.com/FarhangSuzan).
