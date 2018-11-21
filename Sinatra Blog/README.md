# Sinatra Blog

## Overview

This app uses the Sinatra framework to serve erb layouts, allowing a user to add, update, and delete blog posts stored in a SQLite database, connected with Active Record.

## Process

Active Record is a surprisingly powerful database tool! I found myself making comparisons to Mongoose from the Node world, and Active Record made it even *easier* to keep writing Ruby code while making database calls. As another interesting observation, when building out the UI I was able to use some Sinatra form functionality to implement the entire front end without using JavaScript. I intentionally worked on learning the Sinatra framework before poking my nose back into the Rails world specifically because of its lack of scaffolding. I understand there can be significant advantages to Rails' opinionated project scaffolding functionality, but the way that I was able to use Sinatra to build common-sense API endpoints and serve up views using my own architecture that met my application's needs was a nice touch. 

In comparison to the apps I've built in Node, I found Sinatra's handling of erb layouts and page data very easy to work with *(a large part of the reason I was able to build the whole UI without JavaScript!)* I experimented with the `json` gem to serve raw JSON at a couple API endpoints similar to how I am used to architecting API's and that was still just as easy.

## Outcome

Overall this project left me feeling excited to build more web API's with Ruby! The relatively low barrier of entry for the Sinatra framework combines with the intuitive, flexible syntax of Ruby and the power of Active Record to create the perfect environment for building REST API's and web services. 
