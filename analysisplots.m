experiment = "ampaboostmoresynsno_gap"; % Change this as needed
synapses =1:1:70;      % Number of synaptic inputs in random dendrites
cells = 0:14;           % Number of cells in the syngitium
trials = 0:4;           % Number of trials

number_of_spikes_ampaboostmoresynsno_gap = cell(length(synapses), length(cells));
spike_timing_ampaboostmoresynsno_gap = cell(length(synapses), length(cells));

for syns = 1:length(synapses)
    for ncell = 1:length(cells)
        number_of_spikes_per_trial = zeros(1, length(trials));
        spike_timing_per_trial = cell(1, length(trials));
        
        for trial = 1:length(trials)
            file_path = sprintf('DATA/GAP/%s/%d_syns/trial_%d/soma_%d.dat', experiment, synapses(syns), trials(trial), cells(ncell));
            ampaboostmoresynsno_gap = load(file_path);
            [number_of_spikes_per_trial(trial), spike_timing_per_trial{trial}] = spike_count(ampaboostmoresynsno_gap);
        end
        
        % Store data for each cell and synapse
        number_of_spikes_ampaboostmoresynsno_gap{syns, ncell} = number_of_spikes_per_trial;
        spike_timing_ampaboostmoresynsno_gap{syns, ncell} = spike_timing_per_trial;
    end
end

% Calculate mean number of spikes for every synapse for every cell for the five trials
mean_spikes_per_synapse_per_cell_ampaboostmoresynsno_gap = cellfun(@(x) mean(x), number_of_spikes_ampaboostmoresynsno_gap);

% Calculate mean of spikes for all cells for every synapse
mean_spikes_all_cells_ampaboostmoresynsno_gap = mean(mean_spikes_per_synapse_per_cell_ampaboostmoresynsno_gap, 2);
std_spikes_all_cells_ampaboostmoresynsno_gap=std(mean_spikes_per_synapse_per_cell_ampaboostmoresynsno_gap');


