Feature: Delete Account

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GetToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}
@DeleteAccount
  Scenario: Delete Account
    Given path 'api/accounts/delete-account'
    * param primaryPersonId = 1056
    * method delete
    * status 200
    * print response
