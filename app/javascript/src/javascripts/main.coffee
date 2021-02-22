window.PLATZI =
  init: ->
    console.log 'test coffe'
    PLATZI.misc.selectizeByScope('body')
    return
  misc:
    selectizeByScope: (selector) ->
      $(selector).find('.selectize').each (i, el) ->
        $(el).selectize()
      return
$(document).on 'turbolinks:load', ->
  PLATZI.init()
