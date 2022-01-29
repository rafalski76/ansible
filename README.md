# Ansible

```shell
vagrant up  # przygotowanie środowiska
vagrant ssh runner  # połączenie do maszyny z której uruchamiamy ansible

ansible -m ping -i hosts all 
ansible -a "pwd" -i hosts.yaml all 

ansible-playbook -i hosts.yaml 01-playbook.yaml
```
