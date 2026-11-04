# ansible-projekt

Wdrożenie aplikacji [Mealie](https://mealie.io/) (v3) z bazą PostgreSQL w kontenerach Dockera na dwóch maszynach:
`host1` – Mealie (port `9090`), `host2` – PostgreSQL (port `5432`).

## Uruchomienie

Na maszynie `runner` (z katalogu `/vagrant/projekt`):

```shell
ansible-galaxy install -r requirements.yaml --roles-path roles   # geerlingguy.git, geerlingguy.docker + kolekcje
ansible-playbook -i hosts.yaml playbook.yaml
```

Hasło do bazy (`postgres_password`) ustawia się w `group_vars/all.yaml`
(w prawdziwym wdrożeniu przenieś je do Ansible Vault – patrz zaszyfrowany `secret.yaml`).

Pliki `docker-compose-*.yaml` są szablonami Jinja2 (moduł `template`), a kontenery uruchamia
moduł `community.docker.docker_compose_v2`.
