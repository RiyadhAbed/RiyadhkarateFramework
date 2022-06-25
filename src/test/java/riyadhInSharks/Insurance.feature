Feature: Insurance API Automation

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GetToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}

  @getAccount
  Scenario: GetAccount
    And path 'api/accounts/get-account'
    * param primaryPersonId = 5736
    When method get
    Then status 200
    And print response

  @gitAllAccount
  Scenario: Get All Account
    * path 'api/accounts/get-all-accounts'
    When method get
    Then status 200
    And print response

  @getPrimaryAccount
  Scenario: Get Primary Account
    And path 'api/accounts/get-primary-account'
    And param primaryPersonId = 5736
    When method get
    Then status 200
    And print response
    * def id = response.id
    * match id == 5736
    * def email = response.email
    * match email contains '@gmail.com'

  @getPrimaryAccount1
  Scenario Outline: Get Primary Account
    Given headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-primary-account'
    And param primaryPersonId = <idValue>
    When method get
    Then status 200
    And print response
    * def id = response.id
    * match id == <idValue>
    * def email = response.email
    * match email contains <email contains>

    Examples: 
      | idValue | email contains |
      |    5736 | '@gmail.com'   |
      |     734 | '@yandex.com'  |
      |     720 | '@hotmail.com' |
