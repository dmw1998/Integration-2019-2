load result_of_midpoint.mat
T = table(result);
filename = 'result_for_P2.xlsx';
writetable(T,filename,'Sheet',1,'Range','A1');

load  result_of_simpson.mat
T = table(result);
filename = 'result_for_P2.xlsx';
writetable(T,filename,'Sheet',1,'Range','E1');
