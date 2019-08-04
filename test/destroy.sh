# Refresh


# Copy ID
for host in centos7 rhel8 fedora30 ubuntu1804 debian10; do
  (cd ${host} && vagrant destroy -f)
done


