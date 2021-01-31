#!/usr/bin/bash

main_dir="$PWD/ansible"
venv_dir="$HOME/.virtualenvs/ansible/bin"
tagname=$1

run_role() {
    source "$venv_dir/activate"
    eval "ansible-playbook -i $main_dir/hosts $main_dir/playbook.yml -e ansible_python_interpreter=$venv_dir/python --tag '$tagname' --ask-become-pass --ask-vault-pass"
}

echo "running role..."
run_role
