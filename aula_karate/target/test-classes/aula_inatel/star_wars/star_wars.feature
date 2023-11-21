Feature: Testando API StarWars

Scenario: Testando retorno 200 em people/1
    Given url "https://swapi.dev/api/people/1/"
    When method get
    Then status 200

Scenario: Testando retorno 400 em people/1234
    Given url "https://swapi.dev/api/people/1234/"
    When method get
    Then status 404

Scenario: Testando retorno 200 em planets/1
    Given url "https://swapi.dev/api/planets/1/"
    When method get
    Then status 200

Scenario: Testando retorno 400 em planets/1234
    Given url "https://swapi.dev/api/planets/1234/"
    When method get
    Then status 404
