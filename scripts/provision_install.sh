# this script runs once on provision

# install DOCKER

echo "starting DOCKER setup"
echo "target MYSQL VERSION = ${MYSQLVER}"

#remove any existing docker installation
apt-get remove docker docker-engine docker.io docker-compose -y

#do required updated
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common -y
apt-get install zip

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
apt-get update
apt-get install docker-ce -y
apt-get install docker-compose -y

#set proper permissions for docker
groupadd docker
usermod -aG docker vagrant
systemctl enable docker

#create folders for volume storage
mkdir /opt/app
mkdir /opt/app/data01
mkdir /opt/app/db_hd
mkdir /opt/app/html

chown vagrant:vagrant /opt/app
chown vagrant:vagrant /opt/app/data01
chown vagrant:vagrant /opt/app/db_hd
chown vagrant:vagrant /opt/app/html

#start docker containers using docker-compose
cd /vagrant/scripts/docker
docker-compose up -d

#install base version of Magento in PHP container
docker exec docker_php_1 su - www-data -c "composer create-project --repository=https://repo.magento.com/ magento/${MAG_PROJECT} /var/www/html"

#initialize Magento
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento setup:install \
        --base-url=http://${MAG_FRONT_URL} \
        --db-host=db \
        --db-name=${MAG_DB_NAME} \
        --db-user=${MAG_UNAME} \
        --db-password=${MAG_PWD} \
        --admin-firstname=Magento \
        --admin-lastname=User \
        --admin-email=admin@dminc.com \
        --admin-user=${MAG_ADMIN_NAME} \
        --admin-password=${MAG_ADMIN_PWD} \
        --language=en_US \
        --currency=USD \
        --timezone=America/Chicago \
        --use-rewrites=1 \
        --backend-frontname=${MAG_ADMIN_URL}"

#copy magento files to vagrant share
rsync -zrvh --exclude={*.md,*.sample,.github,bin,dev,generated,pub,setup,update,var/cache,var/log,var/page_cache} /opt/app/html/* /vagrant

#configure Elasticsearch
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento config:set catalog/search/engine 'elasticsearch6'"
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento config:set catalog/search/elasticsearch6_server_hostname 'elasticsearch'"

#configure REDIS for session storage
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento setup:config:set --session-save=redis --session-save-redis-host=redis-session --session-save-redis-log-level=3 --session-save-redis-db=2"
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0"

#flush cache and rebuild indexes
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento cache:flush"
docker exec docker_php_1 su - www-data -c "php /var/www/html/bin/magento indexer:reindex"

echo "setup done"
