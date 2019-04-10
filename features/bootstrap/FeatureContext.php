<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;

use Behat\Behat\Context\ClosuredContextInterface;
use Behat\Behat\Context\TranslatedContextInterface;
use Behat\Behat\Context\BehatContext;
use Behat\MinkExtension\Context\MinkContext;

use Behat\Gherkin\Parser;
use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Behat\Hook\Scope\AfterScenarioScope;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext
{

    /**
     * @BeforeScenario
     *
     * @param BeforeScenarioScope $scope
     *
     */
    public function setUpTestEnvironment($scope)
    {
        $this->currentScenario = $scope->getScenario();
    }

    /**
     * @AfterStep
     *
     * @param AfterStepScope $scope
     */
    public function afterStep($scope)
    {
        //if test has failed, and is not an api test, get screenshot
        if(!$scope->getTestResult()->isPassed())
        {
            //create filename string

            $featureFolder = preg_replace('/\W/', '', $scope->getFeature()->getTitle());
                
            $scenarioName = $this->currentScenario->getTitle();
            $fileName = preg_replace('/\W/', '', $scenarioName) . '.png';

            //create screenshots directory if it doesn't exist
            if (!file_exists('build/html/assets/screenshots/' . $featureFolder)) {
                mkdir('build/html/assets/screenshots/' . $featureFolder);
            }

            //take screenshot and save as the previously defined filename
            $this->driver->takeScreenshot('build/html/assets/screenshots/' . $featureFolder . '/' . $fileName);
            // For Selenium2 Driver you can use:
            // file_put_contents('build/html/assets/screenshots/' . $featureFolder . '/' . $fileName, $this->getSession()->getDriver()->getScreenshot());
        }
    }
    protected $screenshot_dir = '/srv/screenshots';

    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct($parameters)
    {
        $this->parameters = $parameters;
        if (isset($parameters['screenshot_dir'])) {
            $this->screenshot_dir = $parameters['screenshot_dir'];
        }
    }

    /**
     * @Given a user :arg1 with password :arg2
     */
    public function aUserWithPassword($arg1, $arg2)
    {
        throw new PendingException();
    }


    /**
     * @BeforeStep ~@javascript
     */
    public function beforeStep($event)
    {
        $username = variable_get('behat_ui_http_user', '');
        $password = variable_get('behat_ui_http_password', '');
        if (!empty($username) && !empty($password)) {
            $this->getSession()->getDriver()->setBasicAuth($username, $password);
        }
    }

    /**
     * @When I login as :arg1 with password :arg2
     */
    public function iLoginAsWithPassword($arg1, $arg2)
    {
        throw new PendingException();
    }

    /**
     * @Then it shoudl display :arg1
     */
    public function itShoudlDisplay($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then I should see the login form
     */
    public function iShouldSeeTheLoginForm()
    {
        throw new PendingException();
    }


    /**
     * @Then I should see :arg1 in :arg2 block
     */
    public function iShouldSeeInBlock2($arg1, $arg2)
    {
        throw new PendingException();
    }


    /**
     * @Then I should be able to edit :arg1 ( content)
     */
    public function iShouldBeAbleToEditContent($arg1)
    {
        throw new PendingException();
    }


    /**
     * Authenticates a user with password from configuration.
     *
     * @Given /^I am logged in as the "([^"]*)"$/
     */
    public function iAmLoggedInAsUser($username)
    {
        $password = $this->fetchPassword('drupal', $username);
        $this->iLoginAsWithPassword($username, $password);
    }

    /**
     * @Then I should not see the :arg1
     */
    public function iShouldNotSeeThe($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then I should see :arg1 link
     */
    public function iShouldSeeLink($arg1)
    {
        throw new PendingException();
    }


    /**
     * @Given I visit a file embed form
     */
    public function iVisitAFileEmbedForm()
    {
        throw new PendingException();
    }

    /**
     * @Then the selected view mode should be original
     */
    public function theSelectedViewModeShouldBeOriginal()
    {
        throw new PendingException();
    }

    /**
     * @Given /^I wait for "(?P<num>\d+)" seconds$/
     */
    public function iWaitForSeconds($seconds)
    {
        $this->getSession()->wait(intval($seconds) * 1000);
    }

    /**
     * @Then /^The "(?P<element>[^"]*)" element should not be broken$/
     */
    public function theElementShouldNotBeBroken($element)
    {
        $image = $this->getSession()->getPage()->find('css', $element);
        $imgUrl = $image->getAttribute('src');
        $this->getSession()->visit($this->locatePath($imgUrl));
        return $this->assertSession()->elementsCount('css', 'img', 1);
    }

    /**
     * Take screenshot when step fails. Works only with Selenium2Driver.
     * Screenshot is saved at [Date]/[Feature]/[Scenario]/[Step].jpg
     * @AfterStep
     */
    public function after(Behat\Behat\Hook\Scope\AfterStepScope $scope)
    {
        if ($scope->getTestResult()->getResultCode() === 99) {
            $driver = $this->getSession()->getDriver();
            if ($driver instanceof Behat\Mink\Driver\Selenium2Driver) {
                $fileName = date('d-m-y') . '-' . uniqid() . '.png';
                $this->saveScreenshot($fileName, $this->screenshot_dir);
                print 'Screenshot at: ' . $this->screenshot_dir . '/' . $fileName;
            }
        }
    }

    /**
     * @When /^I hover over the link "([^"]*)"$/
     */
    public function iHoverOverTheLink($link)
    {
        $session = $this->getSession(); // get the mink session
        $element = $this->getSession()->getPage();
        $result = $element->findLink($link);

        if (null === $result) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate id|title|alt|text: "%s"', $link));
        }

        //hovering over the element
        $result->mouseOver();
    }


    /**
     * @Given I click the :input element
     */
    public function iClickTheElement($selector)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $selector);

        if (empty($element)) {
            throw new Exception("No html element found for the selector ('$selector')");
        }

        $element->click();
    }


    /**
     * @When I scroll :elementId into view
     */
    // this is bad code
//     public function scrollIntoView($elementId) {
//         $function = <<<JS
// (function(){
//  var elem = document.getElementById("$elementId");
//        elem.scrollIntoView(false);
//        })()
// JS;
//         try {
//             $this->getSession()->executeScript($function);
//         }
//         catch(Exception $e) {
//             throw new \Exception("ScrollIntoView failed");
//         }
//     }

    /**
     * @When /^The website should open in a new tab$/
     */
    public function documentShouldOpenInNewTab()
    {
        $session     = $this->getSession();
        $windowNames = $session->getWindowNames();
        if(sizeof($windowNames) < 2){
            throw new \ErrorException("Expected to see at least 3 windows opened");
        }


        $session->switchToWindow($windowNames[0]);
    }

    /**
     * @Given /^I confirm the dialog$/
     * @throws \Behat\Mink\Exception\DriverException
     */
    public function iConfirmTheDialog()
    {
        $this->getSession()->getDriver()->executeScript('window.confirm = function () { return true; };');
    }

}


