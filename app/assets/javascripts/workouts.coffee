# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Workouts
  constructor: ->
    console.log 'init: Workouts'

    $('.ui.accordion').first().accordion()
    $('.dropdown').dropdown()


$(document).on 'turbolinks:load', ->
  if $(document.body).hasClass('workouts')
    new Workouts()

