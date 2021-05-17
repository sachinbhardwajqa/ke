@debug
  Feature: Sign Up new user
    Background: Preconditions
      * url apiUrl
      * def dataGen = Java.type('helper.DataGenerator')
      * def timeValidator = read('classpath:helper/timeValidator.js')

      Scenario: New User Sign Up
        Given def userData = {"email":"karate5@1750.com","username":"karate17505"}
        * def randomEmail = dataGen.getRandomEmail()
        * def randomUsername = dataGen.getRandomUsername()

#        Another way to write function - randomUsername2 (changed from randomUsername)
        * def jsFunction =
        """
        function(){
          var DataGenerator = Java.type('helper.DataGenerator')
          var generator = new DataGenerator()
          return generator.getRandomUsername2()
        }
        """
        * def randomUsername2 = call jsFunction
        Given path 'users'
        And request
        """
        {
          "user":
            {
              "email":"#(randomEmail)",
              "password":"karate123",
              "username":"#(randomUsername2)"
             }
        }
        """
        When method Post
        Then status 200
        And match response ==
        """
        {
          "user":{
            "createdAt":"#? timeValidator(_)",
            "image":"##string",
            "bio":"##string",
            "id":'#number',
            "email":"#(randomEmail)",
            "updatedAt":"#? timeValidator(_)",
            "username":"#(randomUsername2)",
            "token":"#string"
           }
        }
        """