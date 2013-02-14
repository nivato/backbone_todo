class BackboneTodo.Routers.TasksRouter extends Backbone.Router

  routes:
    ""          : "index"
  
  index: ->
    tasks = new BackboneTodo.Collections.TasksCollection()
    @view = new BackboneTodo.Views.Tasks.IndexView(tasks: tasks)
    $("#tasks").html(@view.render().el)
    tasks.fetch()
