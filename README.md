# Ansible

[![Lint](https://github.com/rafalski76/ansible/actions/workflows/lint.yml/badge.svg)](https://github.com/rafalski76/ansible/actions/workflows/lint.yml)

Przykładowe playbooki i role Ansible z warsztatów wraz z laboratorium w Vagrancie
(maszyna `runner` + trzy maszyny docelowe `target1..3`).

## Wymagania

- [Vagrant](https://developer.hashicorp.com/vagrant/downloads) i [VirtualBox](https://www.virtualbox.org/)
- Ansible instaluje się automatycznie na maszynie `runner` (przez `pipx`, najnowsza wersja z PyPI)

## Przygotowanie środowiska

```shell
vagrant up                 # runner + target1..3 (Ubuntu 24.04)
vagrant ssh runner         # maszyna, z której uruchamiamy Ansible
cd /vagrant
ansible-galaxy install -r requirements.yaml   # role i kolekcje z Galaxy (geerlingguy.docker, community.*)
```

## Przykłady

| Plik | Opis |
| --- | --- |
| `01-playbook.yaml` | Instalacja nginx modułem `apt` |
| `011-playbook-simple.yaml` | Moduł `ping` |
| `012-playbook-docker.yaml` | Instalacja Dockera rolą `geerlingguy.docker` |
| `02-playbook-with-simple_role.yaml`, `022-playbook-with-role.yaml` | Użycie własnych ról (`simple_common`, `cwiczenie`) |
| `03-web-server.yaml` | Role `common` i `web_server` (nginx, szablon strony, handlery) |
| `04-loop-example.yaml` | Pętla `loop` – tworzenie użytkowników |
| `05-show-facts.yaml` | Wyświetlenie faktów o hoście |
| `06-conditionals.yaml` | Warunki `when` i `register` |
| [`projekt/`](projekt/README.md) | Projekt: PostgreSQL + Mealie w kontenerach |

## Uruchamianie

```shell
ansible -m ping -i hosts all
ansible -a "pwd" -i hosts.yaml all

ansible-playbook -i hosts.yaml 01-playbook.yaml
```

## Lint / CI

Workflow [`lint.yml`](.github/workflows/lint.yml) uruchamia `yamllint` i `ansible-lint` (profil `production`).
Lokalnie: `pipx install ansible-lint && ansible-lint`.
