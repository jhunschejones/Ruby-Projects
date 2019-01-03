# Generator

## Overview
`generator` is a Ruby console app that allows a user to input text information and create their own name/phrase generator web app. The end product is an HTML file that will run in any browser and generates funny combinations of words. 

I created the original HTML application as a joke to generate realistic sounding yet nonsensical SaaS job position titles for my coworkers and we found it to be quite entertaining. I realized the reason users enjoyed the app so much was because it was about a context where we all had a great deal of specific experience. This Ruby generator app is my follow-up tool to allow others to manipulate a similar HTML application to fit *their* context and hopefully provide a laugh to friends and coworkers.

### User Customizable Elements:
- [x] Image URL
- [x] Generator name *(name generator, flavor generator, etc.)*
- [x] Middle words array
- [x] Start words array
- [x] End words array
- [x] Color scheme *(changes colors for generated names and the button element)*
- [x] Phrase length
- [x] Choose whether or not to show acronym element after the generated name/phrase

## Outcome
To use the application:
1. Download the `generator.rb` file
2. Make sure Ruby is installed on your machine (`ruby -v)`
3. To run the application, navigate in your terminal to the directory where the `generator.rb` file is located and run `ruby generator.rb` 
	  * *The application will give you prompts for required information*