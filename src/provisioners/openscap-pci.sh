sudo yum -y install openscap-scanner scap-security-guide ansible python3-pip
pip3 install --user ansible

oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_pci-dss --results scan-xccdf-results.xml /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml

