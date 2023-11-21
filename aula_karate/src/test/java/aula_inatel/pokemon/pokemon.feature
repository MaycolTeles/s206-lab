Feature: Testando API Pokemon

Background: Executa antes de cada teste
    * def url_base = "https://pokeapi.co/api/v2"

Scenario: Testando retorno 200 para pikachu
    Given url url_base
    And path "/pokemon/pikachu/"
    When method get
    Then status 200

Scenario: Testando retorno 200 para pikachu e verificando o JSON
    Given url url_base
    And path "/pokemon/pikachu/"
    When method get
    Then status 200
    And match response.name == "pikachu"
    And match response.id == 25

Scenario: Testando retorno 200 para pokemon red e entrando no array de idiomas do JSON
    Given url url_base
    And path "/version/1"
    When method get
    Then status 200
    And def idioma = $response.names[5].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    And match response.name == "es"
    And match response.id == 7

Scenario: Testando retorno 200 para hitmonlee e verificando o JSON
    Given url url_base
    And path "/pokemon/hitmonlee/"
    When method get
    Then status 200
    And match response.name == "hitmonlee"
    And match response.id == 106
    And match response.abilities[0].ability.name == "limber"

Scenario: Testando retorno 200 para charizard e verificando o JSON
    Given url url_base
    And path "/pokemon/charizard/"
    When method get
    Then status 200
    And match response.name == "charizard"
    And match response.id == 6
    And match response.abilities[0].ability.name == "blaze"
    And def localizacao = $response.location_area_encounters
    And print localizacao
    And url localizacao
    When method get
    Then status 200