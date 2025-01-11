Feature: Categories
As a REST API consumer, I want to fetch all categories in the shop and verify that every main category has at least one product.

  Background:
    Given that I am on the domain "http://localhost:4000"

  Scenario: Get a list of all categories
    When I visit the endpoint "GET" "/api/leftMenu/categorytree"
    Then the status code of the response should be 200
    And the response time should be below 1000 milliseconds
    And there should be at least 10 main categories
    And there should be at least 100 subcategories

  Scenario Outline: Visiting a main category
    When I visit the endpoint "GET" "/api/c/{categoryUrlPart}?size=30&page=0&sort=topRated"
    Then the status code of the response should be 200
    And the response time should be below 1000 milliseconds
    And there should be at least 1 product in the main category
    Examples:
      | {dynamic: 'categories'} |


  Scenario Outline: Visiting a category
    When I visit the endpoint "GET" "/api/c/{subcategoryUrlPart}?size=30&page=0&sort=topRated"
    Then the status code of the response should be 200
    And the response time should be below 1000 milliseconds
    And there should be at least 1 product in the category
    Examples:
      | {dynamic: 'subcategories'} |