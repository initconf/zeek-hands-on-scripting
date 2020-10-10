module trainings; 

global nc = 0 ; 
global ce = 0 ; 
global ca = 0 ; 
global csr = 0 ; 

event new_connection(c: connection)
{ 
	print fmt ("new_connection          : %s, %s", c$uid, c$id) ; 
	nc += 1 ;
}

event connection_established(c: connection)
{
	print fmt ("connection_established  : %s, %s", c$uid, c$id); 
	ce += 1; 
} 

event connection_state_remove(c: connection) 
{
	print fmt ("connection_state_remove: %s, %s", c$uid, c$id); 
	csr +=1 ; 
}

event connection_attempt(c: connection) 
{ 
	print fmt ("connection_attempt    : %s, %s", c$uid, c$id); 
	ca += 1 ; 
} 


event zeek_done()
{
	print fmt( "" ); 
	print fmt ("new_connection: %s", nc); 
	print fmt ("connection_established: %s", ce); 
	print fmt ("connection_state_remove: %s", csr); 
	print fmt ("connection_attempt: %s", ca); 

	print fmt ("Now run: ");
	print fmt ("zeek -r Traces/conn_attempt.pcap scripts/07-conn_attempt-vs-conn_established.zeek") ; 
	print fmt ("AND"); 
	print fmt ("zeek -r Traces/http.pcap scripts/07-conn_attempt-vs-conn_established.zeek"); 
	print fmt ("why does the conn_attempt kicks on one trace while established on other ? )" ; 
} 