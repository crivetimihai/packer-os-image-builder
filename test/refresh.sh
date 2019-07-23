# Refresh


# Copy ID
for host in centos7 rhel8 fedora30 ubuntu1804 debian10; do
  (cd ${host} && vagrant destroy -f)
  (cd ${host} && vagrant up)
  sshpass -f password.txt ssh-copy-id vagrant@${host}
done


