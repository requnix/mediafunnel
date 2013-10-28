window.filterShows = (event)  ->
  $this = $('#show_genre')
  jQuery.ajax
    url: "/shows?genre=#{ $this.val() }"
    type: "GET"
    success: ->
      $(location).attr('href', "/shows?genre=#{ $this.val() }")
