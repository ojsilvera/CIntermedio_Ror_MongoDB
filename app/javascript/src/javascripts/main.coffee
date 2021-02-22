window.PLATZI =
  init: ->
    console.log 'test coffe'
    return
$(document).on 'turbolinks:load', ->
  PLATZI.init()
