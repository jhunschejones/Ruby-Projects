# Text Formatter

## Overview
This Ruby console app is part of a coding challenge I completed in the winter of 2018 and early 2019. The application takes in a text file name and prints to standard out. It uses the text from the file and removes extra spaces, formats lines to be less than 80 characters in length, and makes a new paragraph when there is more than one line break. *Details on requirements can be found in REQUIREMENTS.md in this directory.* The included tests check each method in the `TextFormatter` class. This allows us to refactor with confidence and serves as a reliable way to isolate and identify defects down the line if something stops working as the code is being modified.

## Refactoring
You will find a few versions of the application in this directory. `r1` is the first version which matches my initial submission for the code challenge *(including tests).* After receiving some feedback on the code, I refactored the app and wrote new tests. You can find the refactored code in `r2` along with the corresponding tests. In this first refactor I still approached the problem head-on but attempted to split out the functionality of the app a little more so it might not be as entangled as `r1`.

  * The `interview practice` directory in `r1` contains the code from a practice pair-coding session where we worked on adding functionality to capitalize the first word of each sentence. We started with the first version of my application and the experience really hi-lighted how a cleaner architecture can make future changes and additions much easier to implement. 

`r3` is the next version of the app, taking into account lessons I learned during my code pairing practice and including a more complete implementation the capitalize function we started on. The biggest different in how I wrote the code this time around was that I *first* stepped back and broke the problem into meaningful function names, defining what I wanted to do in each. I then worked through the functions individually, writing first a test then application code, then refactoring when applicable. I tried to separate out concerns further and think ahead about other additions that could be made down the line in order to write an app that was more extensible than `r1` was.

## Try It Out
1. Navigate to the directory for the version in question (`r1`, `r2`, `r3`)
2. To run the program, use `ruby format-text.rb {input_file}.txt`, passing in your text file as input.
3. To run the included tests, use `ruby test.rb`.