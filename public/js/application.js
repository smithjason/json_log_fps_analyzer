$(document).ready(function(){
  $('select#acts').change(getWorldsInAct);
});

var updateWorldsDropdown = function(data){
  var worlds = data.worlds;
  for(var i = 0; i < worlds.length; i++){
    var option = $('<option>', {
      text: worlds[i],
      value: worlds[i]
    });
    $('#worlds').append(option);
  }
};

var getWorldsInAct = function(event){
  console.log(event);
  console.log("DOM OBJECT ****");
  console.log(this.value);
  var selectedAct = this.value;
  var ajax = $.ajax({
    url: "/acts/" + selectedAct + "/worlds",
    type: 'GET'
  }).done(updateWorldsDropdown);
};
