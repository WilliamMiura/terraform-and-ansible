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

## INSTRUCTIONS - secrets criadas:
  **IAM USER IN AWS**
   - AWS_ACCESS_KEY *ex: ASDASDHA123456*
   - AWS_SECRET_KEY *ex: DASKJKASsadkz\mlsadwD652$#@*
   - AWS_ACCESS_REGION *ex: us-west-1*

  **GCP**
   - KEY_GCP *ex: json file from service accounts*  
   - TF_VAR_PROJECT *ex: Iir-2561B*
   - TF_VAR_REGION  *ex: us-west1*
   - TF_VAR_ZONE  *ex: us-west1-c*
   - HOSTUSER *ex: your user-account name*