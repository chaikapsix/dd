<?php
//"http://vpn.structure.pik-broker.ru:666/addfqdn.php?name={{ item.fqdn }}&ip={{ internal_ip }}"
//"http://vpn.structure.pik-broker.ru:666/addfqdn.php?del={{ item.fqdn }}"

$ip_addr = $_GET['ip'];
$url_addr = $_GET['name'];
$url_del = $_GET['del'];
$data = $ip_addr."    ".$url_addr."\n";
#$file_hosts = '/etc/hosts';
$file_hosts = './hosts';
$file_count = count($file_open);
$command = 'sudo /bin/systemctl restart dnsmasq';
$file_open = file($file_hosts, E_WARNING);

//Add New String
function add_url_ip_hosts($data,$file_hosts,$command)
{
    file_put_contents($file_hosts, $data, FILE_APPEND | LOCK_EX);
    passthru($command);
}
//Delete
function del_url_ip_hosts($data, $file_hosts, $file_count, $command)
{
    for ($i = 1; $i <= count($file_open); $i++) {

        if (explode("   ", $file_open[$i])) {
            $url_addr = explode("    ", $file_open[$i]);
            var_dump($url_addr);
#            file_put_contents($file_dead, $file_hosts, FILE_APPEND | LOCK_EX);
        }
    }
}
del_url_ip_hosts('vpn', $file_hosts, $file_count, $command);

if (filter_var($ip_addr, FILTER_VALIDATE_IP)){
    if ($file_open) {
        if (strpos(file_get_contents($file_hosts), $url_addr) !== false){
            $num_str_arr = preg_grep('/'.$url_addr.'/', file($file_hosts));
            $num_str = key($num_str_arr);
            unset($file_open[$num_str]);
            file_put_contents($file_hosts, implode("", $file_open));
            add_url_ip_hosts($data,$file_hosts,$command);
        }
        else{
            add_url_ip_hosts($data,$file_hosts,$command);
        }
    }
}