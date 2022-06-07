Feature: Open pages
   The pages should appear when we click on the respective menu options

   Scenario: login and access the main page
      #When I fill the "usernameinput" field with "20200000"
      #And  I fill the "passwordinput" field with "******"
      #And I tap the "entrar" button
      Then I expect the text "Área Pessoal" to be present


   Scenario: access the "Erasmus Unite" page
      #When I fill the "usernameinput" field with "202000000"
      #And  I fill the "passwordinput" field with "**********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      Then I expect the widget "Erasmus Unite Title" to be present within 10 seconds



   Scenario: access the "Erasmus Unite Universities" page
      #When I fill the "usernameinput" field with "202000000"
      #And  I fill the "passwordinput" field with "**********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Universities"
      Then I expect the widget "Universities Main Title" to be present within 10 seconds
      And I tap the widget that contains the text "University List"
      Then I expect the widget "key_Universities List" to be present within 10 seconds


   Scenario: access the "Erasmus Unite Paperwork" page
      #When I fill the "usernameinput" field with "20200000"
      #And  I fill the "passwordinput" field with "*********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Paperwork"
      Then I expect the text "Paperwork" to be present


   Scenario: access the "Erasmus Unite Single University" page
      #When I fill the "usernameinput" field with "20200000"
      #And  I fill the "passwordinput" field with "*********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Universities"
      Then I expect the widget "Universities Main Title" to be present within 10 seconds
      And I tap the widget that contains the text "University List"
      Then I expect the widget "key_Universities List" to be present within 20 seconds
      And I tap the widget that contains the text "FEUP"
      Then I expect the widget "key_uni_page_expenses" to be present within 10 seconds
      Then I expect the widget "key_uni_page_experience" to be present within 10 seconds
      Then I expect the widget "key_uni_page_knowledge" to be present within 10 seconds
      Then I expect the widget "key_uni_page_country" to be present within 10 seconds


   Scenario: access the "Erasmus Unite University Make Review" page
      #When I fill the "usernameinput" field with "202000000"
      #And  I fill the "passwordinput" field with "**********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Universities"
      Then I expect the widget "Universities Main Title" to be present within 10 seconds
      And I tap the widget that contains the text "University List"
      Then I expect the widget "key_Universities List" to be present within 10 seconds
      And I tap the widget that contains the text "FEUP"
      And I tap the "key_make_reviews" widget
      Then I expect the text "Make Review" to be present

   Scenario: access the "Erasmus Unite University Make Review" page
      #When I fill the "usernameinput" field with "202000000"
      #And  I fill the "passwordinput" field with "**********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Universities"
      Then I expect the widget "Universities Main Title" to be present within 10 seconds
      And I tap the widget that contains the text "University List"
      Then I expect the widget "key_Universities List" to be present within 10 seconds
      And I tap the widget that contains the text "FEUP"
      And I tap the "key_see_reviews" widget
      Then I expect the widget "key_reviews_list" to be present within 10 seconds


   Scenario: access the "Erasmus Unite Students List" page
      #When I fill the "usernameinput" field with "202000000"
      #And  I fill the "passwordinput" field with "**********"
      #And I tap the "entrar" button
      When I open the drawer
      And I tap the "key_Erasmus Unite" button
      And I tap the widget that contains the text "Students"
      Then I expect the widget "key_students_list" to be present within 10 seconds


