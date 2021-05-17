@ignore
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

        Given url apiUrl

        Scenario: Create Article
#            Given header Authorization = 'Token ' + token
            And path 'articles'
            And request {article: {tagList: [], title: "Title3", description: "About", body: "Description"}}
            When method Post
            Then status 200
            And match response.article.title == 'Title3'
            * def articleId = response.article.slug

#        Scenario: Delete the Article
#            Given header Authorization = 'Token ' + token
            And path 'articles',articleId
            When method Delete
            Then status 200




        