# Ruby Blog

## Overview

In this application I used Rails' scaffold scripts to build resources like `microposts` and `users` and quickly bootstrap MVC application architecture. I also configured the application to use Postgres in production and SQLite in development. I like how simple this is to do in Rails and Sinatra, making it *super* easy to not overwrite data when I am working on new features in my development environment.

It was interesting to see how like Sinatra, Rails has some helper functions that handle html form posts from the front end in a way that doesn't require tons of custom JavaScript. I still find myself leaning on JavaScript when trying to customize front end behavior, but I look forward to my next, larger Rails app where I can experiment with using views and helper-methods to accomplish more of this on the server-side.