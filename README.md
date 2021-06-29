OpenShift 4 VMware Deploy Container
===========================================

## Description
------------

This Container should be used when deploying the OpenShift 4 [
ocp4-aio-vsphere-upi-lab](https://github.com/cptmorgan-rh/ocp4-aio-vsphere-upi-lab) or [ocp4-vsphere-ipi-lab](https://github.com/cptmorgan-rh/ocp4-vsphere-ipi-lab) if you are running on CentOS/RHEL 7/8. Butane is required to configure the CoreDNS and HAProxy Loadbalancer and it requires glibc 2.32 which is not available in CentOS/RHEL 7/8.

If you are not deploying the CoreDNS or HAProxy Load Balancer servers then this container is not needed.

## How To Use

1) Create a folder in your home directory and copy your ssh public key and openshift pull secret.
    * e.g. mkdir $HOME/ocp\_install\_files
2) Run the container and clone the UPI or IPI repository.
3) Due to issues with deploying the RHCOS VMware OVA using the vmware\_deploy\_ovf in a container clone the govc branch.

```bash
$ podman run --name ocp4_vmware_deploy -it -v $HOME/ocp_install_files:/ocp_install_files:Z quay.io/mpeterma/ocp4_vmware_deploy
$ git clone https://github.com/cptmorgan-rh/ocp4-aio-vsphere-upi-lab.git
$ git clone https://github.com/cptmorgan-rh/ocp4-vsphere-ipi-lab
```
4) Update your groupi\_vars/all.yml file to point to your ssh public key and openshift pull secret.
5) After the installation has completed you can copy the install\_dir to the /ocp\_install\_files directory so they are accesible from your host machine.

```
config:
...
  installer_ssh_key: "{{ lookup('file', '/ocp_install_files/id_rsa.pub') }}"
  pull_secret: "{{ lookup('file', '/ocp_install_files/pull-secret.json') }}"
```

AUTHOR
------
Morgan Peterman
