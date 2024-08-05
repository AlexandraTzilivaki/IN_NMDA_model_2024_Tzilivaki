#!/bin/bash

for a in $(seq 0 64);do

		
 	export LPARAMS=" -c dendrite=${a}"  
 ./x86_64/special -nogui  $LPARAMS IO.hoc &
	



done

