# Text Formatter

## Overview
This Ruby console app is my first-draft answer for a coding challenge I completed in the winter of 2018. The application takes in a text file name and prints to standard out. It uses the text from the file and removes extra spaces, formats lines to be less than 80 characters in length, and makes a new paragraph when there is more than one line break. *Details on requirements can be found in REQUIREMENTS.md in this directory.* 

1. To run the program, use `ruby format-text.rb {input_file}.txt`, passing in your text file as input.
2. To run the included tests, use `ruby test.rb`.

The included tests check each method in the `TextFormatter` class. This allows us to refactor with confidence and serves as a reliable way to isolate and identify defects down the line if something stops working as the code is being modified.

## Refactoring
You will find two versions of the application in this directory. `format-text.rb` is the first version which matches my initial submission for the code challenge. *(It corresponds to the `tests.rb` test suite.)* After receiving some feedback on the code, I refactored the app and wrote new tests. You can find the refactored code in `format-text_r2.rb` with the corresponding tests in `test_r2.rb`.

Overall, both versions of the application can format a text file and both meet the basic requirements for the challenge. The second version has a cleaner collection of methods whose functionality better corresponds to their names. Specifically, this version does a better job of separating out file I/O and the different types of string manipulation. This makes both the application code and the test code easier to read.

---

*The `interview practice` directory contains the code from a practice pair-coding session where we worked on adding functionality to capitalize the first word of each sentence. We started with the first version of my application and the experience really hi-lighted how a cleaner architecture can make future changes and additions much easier to implement. In my next re-factor of this challenge, I will also add this capitalization functionality along with more handling for cases where a period does not represent the end of a sentence or a sentence ends with a different punctuation.*  