# DEVOPS LAB

## Istruzioni

* Creazione di un repository in GitHub denominato "sou-lab-cni".
* Creazione di un progetto Vagrant multinodo (2 nodi: soufe1 e soube2) con comunicazione su interfacce network locali (scegliere una subnet a piacere in 192.168.0.0/16).
* Scegliere la distribuzione tra Centos, Almalinux, RockyLinux e Oracle Linux.
* Creazione di un ruolo Ansible denominato sou_podman. Nei punti successivi sono espresse le azione che deve compiere l'automatismo.
* Installare podman su soufe1 e soube2.
* Installare HaProxy su soufe1 tramite podman e utilizzare un template Ansible per haproxy.cfg.
* Installare Prometheus e Grafana tramite podman su soube2.
* Utilizzare volumi ad-hoc per dati e file di configurazione.
* I file di configurazione grafana.ini e prometheus.yml occorre che siano gestiti tramite template Ansible. Poter raggiungere Grafana e Prometheus via http o https (bonus per https con creazione certificati anche self-signed).
* HaProxy deve quindi operare come Reverse proxy per Prometheus e Grafana.
* Versionare tutto in sou-lab-cni => Progetto Vagrant, Ansible Role, Templates e documentazione in Markdown su README.md
* Il progetto deve automatizzare tutti i punti all'esecuzione di "vagrant up o vagrant provision"

## Diario/Journal

Runtime Vagrant:

```
$ vagrant -v
Vagrant 2.2.19
```


Requisiti


Vedi: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible

Python
```
$ python3 -V       
Python 3.8.10
```

Pip
```
$ python3 -m pip -V           
pip 20.0.2 from /usr/lib/python3/dist-packages/pip (python 3.8)
```


Ansible
```
$ ansible --version
ansible [core 2.13.10]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/paolo/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/paolo/.local/lib/python3.8/site-packages/ansible
  ansible collection location = /home/paolo/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, May 26 2023, 14:05:08) [GCC 9.4.0]
  jinja version = 3.1.2
  libyaml = True
```



## Creating VM with Vagrant and basic Ansible provisioning


1) creare due VM
2) raggiungibili via ping, ssh

192.168.56.11 soufe1
192.168.56.12 soube2


Distribuzione: Oracle Linux, distribuzione più scaricata come immagine box vagrant

https://developer.hashicorp.com/vagrant/docs/multi-machine



Tempo per creare le due VM + banale task Ansible

Current machine states:

soufe1                    running (virtualbox)
soube2                    running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
how much time (HH:MM.SEC): 00:04:24.026928839


https://developer.hashicorp.com/vagrant/docs/provisioning/ansible

https://developer.hashicorp.com/vagrant/docs/multi-machine



## Creating podman role

$ ansible-galaxy init sou_podman




requirements:

$ ansible-galaxy collection install -r requirements.yml




enter in podmanc container


podman exec -it de8f724b6d82  /bin/sh


volumes, rootless
https://www.redhat.com/sysadmin/container-permission-denied-errors