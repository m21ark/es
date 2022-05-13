Feature: Open pages
  The pages should appear when we click on the respective menu options

  Scenario: login and access the main page
    When I fill the "usernameinput" field with "teste"
    And  I fill the "passwordinput" field with "******"
    And I tap the "entrar" button
    Then I expect the text "Área Pessoal" to be present


  Scenario: login and access the "Erasmus Unite" page
    When I fill the "usernameinput" field with "teste"
    And  I fill the "passwordinput" field with "******"
    And I tap the "entrar" button
    And I open the drawer
    And I tap the "key_Erasmus Unite" button
    Then I expect the widget "Erasmus Unite Title" to be present within 10 seconds
    #Then I expect the text "Erasmus Unite" to be present


  Scenario: login and access the "Erasmus Unite Universities" page
    When I fill the "usernameinput" field with "teste"
    And  I fill the "passwordinput" field with "******"
    And I tap the "entrar" button
    And I open the drawer
    And I tap the "key_Erasmus Unite" button
    And I tap the widget that contains the text "Universities"
    Then I expect the widget "Universities Main Title" to be present within 10 seconds
    #Then I expect the text "Universities Main \n\n" to be present
    And I tap the widget that contains the text "University List"
    Then I expect the widget "key_Universities List" to be present within 10 seconds


  Scenario: login and access the "Erasmus Unite Paperwork" page
    When I fill the "usernameinput" field with "teste"
    And  I fill the "passwordinput" field with "******"
    And I tap the "entrar" button
    And I open the drawer
    And I tap the "key_Erasmus Unite" button
    And I tap the widget that contains the text "Paperwork"
    Then I expect the widget "Paperwork Page Title" to be present within 10 seconds
    #Then I expect the text "Paperwork Page" to be present





