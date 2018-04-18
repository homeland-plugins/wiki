# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
window.WikiView = Backbone.View.extend
  el: "body"
  events:
    "click .editor-toolbar .preview": "togglePreviewView"

  initialize: (opts) ->
    @parentView = window._appView
    $("<div id='preview' class='markdown form-control'></div>").insertAfter($("#page_body"))
    $("#preview").hide()
    window._editor = new Editor()

  togglePreviewView: (e) ->
    textarea = $("#page_body")
    preview_box = $("#preview")

    if $(e.target).hasClass("active")
      $(e.target).removeClass("active")
      preview_box.hide()
      textarea.show()
    else
      $(e.target).addClass("active")
      preview_box.show()
      preview_box.css("height", textarea.height())
      textarea.hide()
      this.preview(preview_box, textarea.val())
    return false

  preview: (preview_box, val) ->
    $.post '/wiki/preview', { body: val }, (data)->
      preview_box.html(data)
      false
    false

document.addEventListener 'turbolinks:load',  ->
  if $('body').data('controller-name') in ['pages']
    window._wikiView = new WikiView()
