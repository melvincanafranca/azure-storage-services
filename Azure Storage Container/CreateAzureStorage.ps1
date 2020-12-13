$storageName = <yourStorageName>

#create storage account
az storage account create \
 -n $storageName \
 -g resource-group-west \
 -l westus

#create storage container
az storage container create \
 --account-name $storageName \
 -n images \
 --auth-mode login \
 --public-access container