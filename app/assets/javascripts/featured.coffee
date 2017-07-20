# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Featured
  constructor: ->
    console.log 'init: Featured'

    $('.ui.accordion').accordion()


$(document).on 'turbolinks:load', ->
  if $(document.body).hasClass('featured')
    new Featured()
