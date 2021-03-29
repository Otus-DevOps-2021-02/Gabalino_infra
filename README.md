# Gabalino_infra
Gabalino Infra repository

# Подключение к someinternalhost в одну команду

ssh -i ~/.ssh/appuser -A -J appuser@84.252.129.79 appuser@10.130.0.14

# Подключение из консоли при помощи команды ssh someinternalhost

~/.ssh/config

Host bastion
   Hostname     84.252.129.79
   User         appuser
   IdentityFile ~/.ssh/appuser

Host someinternalhost
   Hostname     10.130.0.14
   User         appuser
   IdentityFile ~/.ssh/appuser
   ProxyJump    bastion

bastion_IP = 84.252.129.79
someinternalhost_IP = 10.130.0.14

testapp_IP = 178.154.202.8
testapp_port = 9292
