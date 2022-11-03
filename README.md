# ansible

## USAGE:
run `git clone https://github.com/MoritzSchwerer/ansible.git`
run `ansible-playbook local.yml [-t 'tags']`

## TESTING:
1. run `docker build -t test .`
2. run `docker run -it test bash`
3. inside the docker run `./run`

### TODO:
    - add brave install
    - add pass and gpg keys
    - correct tags for ease of use
    - refine zsh-setup
