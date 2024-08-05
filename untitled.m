figure('PaperPosition',[0 0 6 4], 'PaperSize', [6 4]);
 errorbar(synapses,mean_spikes_all_cells_no_gap,std_spikes_all_cells_no_gap,'-g','Linewidth', 2, 'MarkerSize', 10)
 hold on;
 errorbar(synapses,mean_spikes_all_cells_nonmda,std_spikes_all_cells_nonmda,'-r','Linewidth', 2, 'MarkerSize', 10)
 hold on;
 errorbar(synapses,mean_spikes_all_cells_control,std_spikes_all_cells_control,'-b','Linewidth', 2, 'MarkerSize', 10)
  hold on;
 errorbar(synapses,mean_spikes_all_cells_ttxdends,std_spikes_all_cells_ttxdends,'-k','Linewidth', 2, 'MarkerSize', 10)
  hold on;
 errorbar(synapses,mean_spikes_all_cells_ampaboost,std_spikes_all_cells_ampaboost,'-c','Linewidth', 2, 'MarkerSize', 10)
 hold on;
 errorbar(synapses,mean_spikes_all_cells_gapup,std_spikes_all_cells_gapup,'-m','Linewidth', 2, 'MarkerSize', 10)
hold on;
 errorbar(synapses,mean_spikes_all_cells_gapdown,std_spikes_all_cells_gapdown,'-y','Linewidth', 2, 'MarkerSize', 10)

 xlabel('Number of Synapses', 'FontSize', 14)
  ylabel('Hz', 'FontSize', 14)
 legend({ 'GJs block','No NMDA','Control','TTX in dends', 'AMPA boost','Gap up','Gap down'})
 xlim([10 30])
 ylim([0 60])
 
 set(gca, 'FontSize', 12)
 
%  close all

errorbar(synapses,mean_spikes_all_cells_ampaboostmoresyns,std_spikes_all_cells_ampaboostmoresyns,'-m','Linewidth', 2, 'MarkerSize', 10)
hold on;
 errorbar(synapses,mean_spikes_all_cells_ampaboostmoresynsno_gap,std_spikes_all_cells_ampaboostmoresynsno_gap,'-y','Linewidth', 2, 'MarkerSize', 10)
