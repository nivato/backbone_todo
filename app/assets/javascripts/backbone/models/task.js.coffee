class BackboneTodo.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    name: null
    completed: null

class BackboneTodo.Collections.TasksCollection extends Backbone.Collection
  constructor: () ->
    super
    
  model: BackboneTodo.Models.Task
  url: '/tasks'
