@login
Feature: Create Token Feature

#  Scenario: Create Token Scenario Single Environment
#    Given url 'https://conduit.productionready.io/api'
#    Given path 'users/login'
#    And request {user: {email: "#(email)", password: "#(password)"}}
#    When method Post
#    Then status 200
#    * def authToken = response.user.token

  Scenario: Create Token Scenario Multiple Environment
    Given url apiUrl
    Given path 'users/login'
    And request {user: {email: "#(userEmail)", password: "#(userPassword)"}}
    When method Post
    Then status 200
    * def authToken = response.user.token