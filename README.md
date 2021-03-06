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
__Packer__
```
packer validate -var-file=variables.json  ubuntu16.json
packer build -var-file=variables.json  ubuntu16.json
```
___
__Terraform__
```
terraform fmt
terraform validate
terraform apply
terraform destroy
terraform get - загрузить модули
```

__Vagrant__

```
vagrant up
vagrant box list
vagrant status
vagrant ssh appserver
cat .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
vagrant destroy -f
```
__Molecule__
```
https://docs.python-guide.org/dev/virtualenvs/
pip3 install -r requirements.txt
pip3 install git+https://github.com/ansible-community/molecule-vagrant.git
molecule init scenario -r db -d vagrant
molecule create
molecule list
molecule login -h instance
molecule converge
molecule verify
```
