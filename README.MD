## AUTH
  export GOOGLE_APPLICATION_CREDENTIALS=`pwd`/RELATIVEFILEPATH.json

**case error in kubernetes: had the same error today. try:**
  > sudo rm /etc/containerd/config.toml
  > sudo systemctl restart containerd
  > sudo kubeadm init

**this code for ansible**
  > ansible-playbook -u userinstancename -i ansible/inventory/gcp.yaml ansible/site.yaml @execute site.yaml
  > ansible-inventory --list -i ansible/inventory/cgp.yaml @list instances groups

**Before running instance master**
  > Connect with ssh and run: export KUBECONFIG=/etc/kubernetes/admin.conf