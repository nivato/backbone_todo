BackboneTodo.Views.Tasks ||= {}

class BackboneTodo.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  events:
    "click a.destroy"       : "destroy"
    "click .completed"      : "update_completed"
    "click .task-name"      : "edit_name"
    "focusout .edit-name"   : "focusout_edit_name"
    "keypress .edit-name"   : "update_name"

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
    @$(".completed").html("<a href='#'><img src='assets/#{@model.get('completed')}.png' /></a>" )

  edit_name: () ->
    input_value = @$(".task-name").text()
    @$(".task-name").text("")
    @$(".task-name").html("<div class='custom-input'><input type='text' class='edit-name' value='#{input_value}' /></div>")
    @$(".task-name").attr("class", "task-name-editable")
    @$(".edit-name").focus()

  focusout_edit_name: () =>
    @$(".edit-name").remove()
    @$(".custom-input").remove()
    @$(".task-name-editable").text(@model.get("name"))
    @$(".task-name-editable").attr("class", "task-name")

  update_name: (event) ->
    return if event.which != 13
    @model.save(name: @$(".edit-name").val(), {silent: true, wait: true, success: @focusout_edit_name})
