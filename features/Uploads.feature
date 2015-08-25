Feature: Upload files

  Scenario: Task 1 - Straightforward upload 1 local
    Then Upload but do not save img 1 local

  Scenario: Task 1 - Straightforward upload 1 git
    Then Upload but do not save img 1 git

  Scenario: Task 1 - Straightforward upload local
    Then Upload but do not save img local

  Scenario: Task 1 - Straightforward upload git
    Then Upload but do not save img git

  Scenario: Task 2 - Randomize it local
    Then Create a loop, which will grab random pics let it be 3, upload them one by one local

  Scenario: Task 2 - Randomize it git
    Then Create a loop, which will grab random pics let it be 3, upload them one by one git

  Scenario: Task 2: Uploads local
    Then Upload file, not submit - please not heavy one local

  Scenario: Task 2: Uploads git
    Then Upload file, not submit - please not heavy one git