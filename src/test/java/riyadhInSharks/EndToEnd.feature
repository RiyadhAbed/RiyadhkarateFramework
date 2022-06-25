@EndToEndTesting
Feature: End To End Testing

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GetToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}

  Scenario: Creat Account
    Given path 'api/accounts/add-account'
    When request
      """
      {
      "primaryPerson": {
        "email": "Riyadh.Riyadh1998810@gmail.us",
        "title": "MR",
        "firstName": "Riyadh",
        "lastName": "Abed",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "Student",
        "dateOfBirth": "1/1/1981"
      },
      "primaryPersonMailingAddress": {
        "addressType": "House",
        "addressLine1": "1148 Wellington Dr",
        "city": "Harrisonburg",
        "state": "VA",
        "postalCode": "22802",
        "countryCode": "+1"
      },
      "primaryPersonPhone": {
        "phoneNumber": "2020222002",
        "phoneExtension": " ",
        "phoneTime": "Day",
        "phoneType": "Cell"
      }
      }
      """
    * method post
    * status 201
    * def responseID = response.primaryPerson.id
    * headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-account'
    * param primaryPersonId = responseID
    When method get
    Then status 200
    And print response
    * headers {Authorization: '#("Bearer " + token)'}
    Given path 'api/accounts/delete-account'
    * param primaryPersonId = responseID
    * method delete
    * status 200
    * print response
    * def message = response
    * match message =='Account Successfully deleted'
