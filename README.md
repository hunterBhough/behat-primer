# behat-primer

## Setup
Visit https://getcomposer.org/doc/00-intro.md
 Scroll down to the "Globally" section
 Select the "Download page instructions" hyperlink
    Copy and paste the first script line "php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"" into your terminal then press Enter
    Copy and paste the second script line "php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
                                           php composer-setup.php" and press Enter
    After the second script has been entered, you should see the words "Installer verified"
        To confirm that it has been installed, enter "ls" and look for "composer.phar" under license
 Return to the homepage https://getcomposer.org/doc/00-intro.md and return back to the Globally section
    Copy and paste the script line "mv composer.phar /usr/local/bin/composer" in the terminal and press Enter
        It will respond, "Permission Denied". Enter "sudo !!"
            It will then prompt you for your computer password
            Once entered, it should installed and ready to run! 
### Prerequisites
Docker
### Projects-yamls
Make a copy of project-yamls/behat.google-example.yml, in the same directory, and rename it to something specific to your project.  
Replace the base_url (line 6) with the url where you want behat to start . 
### Features
It is recommended you make a base folder inside of features to hold all of your tests.  
Inside your project-specific features, you will be able to sort all of your tests how you see fit.  
### test.sh
Under BEHAT_PARAMETERS (lines 9 & 11), change the config to your desired project-yaml, and change 'features/trunk' to the path you chose to house your tests

## Debugging and Writing Tests
When writing the tests, or for demos, you might want to see what behat is doing in the background  
Steps (these commands reference the 'Makefile'):  
    make debug-start  
in Safari or Alfred, go to the url: vnc://localhost:5901  
Password: secret  
    make debug-run  
        Here, you can optionally add arguments with the argument 'features'  
        ex: make debug-run features=features/projectFolder  
For windows, you will need a 3rd party vnc client like RealVNC. The url and password are the same as above  

## Running all tests with a faster selenium
To run tests with the defaults you set on test.sh(9), simply run the command: sh test.sh  
To run a specific feature file, run the command: sh test.sh {path to your file/folder}
Examples below:  
    sh test.sh features/projectFolder  
    sh test.sh features/projectFolder/components/carousel.feature  

## Rapid development with faster selenium
test.sh will build and destroy the docker network every time you run the script.  
To start it manually, run the command from the root directory:  
docker-compose -f docker-compose.behat.yml up -d  
Then comment out lines 15-33, and uncomment line 30 (docker-compose -f docker-compose.behat.yml exec behat /srv/entrypoint.sh "$BEHAT_PARAMETERS")  
Now you can execute tests with test.sh much faster feedback loop.  
To stop your network when done with testing, run the command:  
docker-compose -f docker-compose.behat.yml down  
