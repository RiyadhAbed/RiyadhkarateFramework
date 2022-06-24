Feature: Insurance API Automation

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    And path 'api/token'
    When request {"username": "admin","password": "admin"}
    And method post
    Then status 200
    And print response
    * def token = response.token
    And print token

  @getAccount
  Scenario: GetAccount
    Given headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-account'
    * param primaryPersonId = 5736
    When method get
    Then status 200
    And print response

  @gitAllAccount
  Scenario: Get All Account
    Given headers {Authorization: '#("Bearer " + token)'}
    * path 'api/accounts/get-all-accounts'
    When method get
    Then status 200
    And print response

  @getPrimaryAccount
  Scenario: Get Primary Account
    Given headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-primary-account'
    And param primaryPersonId = 5736
    When method get
    Then status 200
    And print response
