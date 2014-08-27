//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).on("ready", function () {
  var promiseOfResult = $.getJSON("/task_lists");

  var taskListListItem = function (taskList) {
      var listItem =
        "<li>" +
          "id: " + taskList["id"] + ", " +
          "name: " + taskList["name"] +
        "</li>";

      return listItem;
    };

  var whatToDoWhenItSucceeds = function (jsonResponse) {
    var listItems = jsonResponse.map(taskListListItem);

    $('.js-output ul').html(listItems);
  };

  promiseOfResult.success(whatToDoWhenItSucceeds);
});
