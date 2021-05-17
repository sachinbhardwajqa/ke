@debug
Feature: Test for the home page

    Background: Define url
#        Given url 'https://conduit.productionready.io/api'
#        Given path 'users/login'
#        And request {user: {email: "karate@1750.com", password: "karate123"}}
#        When method Post
#        Then status 200
#        * def token = response.user.token

#        * def tokenResponse = call read('classpath:helper/CreateToken.feature')

#        * def tokenResponse = callonce read('classpath:helper/CreateToken.feature')
#        * def token = tokenResponse.authToken

        * def articleReqBody = read('classpath:conduitApp/json/newArticle.json')
#        * def dataGen = Java.type('helper.DataGenerator')
#        * set articleReqBody.article.title = dataGen.getRandomArticleValues().title
#        * set articleReqBody.article.description = dataGen.getRandomArticleValues().description
#        * set articleReqBody.article.body = dataGen.getRandomArticleValues().body

        Given url apiUrl

        Scenario: Create Article
#            Given header Authorization = 'Token ' + token
            And path 'articles'
#            Read from File
            And request articleReqBody
            When method Post
            Then status 200
            And match response.article.title == articleReqBody.article.title
            * def articleId = response.article.slug

#        Scenario: Delete the Article
#            Given header Authorization = 'Token ' + token
            And path 'articles',articleId
            When method Delete
            Then status 200




        