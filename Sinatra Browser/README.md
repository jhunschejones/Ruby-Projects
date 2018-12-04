# Sinatra Browser

This is the simplest possible application to test a New Relic APM-injected Browser Pro agent-monitored web page.

To configure the New Relic agents:
1. Open `config/newrelic.yml` and add your APM key to the `license_key` field.

To run the app:
1. Navigate to this directory in your terminal and run `sudo bundle install`.
2. After installing the necessary Ruby gems, run `ruby sinatra_browser.rb` to launch the app.
3. Navigate to `http://localhost:4567/` to send traffic to the web page.

Additional Notes:
The static page being served is inside the `views` directory. It is an .erb file, but you can use plain HTML in it if you would like to serve your own web page instead!
