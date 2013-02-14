BackboneTodo.Views.Tasks ||= {}

class BackboneTodo.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  events:
    "click a.destroy" : "destroy"
    "click .completed" : "update_completed"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
  
  update_completed: () ->
    if @model.get("completed")
      @model.save(completed: false, {silent: true, wait: true, success: @update_view_completed})
    else
      @model.save(completed: true, {silent: true, wait: true, success: @update_view_completed})

  update_view_completed: () =>
    @$(".completed").text(@model.get("completed"))
