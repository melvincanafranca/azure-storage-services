$dbServerName = <yourDBServerName>
$dbName = <yourDBName>

#create database server
az sql server create \
--admin-user <your-admin-user> \
--admin-password <your-admin-pw> \
-n $dbServerName \
-g resource-group-west \
-l westus \
--enable-public-network true \
--verbose

#create firewall rule for public access
az sql server firewall-rule create \
-g resource-group-west \
-s $dbServerName \
-n azureaccess \
--start-ip-address 0.0.0.0 \
--end-ip-address 0.0.0.0 \
--verbose

#create firewall rule for your pc access to the db
az sql server firewall-rule create \
-g resource-group-west \
-s $dbServerName \
-n clientip \
--start-ip-address <your-pc-ip-address> \
--end-ip-address 255.255.255.0 \
--verbose

#create the database
az sql db create \
-n hello-udacity-db \
-g resource-group-west \
-s $dbServerName \
--tier Basic \
--verbose

#delete the database
az sql db delete \
--n $dbName \
--g resource-group-west \
--s $dbServerName \
--verbose

#delete the server
az sql server delete \
--n $dbServerName \
--g resource-group-west \
--verbose