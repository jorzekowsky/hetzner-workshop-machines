# Usage

## requirements

- terraform
- ansible
- jq (to parse terraform tfstate file)

## init

    cp terraform.tfvars.dist terraform.tfvars
    # add your hetzner cloud api token and the names of your sshkeys inside 
    # hetzner cloud to **terraform.tfvars**
    # optional change server_count and server_type
    terraform init

    cp roles/playbook/vars/main.yml.dist roles/playbook/vars/main.yml
    # change docker-compose-repo and certbot-mail in roles/playbook/vars/main.yml

## start

    ./create

## stop / remove

    ./destroy

## manual steps

### create

    terraform plan
    terraform apply
    echo '# inventory' | tee inventory
    cat terraform.tfstate | jq --raw-output '.resources[].instances[].attributes | select(.name != null) | .ipv4_address' | tee -a inventory
    ansible-playbook -i inventory -u root playbook.yml

### remove

    terraform destroy
