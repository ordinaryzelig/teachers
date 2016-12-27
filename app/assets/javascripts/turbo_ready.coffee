window.turboReady = (func) ->
  jQuery(document).on("turbolinks:load", func)
