# Running an Ansible Playbook

Ansible playbooks are YAML files that specify a list of tasks to be executed by Ansible. To run an ansible playbook, you will need to have Ansible installed on your local machine or on a remote server.

## Prerequisites

Before you can run an ansible playbook, you will need to have the following:

-   Ansible installed on your local machine or on a remote server
-   A playbook file, which is a YAML file that specifies the tasks to be executed by Ansible
-   (Optional) A host inventory file, which is a list of hosts that Ansible will manage

## Running the Playbook

To run an ansible playbook, you can use the `ansible-playbook` command followed by the path to your playbook file.
For example, if your playbook file is named `cyberrange_baremetal.yml`, you can run it using the following command:
```
ansible-playbook cyberrange_baremetal.yml
```
You can also specify the target hosts for the playbook using the `-i` option, followed by the path to a host inventory file.

For example, if you have an inventory file named `hosts.ini`, you can run the playbook using the following command:
```
ansible-playbook -i hosts.ini cyberrange_baremetal.yml
```

## Additional Options

You can pass additional options to the `ansible-playbook` command to customize the execution of the playbook.

For example, you can use the `--ask-vault-pass` option to specify the password for encrypted variables in the playbook, or the `-e` option to pass extra variables to the playbook.

## Further Reading

For more information about running ansible playbooks, you can refer to the Ansible documentation:

[https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)
