# Usage

## init

    cp terraform.tfvars.dist terraform.tfvars
    # add your hetzner cloud api token to terraform.tfvars
    # optional chancge server_count and server_type
    terraform init

    cp roles/playbook/vars/main.yml.dist troles/playbook/vars/main.yml
    # change docker-compose-repo and certbot-mail in roles/playbook/vars/main.yml

## start

    ./create

## stop

    ./destroy

## manual steps

### create

    terraform plan
    terraform apply

### remove

    terraform destroy

## ansible

    echo '# inventory' | tee inventory
    cat terraform.tfstate | jq --raw-output '.resources[].instances[].attributes | select(.name != null) | .ipv4_address' | tee -a inventory
    ansible-playbook -i inventory -u root playbook.yml
