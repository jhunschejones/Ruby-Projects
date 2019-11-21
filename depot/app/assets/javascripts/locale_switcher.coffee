# hide locale submit button if JS is enabled in the browser
document.addEventListener 'turbolinks:load', ->
  document.getElementById('submit_locale_change').style.display='none'
