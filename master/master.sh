hostname "master"
echo "master" > /etc/hostname
echo "192.168.33.11 master" >> /etc/hosts
echo "192.168.33.12 slave" >> /etc/hosts

# get mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get -y install mongodb-10gen

service mongodb stop
cp -f /home/vagrant/master/mastercfg.conf /etc/mongodb.conf
service mongodb start

sleep 10

mongo 192.168.33.11 <<EOF
rs.initiate()
EOF

echo "Waiting a bit for replica init..."
sleep 10

mongo 192.168.33.11 <<EOF
rs.add("slave")
rs.conf()
EOF