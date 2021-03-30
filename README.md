# Gabalino Infra repository

__Подключение к someinternalhost в одну команду__

```
ssh -i ~/.ssh/appuser -A -J appuser@84.252.129.79 appuser@10.130.0.14
```

__Подключение из консоли при помощи команды ssh someinternalhost__

_~/.ssh/config_
```
Host bastion
   Hostname     84.252.129.79
   User         appuser
   IdentityFile ~/.ssh/appuser

Host someinternalhost
   Hostname     10.130.0.14
   User         appuser
   IdentityFile ~/.ssh/appuser
   ProxyJump    bastion
```
```
bastion_IP = 84.252.129.79
someinternalhost_IP = 10.130.0.14
```
___

__Создание инстанса в YC__

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
```

```
testapp_IP = 178.154.202.8
testapp_port = 9292
```

___
