#!/bin/bash

for a in $(seq 0 69);do
for b in $(seq 0 4);do
		
 	export LPARAMS=" -c runs=${a} -c trials=${b}"  
 ./x86_64/special -nogui  $LPARAMS experiment_with_gap.hoc &
	


done
done

