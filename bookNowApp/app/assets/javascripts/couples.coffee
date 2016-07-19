# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $('.clickable-row').click ->
    Turbolinks.visit $(this).data('url')
    # window.document.location = $(this).data("url");
    return
  return
