turboReady ->
  jQuery('#school_search').autocomplete
    source: (request, response) ->
      jQuery.ajax
        url: "/schools/search/#{request.term}"
        success: (data) ->
          results = jQuery.map data, (school) ->
            {
              value: school.name,
              id:    '' + school.id,
            }
          response(results)
    select: ( event, ui ) ->
      jQuery('#teaching_position_school_id').val(ui.item.id)
    minLength: 3
    delay: 200
