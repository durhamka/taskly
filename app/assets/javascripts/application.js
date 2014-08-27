//= require jquery
//= require jquery_ujs
//= require_tree .


//function getJSON(url) {
//  return {
//    success: function (func) {
//      var data = "string";
//
//      func(data);
//    }
//  };
//}

$(document).on("ready", function () {
  var promiseOfResult = $.getJSON("/task_lists");
  // The request happens sometime in here

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

  // whatToDoWhenItSucceeds is called
});
