# App Checker

## Overview
This console application for Mac OSX will check a list of apps against the apps in your Applications directory to see if they are all installed. Additionally, it will put together an x-callback-url for the Bear notes application. After running `app_checker.rb`, you can copy the provided URL into a web browser and a Bear note will be created showing which applications were found and which still need to be dowloaded. Don't use [**Bear**](https://bear.app/) to write beautiful, markdown-enhanced notes? No worries, `app_checker.rb` also provides plain text output indicating which of the required applications were not found on your computer.

I created the application because in the multi-media world, I find myself re-installing operating systems on computers semi-frequently. A frustrating part of this process can be trying to find an old list of required applications I need to check for, then looking at which ones are already installed and starting a list for those I still need to install. Now I can simply make sure my required application list in `app_checker.rb` is up to date when adding an important program, and I will always be set to go for a speedy install process on new systems!

## Process
To watch my build process in action, make sure to check out `app_checker_r1.rb`. This was the first implementation of the application, sketching out the main requirements and some ways I might implement them. I then refactored the code into smaller functions to both improve readability and to make the code easier to test. Finally, I wrote the `test.rb` file, which contains some basic tests for important functionality of the application. *NOTE: There are some areas of this app that will differ from system to system so they are left out of the test for now. This does result in a less-robust test suite and it is definitely an area for potential improvement in the future.*

## Outcome
To run the application:
1. Download this directory or the `app_checker.rb` file directly.
2. In the terminal, navigate into the directory with `app_checker.rb`.
3. Run `ruby app_checker.rb` in the terminal. 
4. Follow the prompts to use the application.

To run the included tests:
1. Download this directory or the `app_checker.rb` and `test.rb` files directly.
2. In the terminal, navigate into the directory with `app_checker.rb` and `test.rb`.
3. Run `ruby test.rb` in the terminal. 