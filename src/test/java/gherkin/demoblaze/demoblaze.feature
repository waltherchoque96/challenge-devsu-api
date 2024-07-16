@DemoBlaze
Feature: API DemoBlaze

  @createNewUser
  Scenario: Create New User
    * def username = Java.type('gherkin.demoblaze.Random').getUsername();
    * def password = Java.type('gherkin.demoblaze.Random').getPassword();

    Given url urlDemoBlaze + pathSignUp
    And request
      """
         {
          "username": '#(username)',
          "password": '#(password)'
          }
      """
    When method post
    Then status 200
      * karate.log(response)


  @createUserExisting
  Scenario Outline: Create User existing
    Given url urlDemoBlaze + pathSignUp
    And request
      """
         {
          "username": 'test',
          "password": '123'
          }
      """
    When method post
    Then status 200
    And match response.errorMessage == "<message>"
      * karate.log(response)

      Examples:
        | message                  |
        | This user already exist. |


  @loginSuccessfully
  Scenario: Login Successfully
    Given url urlDemoBlaze + pathLogin
    And request
      """
         {
          "username": 'wchoque',
          "password": 'd2Nob3F1ZQ=='
          }
      """
    When method post
    Then status 200
      * karate.log(response)


  @loginUnsuccessfully
  Scenario Outline: Login Unsuccessfully
    Given url urlDemoBlaze + pathLogin
    And request
      """
         {
          "username": 'waltherc',
          "password": 'abc123'
          }
      """
    When method post
    Then status <statusCode>
    And match response.errorMessage == "<message>"
      * karate.log(response)
      Examples:
        | statusCode | message         |
        | 200        | Wrong password. |

