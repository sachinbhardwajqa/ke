@ignore
Feature: Test for the home page

    Background: Define url
        Given url 'https://conduit.productionready.io/api'

#    Scenario: Get all tags
#        Given path 'tags'
#        When method Get
#        Then status 200
#        And match response.tags contains ['SIDA','Gandhi']
#        And match response.tags !contains 'cars'
#        And match response.tags == '#array'
#        And match each response.tags == '#string'
#        And match response.tags contains any ['a1','a2','a3','SIDA']
#
#    Scenario: Get articles based on limit and offset
#        Given path 'articles'
#        Given param limit = 10
#        Given param offset = 0
#        When method Get
#        Then status 200
#        And match response.articles == '#[10]'
#        And match response.articlesCount == 500
#        And match response.articlesCount != 100
#        And match response == {"articles": "#array", "articlesCount": 500}
#        And match response.articles[0].createdAt contains '2021'
#        And match response.articles[*].favoritesCount contains 1
##    Look into all values
##        And match response.articles[*].author.bio contains null
#        And match response..bio contains null
##    Search for all keys bio wherever it is located
#        And match each response..following == false



    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match each response.tags == '#string'
        And match response.tags contains any ['a1','a2','a3','SIDA']

#    Scenario: Get articles based on limit and offset
#        * def timeValidator = read('classpath:helper/timeValidator.js')
#        Given path 'articles'
#        Given param limit = 10
#        Given param offset = 0
#        When method Get
#        Then status 200
#        And match response.articles == '#[10]'
#        And match response.articlesCount == 500
#        And match response.articlesCount != 100
#        And match response == {"articles": "#array", "articlesCount": 500}
#        And match response.articles[0].createdAt contains '2021'
#        And match response.articles[*].favoritesCount contains 1
##    Look into all values
##        And match response.articles[*].author.bio contains null
#        And match response..bio contains null
##    Search for all keys bio wherever it is located
#        And match each response..following == false
##        Fuzzy Matching
##        Will check if value type of all such keys are boolean only
#        And match each response..following == '#boolean'
#        And match each response..favoritesCount == '#number'
#        And match each response..bio == '##string'
#
#        And match each response.articles ==
#        """
#            {
#                "title": "#string",
#                "slug": "#string",
#                "body": "#string",
#                "createdAt": "#? timeValidator(_)",
#                "updatedAt": "#? timeValidator(_)",
#                "tagList": "#array",
#                "description": "#string",
#                "author": {
#                    "image": "#string",
#                    "following": '#boolean',
#                    "bio": "##string",
#                    "username": "#string"
#                },
#                "favorited": '#boolean',
#                "favoritesCount": '#number'
#            }
#        """

    Scenario: Get articles based on limit and offset
        * def timeValidator = read('classpath:helper/timeValidator.js')
        Given path 'articles'
        Given param limit = 10
        Given param offset = 0
        When method Get
        Then status 200
        And match response == {"articles": "#array", "articlesCount": 500}
        And match each response.articles ==
        """
            {
                "title": "#string",
                "slug": "#string",
                "body": "#string",
                "createdAt": "#? timeValidator(_)",
                "updatedAt": "#? timeValidator(_)",
                "tagList": "#array",
                "description": "#string",
                "author": {
                    "image": "#string",
                    "following": '#boolean',
                    "bio": "##string",
                    "username": "#string"
                },
                "favorited": '#boolean',
                "favoritesCount": '#number'
            }
        """


        