%% LineNetwork

% Script

mainTestCases:
- Cases according to proof of Lemma 3.1
- Numerical solutions are plotted

mainComparisonApproxExactCase1i:
- Numerical solutions (3 methods) are plotted together with exact solution
- Densities are written to csv. files 'Case1iroad1.csv' and 'Case1iroad2.csv'
- Error in Linf, L1, L2 norm -> 'L1_error.csv'
- Order estimat stepwise and mean -> 'L1_order_stepwise.csv' and 'L1_order.csv'

mainComparisonApproxExactCase2ii:
- Numerical solutions are plotted together with exact solution
- Density of road 2 and buffer loas are written to 'Case2road2.csv' and 'Case2r2.csv'


% Important functions

num_sol: 
- Calculate the numerical solution, method can be indicated

error_calculation:
- Calculate the error dependent on the indicated norm

error_calculation_Case2
- Calculate the error dependent on the indicated norm

