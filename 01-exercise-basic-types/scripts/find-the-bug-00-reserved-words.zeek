module trainings;

global ip = 1.1.1.1; 
global ssub = 1.1.1.0/24 ; 
global answer: bool = F; 

event zeek_init()
{
	local port = 22/tcp; 

	if (ip in ssub) 
	{ 
		answer= T; 
	} 


} 

event zeek_done()
{
	print fmt("Answer that %s is in %s: %s", ip, ssub, answer); 
} 

