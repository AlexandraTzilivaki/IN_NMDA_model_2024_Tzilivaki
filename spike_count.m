
function  [number_of_spikes, spike_timing]= spike_count (data)
    c=data; % ta data einai numbers.... 
    %Find values above zero
    a=find(c>0);
    classic_meter=0;
    spike_timing_all = [];
    for k=1:length(a)
        lala=a(k);
        if lala==1 
            continue
        elseif c(lala-1)<0
            classic_meter=classic_meter+1;
            %Find were spike ends
            b=find(c((lala+1):length(c))<0, 1, 'first');
            %And then its max value
            d=max(c(lala:lala+b));
            %Find the time point of the max value
            e=find(c(lala:lala+b)==d,1,'first');
            %Align to original time point
            f=lala+e-1;
            if size(f, 1)==0
                break
            end
            %And keep all values
            spike_timing_all(classic_meter)=f;
        end
    end
  
    number_of_spikes=size(spike_timing_all,2); 
    spike_timing=spike_timing_all;
   
end










