// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//

// 通知用
function notifyError(title, msg) {
  new PNotify({
    title: title,
    text: msg,
    type: 'error',
    addclass: "stack-bottomleft",
    styling: 'bootstrap3'
  });
  console.log("Error: " + msg);
}
function notifySuccess(title, msg) {
  new PNotify({
    title: title,
    text: msg,
    type: 'success',
    addclass: "stack-bottomleft",
    styling: 'bootstrap3'
  });
  console.log("Success: " + msg);
}
function notifyInfo(title, msg) {
  new PNotify({
    title: title,
    text: msg,
    type: 'info',
    addclass: "stack-bottomleft",
    styling: 'bootstrap3'
  });
  console.log("Info: " + msg);
}
function notifyNotice(title, msg) {
  new PNotify({
    title: title,
    text: msg,
    type: 'notice',
    addclass: "stack-bottomleft",
    styling: 'bootstrap3'
  });
  console.log("Notice: " + msg);
}
