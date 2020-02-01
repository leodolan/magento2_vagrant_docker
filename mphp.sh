#!/bin/bash
# copy app code

docker exec -it docker_php_1 su - www-data -c "php /var/www/html/bin/magento $1 $2 $3 $4 $5 $6"

