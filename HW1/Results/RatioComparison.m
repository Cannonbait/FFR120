% -------------------------------------------------------------------
%  Generated by MATLAB on 17-Nov-2016 20:26:03
%  MATLAB version: 9.0.0.341360 (R2016a)
% -------------------------------------------------------------------
clear;
clc;

numberOfTrials = 10;
infectionRates = [0.1 0.2];

statistics = ...
  [100 97.9 99.2;
  50 84.8 86.6;
  33.333333333333336 78.1 42.4;
  25 60.7 8.5;
  20 23.8 6.1;
  16.666666666666668 16.2 2.1;
  14.285714285714286 3.3 1.4;
  12.5 4.8 2.8;
  11.111111111111111 2.6 4.1;
  10 4.9 2.3];
 
plot(statistics(:,1), statistics(:,2), statistics(:,1),statistics(:,3));
legend('0.1 infection rate', '0.2 infection rate');
xlabel(sprintf('\\beta/\\gamma'));
ylabel('Average R');
title(sprintf('Average R over 10 trials different ratios of \\beta/\\gamma'));