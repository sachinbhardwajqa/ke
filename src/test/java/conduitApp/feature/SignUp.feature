@ignore
  Feature: Sign Up new user
    Background: Preconditions
      Given url apiUrl

      Scenario: New User Sign Up
        Given def userData = {"email":"karate3@1750.com","username":"karate17503"}

        Given path 'users'
#        And request {"user":{"email":"#('Test'+userData.email)","password":"karate123","username":"#('User'+userData.username)"}}
        And request
        """
        {
          "user":
            {
              "email":"#('Test'+userData.email)",
              "password":"karate123",
              "username":"#('User'+userData.username)"
             }
        }
        """
        When method Post
        Then status 200