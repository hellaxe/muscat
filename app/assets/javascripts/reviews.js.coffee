# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#review_album_id').parent().hide()
  albums = $('#review_album_id').html()
  $('#review_artist_id').change ->
    artist = $('#review_artist_id :selected').text()
    options = $(albums).filter("optgroup[label='#{artist}']").html()
    console.log options
    if options
      $('#review_album_id').html(options)
      $('#review_album_id').parent().show()
    else
      $('#review_album_id').empty()
      $('#review_album_id').parent().hide()