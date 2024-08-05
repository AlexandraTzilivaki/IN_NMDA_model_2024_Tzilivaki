
NEURON {
	POINT_PROCESS myNMDA
	RANGE e, i, gmax, g
	RANGE tau_r
	RANGE tau_d
	RANGE dist :distance from the soma
	RANGE ndist :normalized distance from the soma
	RANGE factor
	RANGE tsyn,mg,mggate,gamma,v_shft
	GLOBAL mg_dep
	
	NONSPECIFIC_CURRENT i
}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(uS) = (microsiemens)
}

:the values below are default and might change in the mod files
PARAMETER {
	
	:COMMENT
	:must be defined in the PARAMETERS section in the mod files.
	:e = 0			(mV)	
	:tau_r = 0	 	(ms) 	
	:tau_d = 0		(ms) 
	:mg			(mM)	
	:v_shft = 0 :positive shift will slide the curve to the right
	:gamma = 0.062 :from Jahr and Stevens but modified to 0.082 by Rodes 2006
	:ENDCOMMENT
	dist
	factor
	gmax
	tsyn

	mggate
	Vtrg = -60
	:the default is that there is not homeostasis with such a high time constant
	mg_dep = 3.57
}
PARAMETER {
	tau_r = 8 
	tau_d = 35
	:for NMDA synapses the parameters below should be redifined here.
	e = 0
	mg = 1
	gamma = 0.11 :0.082 ://rhodes et al., 2006 0.15 
	v_shft = 32 :50 14 chnge check 32 default
}

ASSIGNED {
	v (mV)
	i (nA)
	g (uS)
}

STATE {
	A
	B
}

FUNCTION get_factor(tau_fast,tau_slow){
	LOCAL tp
	tp = (tau_fast*tau_slow)/(tau_slow - tau_fast) * log(tau_slow/tau_fast)
	get_factor = -exp(-tp/tau_fast) + exp(-tp/tau_slow)
	get_factor = 1/get_factor
}
:the values below are default and might change in the mod files
INITIAL {
	:start fresh
	A = 0
	B = 0
	g = 0
	tsyn = -1e80 			:last time the synapse was active is very long ego
	if(tau_r/tau_d>0.999){
		tau_r = tau_d*0.999
	}
	if(!tau_r || !tau_d){
		printf("User must set tau_r and tau_d (zero by default)")
	}
	factor = get_factor(tau_r,tau_d)
}

BREAKPOINT {
	SOLVE state METHOD cnexp
	:see Jahr & Stevens, J. Neurosci 10: 1830-1837, 1990;
	:Jahr & Stevens, J. Neurosci 10: 3178-3182, 1990
	: from Jahr & Stevens
	mggate = 1 / (1 + exp( gamma *  -(v+v_shft)) * (mg / mg_dep))
	g = (B - A)*mggate
	i = g*(v - e)
}


DERIVATIVE state {
	A' = -A/tau_r
	B' = -B/tau_d
}


PROCEDURE EPSP(w){
	A = A + w*factor
	B = B + w*factor
}


NET_RECEIVE(w) {
	EPSP(w): finally trigger an epsp
}
