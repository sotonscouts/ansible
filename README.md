# Southampton City Scouts Ansible

This is the ansible playbook for Southampton Scouts Scouts.
## Usage

### Installing Dependencies

You must install the exact version of ansible we are using.

The easiest way to do this is using [poetry](https://python-poetry.org/docs/#installing-with-pipx)

Poetry 1.8 or later is required.

```console
poetry install
ansible-galaxy install -r galaxy-requirements.yml 
```

### Ansible Vault setup

We store some secret values using `ansible-vault`, which encrypts files using a symmetric key and will decrypt them during a playbook run. You will need the vault password to execute the playbook.

The vault password is retrieved by ansible by executing `etc/vault_secret.sh`, which will either:

- prompt you for the vault password
- execute `vault_secret.local.sh`
  - You can use this to retrieve the password from a file on a login server, or from your password manager if developing locally

### Running everything

This will run everything, but won't make changes, and print a full diffs of changes that would be made.
```console
$ poetry shell
$ ansible-playbook config.yml --diff --check
```
Remove `--check` to actually make changes.

### Running against a single host

```console
$ ansible-playbook config.yml --diff --check --limit ct1
```
You can run this (without `--check`) against a new host to set it up with standard SOWN configuration.
