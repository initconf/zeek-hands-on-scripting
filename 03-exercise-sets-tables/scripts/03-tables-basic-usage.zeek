module training; 

global services: table[port] of count ; 
global remote_hosts: table[addr] of count; 

event new_connection(c: connection)
    {
	
	local orig=c$id$orig_h ;
	local resp=c$id$resp_h ;
	local service=c$id$resp_p ; 


	if (service !in services) 
		services[service] = 0 ; 
	
	services[service]+= 1  ; 


	if (orig !in remote_hosts) 
		remote_hosts[orig] = 0 ; 

	remote_hosts[orig]+= 1; 

    } 


event zeek_done()
    {
	print fmt ("uniq services seen %s", |services|); 
	print fmt ("Uniq remote IPs seen %s", |remote_hosts|); 

	for (r in services) 
		if (services[r] > 3) 
			print fmt ("service: %s seen %s times", r, services[r]); 
	

	for (rh in remote_hosts) 
		if (remote_hosts[rh] > 3) 
			print fmt ("host %s seen %s times", rh, remote_hosts[rh]); 
    } 
