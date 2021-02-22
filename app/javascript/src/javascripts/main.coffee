window.PLATZI =
  init: ->
    console.log 'test coffe'
    PLATZI.misc.selectizeByScope('body')
    return
  tasks:
    form:
      setup: ->
        $('.participants').on 'cocoon:before-insert', (e, insertedItem, originalEvent) ->
          PLATZI.misc.selectizeByScope insertedItem
        return
  misc:
    selectizeByScope: (selector) ->
      $(selector).find('.selectize').each (i, el) ->
        $(el).selectize()
      return
$(document).on 'turbolinks:load', ->
  PLATZI.init()
