
module test; 

export {
	global ssh_tcp = 22/tcp ; 
	global ssh_udp = 22/udp ; 
	global aport = 22/unknown ; 


} 

event zeek_init()
    {
	print fmt ("1. unknown port is %s", aport); 
	print fmt ("2. %s < %s = %s", ssh_tcp, ssh_udp, ssh_tcp < ssh_udp); 
	print fmt ("3. %s < %s = %s", aport, ssh_tcp, aport < ssh_tcp ); 

	local ipv4 = 192.168.1.100 ; 
	local ipv6 = [::ffff:192.168.1.100] ;  # yes IPv6 address are represented inside [] 
	local answer = (ipv4 == ipv6) ? T : F ; 
	print fmt ("4. %s == %s is %s", ipv4, ipv6, answer); 
	print fmt ("4. 192.168.1.100 == [::ffff:192.168.1.100] is %s", answer); 



	local a = www.google.com;
	print fmt ("5. a is %s", a); 

	local ai: interval = -1 min ; 
	print  fmt ("4: ai is %s", |ai|); 
    } 
