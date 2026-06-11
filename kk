--------BGP-----------------------------------------

----router 0
---------------------------------------
Router>en
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)# router bgp 35
Router(config-router)#bgp router-id 3.3.3.3	
Router(config-router)#neighbor 20.20.20.2 remote-as 50
Router(config-router)#neighbor 10.10.10.2 remote-as 20
Router(config-router)#network 10.10.10.0 mask 255.0.0.0
Router(config-router)#network 20.20.20.0 mask 255.0.0.0



------route 1
----------------------------------
Router>
Router>en
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#router bgp 20
Router(config-router)#bgp router-id 1.1.1.1
Router(config-router)#neighbor 10.10.10.1 remote-as 35
Router(config-router)#network 10.10.10.0 mask 255.255.255.0
Router(config-router)#network 192.168.10.0 mask 255.255.255.0
Router(config-router)#

---router 2
-----------------------------------
Router>en
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#router bgp 50
Router(config-router)#bgp router-id 2.2.2.2
Router(config-router)#neighbor 20.20.20.1 remote-as 35
Router(config-router)#network 20.20.20.0 mask 255.0.0.0
Router(config-router)#network 192.168.20.0 mask 255.255.255.0
Router(config-router)#exit
Router(config)#exit
Router#
%SYS-5-CONFIG_I: Configured from console by console

Router#show ip bgp neighbors
Router#
Router#
Router#
	
Router#show ip bgp summary
---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------OSPF-----------------------------------
Router>
Router>en
Router#
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#router ospf 3
Router(config-router)#router-id 3.3.3.3
Router(config-router)#network 12.0.0.0 0.255.255.255 area 0
Router(config-router)#network 10.0.0.0 0.255.255.255 area 0
Router(config-router)#network 192.168.2.0 0.0.0.255 area 0	
Router(config-router)#exit
Router(config)#exit
Router#
Router#show ip protocols
Router#show ip ospf
Router#
Router#
Router#show ip ospf interface 
Router#
Router#
Router#
Router#
Router#	
Router#show ip ospf neighbor
Router#
Router#
Router#
Router#show ip route ospf
Router#
Router#
Router#show ip route
Router#
Router#
