#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BackboneTodo =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new BackboneTodo.Routers.TasksRouter
    Backbone.history.start()

$(document).ready ->
  BackboneTodo.init()
