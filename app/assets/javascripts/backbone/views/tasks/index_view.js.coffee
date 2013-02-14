BackboneTodo.Views.Tasks ||= {}

class BackboneTodo.Views.Tasks.IndexView extends Backbone.View
  
  constructor: () ->
    super
  
  template: JST["backbone/templates/tasks/index"]

  events:
    'keypress #add-task' : 'add_task_on_enter'
  
  initialize: () ->
    @options.tasks.bind('reset', @addAll)

  addAll: () =>
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new BackboneTodo.Views.Tasks.TaskView({model : task})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(tasks: @options.tasks.toJSON() ))
    return this
    
  render_one: =>
    @addOne(@options.tasks.last())
    return this

  add_task_on_enter: (event) ->
    return if event.which != 13
    task = new BackboneTodo.Models.Task(name: @$("#add-task").val(), completed: false)
    @options.tasks.create(task, {silent: true, wait: true, success: @render_one})
    @$("#add-task").val('')
