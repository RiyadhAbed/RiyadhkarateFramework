Feature: Data Generator Concept

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GetToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}
    * def dataGenerator = Java.type('riyadhInSharks.DataGenerator')
    * def emailValue = dataGenerator.getEmail()
    * def firstName = dataGenerator.getfirstName()
    * def lastName = dataGenerator.getlastName()
    * def title = dataGenerator.gettitle()

  @AddPrimaryAccountWithData
  Scenario: Get dataGenerator with data
    Given path 'api/accounts/add-primary-account'
    When request
      """
      {
      "email": "#(emailValue)",
      "title": "#(title)",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "Student",
      "dateOfBirth": "1/1/2000"
      }
      """
    * method post
    * status 201
    Then print response
