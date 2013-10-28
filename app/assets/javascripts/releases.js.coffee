window.getEpisodes = (event) ->
  $this = $('#show_slug')
  jQuery.ajax
    url: "/shows/#{ $this.val() }/episodes.json"
    type: "GET"
    success: (data) ->
      options = ""
      options += "<option value='#{episode._id.$oid}'>#{episode.identifier.replace /.+\s/g, ''}</option>" for episode in data
      $('#release_releasable_id').html(options)
