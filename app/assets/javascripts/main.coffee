# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $(document).on 'turbolinks:load', ()->
#  componentHandler.upgradeDom()
window.snack = (options)->
  document.querySelector("#global-snackbar")
          .MaterialSnackbar.showSnackbar(options)

$(document).on "page:load page:fetch ready", ()->
  $(".best_in_place").best_in_place()
  $('.mdl-layout').scroll ->
    if !window.loading && $('.mdl-layout').scrollTop() > ($(document).height() / 2) - 100
      window.loading = true
      url = $('.next_page').attr('href')
      $.getScript url if url
