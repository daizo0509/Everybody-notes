# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  new Vue
    el: '#markdown_editor'
    data:
      input: '# Markdown記法で記入してください '
    filters:
      marked: marked

