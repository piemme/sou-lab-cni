# DEVOPS LAB



## Istruzioni

Creazione di un repository in GitHub denominato "sou-lab-cni".
Creazione di un progetto Vagrant multinodo (2 nodi: soufe1 e soube2) con comunicazone su interfacce
network locali (scegliere una subnet a piacere in 192.168.0.0/16).
Scegliere la distribuzione tra Centos, Almalinux, RockyLinux e Oracle Linux.
Creazione di un ruolo Ansible denominato sou_podman. Nei punti successivi sono espresse le azione che
deve compiere l'automatismo.
Installare podman su soufe1 e soube2.
Installare HaProxy su soufe1 tramite podman e utilizzare un template Ansible per haproxy.cfg.
Installare Prometheus e Grafana tramite podman su soube2. Utilizzare volumi ad-hoc per dati e file di
configurazione. I file di configurazione grafana.ini e prometheus.yml occorre che siano gestiti tramite
template Ansible. Poter raggiungere Grafana e Prometheus via http o https (bonus per https con creazione
certificati anche self-signed).
HaProxy deve quindi operare come Reverse proxy per Prometheus e Grafana.
Versionare tutto in sou-lab-cni => Progetto Vagrant, Ansible Role, Templates e documentazione in
Markdown su README.md1
. Il progetto deve automatizzare tutti i punti all'esecuzione di "vagrant up o
vagrant provision"
