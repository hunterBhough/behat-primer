#!/bin/sh

# This script is for easy testing in non-Docker environments.
# Set 'DOCKER_TESTING_ENVIRONMENT: 0' in docker-compose.behat.yml.

# If else statement to set default parameters if no parameters was passed.

if [ -z "$*" ]; then
  BEHAT_PARAMETERS="--colors --format=pretty --out=std --config=behat.hiv.yml"
else 
  BEHAT_PARAMETERS="$*"
fi

# Start Behat and Selenium server containers
docker-compose -f docker-compose.behat.yml up -d

# Additional time for Selenium.
echo 'Sleeping while selenium and behat containers are being built.'
echo '...'
echo 'TIP: If you get strange errors, try increasing the sleep time'
sleep 3

echo "Copying your desired yaml to the root directory. It's a behat thing."
echo '...'
docker-compose -f docker-compose.behat.yml exec behat cp ./project-yamls/*.yml /srv
#docker-compose -f docker-compose.behat.yml exec behat /drupal/smokefree composer install

# Run tests inside Behat container.
echo "Running tests."
docker-compose -f docker-compose.behat.yml exec behat /srv/entrypoint.sh "$BEHAT_PARAMETERS"

# Stop and remove containers.
docker-compose -f docker-compose.behat.yml down









#echo 'building network'
#docker network create behat_network

#echo 'building selenium container'
#docker run -d -p 4444:4444 -v /dev/shm:/dev/shm --network behat_network selenium/standalone-chrome:3.9.1-actinium

#echo 'building behat container'
#docker run \
#-v behat.common.yml:/srv/behat.common.yml \
#-v project-yamls:/srv/project-yamls \
#-v features:/srv/features \
#-v artifacts:/srv/artifacts \
#bergil/docker-behat
