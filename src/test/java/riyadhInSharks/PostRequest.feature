Feature: Post Request

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GetToken.feature')
    * def token = result.token
    Given headers {Authorization: '#("Bearer " + token)'}

  Scenario: Add account
    Given path 'api/accounts/add-account'
    When request
      """
      {
      "primaryPerson": {
        "email": "Riyadh.Riyadh1509@gmail.us",
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
    * print response
    * def state = response.primaryPersonMailingAddresses.state
    * print state
    * def phoneNumber = response.primaryPersonPhones.phoneNumber
    * print phoneNumber

  @AddprimaryAccount
  Scenario Outline: Add primary Account
    Given path 'api/accounts/add-primary-account'
    When request
      """
      {
      
      "email": <emailValue>,
      "title": <titleValue>,
      "firstName": <firstNameValue>,
      "lastName": <lastNameValue>,
      "gender": <genderValue>,
      "maritalStatus": <martalStatusValue>,
      "employmentStatus": <employmentStatusValue>,
      "dateOfBirth": <dateOfBirthValue>
      }
      """
    * method post
    * status 201
    * print response

    Examples: 
      | emailValue               | titleValue | firstNameValue | lastNameValue | genderValue | martalStatusValue | employmentStatusValue | dateOfBirthValue |
      | 'riyadh.1981@gmail.us'   | 'MR'       | 'Riyadh1'      | 'Abed1'       | 'MALE'      | 'MARRIED'         | 'EMPLOYEE'            | '10/10/1999'     |
      | 'riyadh.190081@gmail.us' | 'MR'       | 'Riyadh2'      | 'Abed1'       | 'MALE'      | 'MARRIED'         | 'EMPLOYEE'            | '10/10/1989'     |
      | 'riyadh.198001@gmail.us' | 'MR'       | 'Riyadh3'      | 'Abed1'       | 'MALE'      | 'MARRIED'         | 'EMPLOYEE'            | '10/10/1999'     |
      | 'riyadh.100981@gmail.us' | 'MR'       | 'Riyadh4'      | 'Abed1'       | 'MALE'      | 'MARRIED'         | 'EMPLOYEE'            | '10/10/2000'     |
