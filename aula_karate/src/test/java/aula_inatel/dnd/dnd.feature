Feature: Testando API DnD

Background:
    * def url_base = "https://www.dnd5eapi.co/api/"

Scenario: Testando retorno 200 em spells
    Given url url_base
    And path "/spells"
    When method get
    Then status 200
    And match $.count == 319

Scenario: Testando retorno 200 para classes
    Given url url_base
    And path "/classes"
    When method get
    Then status 200
    And match $.count == 12

Scenario: Testando retorno 200 para raças
    Given url url_base
    And path "/races"
    When method get
    Then status 200
    And match $.count == 9

Scenario: Testando retorno 404 para classe inexistente
    Given url url_base
    And path "/classes/demon"
    When method get
    Then status 404

Scenario: Testando retorno 404 para raça inexistente
    Given url url_base
    And path "/races/pandarian"
    When method get
    Then status 404

Scenario: Testando retorno 404 para spell inexistente
    Given url url_base
    And path "/spells/abracadabra"
    When method get
    Then status 404
