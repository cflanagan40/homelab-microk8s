ansible-galaxy install istvano.microk8s

ansible-playbook -i ../terraform/inventory microk8s.yml

ansible-playbook -i ../terraform/inventory nfs.yml

ansible-playbook -i ../terraform/inventory ingress.yml

ansible-playbook -i ../terraform/inventory sonarqube.yml

ansible-playbook -i ../terraform/inventory tekton.yml
