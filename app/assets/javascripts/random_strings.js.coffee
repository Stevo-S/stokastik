# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

console.log('Loading random_strings.js ...')

$ ->
  $('#select_all_random_strings').change ->
    currentValue = $('#select_all_random_strings').prop('checked')
    $('input[type="checkbox"]').prop('checked', currentValue)
    
console.log('Loaded random_strings.js')