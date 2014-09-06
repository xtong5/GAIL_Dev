
% Jagadeeswaran.R, jrathin1@iit.edu
%
% Windows8, Matlab 7.10.0 (R2010a)

% EXAMPLE 3: A is diagonal, singular and indefinite.
h = 1;  a = -20; b = -a; n = 2*b/h + 1;
A = spdiags((a:h:b)', 0, n, n);
b = ones(n,1);  rtol   = 1e-9;    shift = 0;    maxxnorm = 1e2;
M = [];         Acondlim = [];    show  = true;

tic
x = minresqlp(A,b,rtol,N,M,shift,maxxnorm,Acondlim,show);
time=toc

%>>JagadeesHW2
% Enter minresqlp.  Min-length solution of symmetric (A-sI)x = b or min ||(A-sI)x - b||
% n      =     41   ||b||    =6.403e+000   shift    =0.000e+000   rtol     =1.000e-009
% maxit  =   2500   maxxnorm =1.000e+002   Acondlim =1.000e+015   TranCond =1.000e+000
% precon =      0
%
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
% P      0  6.40e+000  7.58e+001  1.00e+000  1.00e+000  0.00e+000  1.00e+000  0.00e+000
%        1  6.40e+000  7.58e+001  1.00e+000  7.46e-001  1.18e+001  1.00e+000  2.54e-018
%        2  4.27e+000  3.30e+001  3.82e-001  4.47e-001  1.59e+001  1.34e+000  3.01e-001
%        3  4.27e+000  3.30e+001  3.67e-001  4.47e-001  1.73e+001  2.24e+000  3.01e-001
%        4  3.41e+000  2.10e+001  2.45e-001  3.55e-001  1.73e+001  1.47e+000  4.36e-001
%        5  3.41e+000  2.10e+001  2.45e-001  3.55e-001  1.73e+001  2.82e+000  4.36e-001
%        6  2.92e+000  1.53e+001  1.85e-001  3.02e-001  1.73e+001  1.77e+000  5.40e-001
%        7  2.92e+000  1.53e+001  1.85e-001  3.02e-001  1.73e+001  3.31e+000  5.40e-001
%        8  2.59e+000  1.20e+001  1.50e-001  2.67e-001  1.73e+001  2.04e+000  6.29e-001
%        9  2.59e+000  1.20e+001  1.50e-001  2.67e-001  1.73e+001  3.75e+000  6.29e-001
%       10  2.35e+000  9.78e+000  1.26e-001  2.40e-001  1.73e+001  2.28e+000  7.08e-001
%       11  2.35e+000  9.78e+000  1.26e-001  2.40e-001  1.73e+001  4.16e+000  7.08e-001
%       12  2.16e+000  8.22e+000  1.09e-001  2.19e-001  1.73e+001  2.52e+000  7.79e-001
%       13  2.16e+000  8.22e+000  1.09e-001  2.19e-001  1.73e+001  4.56e+000  7.79e-001
%       14  2.01e+000  7.04e+000  9.56e-002  2.02e-001  1.73e+001  2.74e+000  8.46e-001
%       15  2.01e+000  7.04e+000  9.56e-002  2.02e-001  1.73e+001  4.95e+000  8.46e-001
%       16  1.89e+000  6.12e+000  8.52e-002  1.87e-001  1.73e+001  2.97e+000  9.10e-001
%       17  1.89e+000  6.12e+000  8.52e-002  1.87e-001  1.73e+001  5.34e+000  9.10e-001
%       18  1.78e+000  5.37e+000  7.67e-002  1.74e-001  1.73e+001  3.19e+000  9.71e-001
%       19  1.78e+000  5.37e+000  7.67e-002  1.74e-001  1.73e+001  5.74e+000  9.71e-001
%       20  1.69e+000  4.74e+000  6.97e-002  1.63e-001  1.73e+001  3.43e+000  1.03e+000
%
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
%       21  1.69e+000  4.74e+000  6.97e-002  1.63e-001  1.73e+001  6.15e+000  1.03e+000
%       22  1.60e+000  4.21e+000  6.36e-002  1.52e-001  1.73e+001  3.68e+000  1.09e+000
%       23  1.60e+000  4.21e+000  6.36e-002  1.52e-001  1.73e+001  6.60e+000  1.09e+000
%       24  1.53e+000  3.74e+000  5.84e-002  1.41e-001  1.73e+001  3.94e+000  1.14e+000
%       25  1.53e+000  3.74e+000  5.84e-002  1.41e-001  1.73e+001  7.08e+000  1.14e+000
%       26  1.46e+000  3.33e+000  5.38e-002  1.31e-001  1.73e+001  4.23e+000  1.20e+000
%       27  1.46e+000  3.33e+000  5.38e-002  1.31e-001  1.73e+001  7.61e+000  1.20e+000
%       28  1.40e+000  2.95e+000  4.96e-002  1.22e-001  1.73e+001  4.56e+000  1.26e+000
%       29  1.40e+000  2.95e+000  4.96e-002  1.22e-001  1.73e+001  8.22e+000  1.26e+000
%       30  1.34e+000  2.59e+000  4.58e-002  1.12e-001  1.73e+001  4.94e+000  1.32e+000
%       31  1.34e+000  2.59e+000  4.58e-002  1.12e-001  1.73e+001  8.94e+000  1.32e+000
%       32  1.28e+000  2.26e+000  4.23e-002  1.02e-001  1.73e+001  5.40e+000  1.38e+000
%       33  1.28e+000  2.26e+000  4.23e-002  1.02e-001  1.73e+001  9.84e+000  1.38e+000
%       34  1.23e+000  1.92e+000  3.90e-002  9.06e-002  1.73e+001  5.99e+000  1.45e+000
%       35  1.23e+000  1.92e+000  3.90e-002  9.06e-002  1.73e+001  1.10e+001  1.45e+000
%       36  1.17e+000  1.57e+000  3.56e-002  7.77e-002  1.73e+001  6.82e+000  1.52e+000
%       37  1.17e+000  1.57e+000  3.56e-002  7.77e-002  1.73e+001  1.29e+001  1.52e+000
%       38  1.10e+000  1.15e+000  3.21e-002  6.02e-002  1.73e+001  8.22e+000  1.62e+000
%       39  1.10e+000  1.15e+000  3.21e-002  6.02e-002  1.73e+001  1.66e+001  1.62e+000
%       40  1.00e+000  5.57e-005  2.68e-002  3.22e-006  1.73e+001  1.21e+001  1.79e+000
%
%     iter     rnorm     Arnorm   Compatible     LS        Anorm      Acond      xnorm
%       41  1.00e+000  5.57e-005  2.68e-002  2.77e-006  1.73e+001  3.11e+005  1.79e+000
%       42  1.00e+000  2.80e-008  2.36e-002  1.39e-009  2.01e+001  3.24e+002  1.79e+000
%       43  1.00e+000  5.85e-008  2.36e-002  2.13e-009  2.01e+001  7.18e+008  1.79e+000
%       44  1.00e+000  5.18e-008D 1.80e-002  1.88e-009D 2.75e+001  8.21e+007  1.79e+000
% 
% 
% Exit minresqlp.   flag  =      6   xnorm has exceeded maxxnorm                            
% Exit minresqlp.   iter  =     44   (MINRES     -1, MINRES-QLP     45)
% Exit minresqlp.   rnorm = 1.0000e+000     rnorm  direct = 1.0000e+000
% Exit minresqlp.                           Arnorm direct = 5.1850e-008
%Exit minresqlp.   xnorm = 1.7867e+000     xnorm  direct = 1.7867e+000
%Exit minresqlp.   Anorm = 2.7533e+001     Acond         = 8.2082e+007
% 
% time =
% 
%     0.0300

% 
%%Suggestion for improvement:
% More comments (but brief and meaningful) can be added to explain the code
% If there is a brief 'Pseudo code Explaining the algorithm in the
% comment', it will make the code more understandable.
% Moreover use readable Variable name exactly as given in the algorithm (If not followed already).