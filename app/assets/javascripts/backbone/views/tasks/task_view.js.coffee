BackboneTodo.Views.Tasks ||= {}

class BackboneTodo.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  events:
    "click a.destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
