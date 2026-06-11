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

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
FTP----------------------------------------------------------------------------------
Cisco Packet Tracer PC Command Line 1.0
C:\>dir
 
 Volume in drive C has no label.
 Volume Serial Number is 5E12-4AF3
 Directory of C:\

1/1/1970    5:30 PM            26        sampleFile.txt      
                26 bytes            1 File(s)     
C:\>ftp 10.0.0.2
Trying to connect...10.0.0.2
Connected to 10.0.0.2
220- Welcome to PT Ftp server
Username:chanuka
331- Username ok, need password
Password:
230- Logged in
(passive mode On)

ftp>dir
13  : c2900-universalk9-mz.SPA.155-3.M4a.bin             33591768
31  : name.txt                                           27

ftp>get name.txt  ==> When uploading put name.txt downloading get name.txt

Reading file name.txt from 10.0.0.2: 
File transfer in progress...

[Transfer complete - 27 bytes]

27 bytes copied in 0 secs
ftp>
ftp>
ftp>

ftp>quit

221- Service closing control connection.
C:\>dir
 
 Volume in drive C has no label.
 Volume Serial Number is 5E12-4AF3
 Directory of C:\

1/1/1970    5:30 PM            27        name.txt            
1/1/1970    5:30 PM            26        sampleFile.txt      
                53 bytes            2 File(s)     
C:\>

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

past paper-18/19-----------------------------------------------------------------------------------------

netbasic.txt
i. What is the mode when you log in to the "Command Line Interface" in a CISCO router?

Answer: User Executive Mode (User EXEC Mode).

Prompt look: Router>

ii. Which mode you need to use, to access all commands?

Answer: Privileged Executive Mode (Privileged EXEC Mode).

Prompt look: Router#

iii. How to switch the global configuration mode to privileged exact mode?

Answer: Use the exit or end command, or press Ctrl + Z.

Example:

Plaintext
Router(config)# exit
Router#
iv. What is the command to show the important status information of router?

Answer: show running-config (to see current configuration) or show interfaces (to check port status) or show version (for hardware/software details).

v. How do you clear the counters or interface of router?

Answer: Use the clear counters command in Privileged EXEC Mode.

Example: ```text
Router# clear counters fastethernet 0/0


vi. How do you exit from global configuration mode?

Answer: Use the exit command.

Example:

Plaintext
Router(config)# exit
Router#
vii. List at least two methods to exit from privilege exact mode.

Answer:

Method 1: Type the disable command (returns to User EXEC mode).

Method 2: Type the exit or logout command (closes the console session).

viii. How do you get the brief description of the help system in any command mode?

Answer: Type the question mark ? character.

Example:

Plaintext
Router> ?
ix. What is the command to name the router? Explain your answer with an example.

Answer: The command is hostname [name]. This must be executed in Global Configuration Mode.

Example: To change the router's name to "Gateway01", type:

Plaintext
Router(config)# hostname Gateway01
Gateway01(config)#
x. How do you set an encrypted password to router?

Answer: Use the enable secret [password] command in Global Configuration Mode.

Example: To set the encrypted password as "cisco123":

Plaintext
Router(config)# enable secret cisco123
