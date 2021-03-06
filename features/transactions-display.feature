Feature: Display wallet transactions

  The wallet summary screen displays the five most recent transactions,
  sorted by creation date (newest first). If there are more than five
  transactions it shows a "show more transactions" button to redirect
  to the wallet transactions screen where all are listed.

  Background:
    Given I have completed the basic setup
    And I have a "Genesis wallet" with funds
    And I have the following wallets:
      | name   |
      | TargetWallet |

  Scenario: No recent transactions
    When I am on the "TargetWallet" wallet "summary" screen
    Then I should not see any transactions
    And I should see the no recent transactions message
    When I am on the "TargetWallet" wallet "transactions" screen
    Then I should not see any transactions
    And I should see the no recent transactions message

  Scenario: More than five transactions
    Given I have made the following transactions:
      | sender         | receiver      | amount |
      | Genesis wallet | TargetWallet  | 1      |
      | Genesis wallet | TargetWallet  | 2      |
      | Genesis wallet | TargetWallet  | 3      |
      | Genesis wallet | TargetWallet  | 4      |
      | Genesis wallet | TargetWallet  | 5      |
      | Genesis wallet | TargetWallet  | 6      |
    When I am on the "TargetWallet" wallet "summary" screen
    Then I should see the following transactions:
      | type   | amount |
      | income | 6      |
      | income | 5      |
      | income | 4      |
      | income | 3      |
      | income | 2      |
    When I click on the show more transactions button
    Then I should be on the "TargetWallet" wallet "transactions" screen
    Then I should see the following transactions:
      | type   | amount |
      | income | 6      |
      | income | 5      |
      | income | 4      |
      | income | 3      |
      | income | 2      |
      | income | 1      |
