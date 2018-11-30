# Text Formatter

This Ruby console app is my first-draft answer for a coding challenge I completed in the winter of 2018. The application takes in a text file name and prints to standard out. It uses the text from the file and removes extra spaces, formats lines to be less than 80 characters in length, and makes a new paragraph when there is more than one line break. *Details on requirements can be found in REQUIREMENTS.md in this directory.* 

1. To run the program, use `ruby format-text.rb {input_file}.txt`, passing in your text file as input.
2. To run the included tests, use `ruby test.rb`.

The included tests check each method in the `TextFormatter` class. This allows us to refactor with confidence and serves as a reliable way to isolate and identify defects down the line if something stops working as the code is being modified.