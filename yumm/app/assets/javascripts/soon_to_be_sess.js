function readButton(btn) {
  var btnid = btn.id.toString();

  var arr_exists = sessionStorage.length;
  if (arr_exists == 0) {
    sessionStorage.setItem("arr", btnid);
    return;
  }

  prev = sessionStorage.getItem("arr").toString();
  nxt = prev.concat(btnid);
  sessionStorage.setItem("arr", nxt);

  var arr_size = (sessionStorage.getItem("arr").length);
  if (arr_size >= 4){
    //TODO POST sessionStorage arr to sessions controller
    //
    //jQuery ajax post
    //////$.post("AJAX_POST_URL",
    //////{name:"ravi",age:"31"},
    //////function(data, textStatus, jqXHR)
    //////{
    //////      //data: Received from server
    //////});/
    //
    //
    $.post( "/signin", { /* sessionsController params here */ });
    //
    sessionStorage.removeItem("arr");
  }


  //}else{
  //  alert("I contain: " sessionStorage.getItem("arr"));
  //}
  //}else{
  //  var prev = sessionStorage.getItem("arr");
  //  prev = prev.concat(btn.id.toString());
  //  sessionStorage.setItem("arr", prev);
  //}


  ////read in button
  //btnid = btn.id.toString();
  ////get old button presses
  //prev_buttons = sessionStorage.getItem("arr");
  //new_arr = prev_buttons.concat(btnid)


  //sessionStorage.setItem("arr", btnid)
  //alert("Array is now: " + btnid);
  //sessionStorage.setItem("arr", "");
}


//$(function(){
//  //Write buffer
//  var $write = $('#write');
// 
//  $('#keypad p').click(function(){
//    var $this = $(this), 
//    character = $this.html();
//    alert("Pressed the button: " + character);
//    $write.html($write.html() + character);
//  });
//});

