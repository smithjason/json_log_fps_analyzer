$(document).ready(function(){
  $('select#acts').change(getWorldsInAct);
  $('select#worlds').change(worldsHandler);
});

var worldsHandler = function(event){
  $('button[type="submit"]').removeAttr("disabled");
};

var updateWorldsDropdown = function(data){
  var worlds = data.worlds;

  $('#worlds').removeAttr("disabled");
  $('#worlds option').remove();

  var chooseWorldOption = $('<option>',{
    text: "Choose World",
    value: "all"
  });

  chooseWorldOption.attr("disabled", true);
  chooseWorldOption.attr("selected", true);

  $('#worlds').append(chooseWorldOption);

  for(var i = 0; i < worlds.length; i++){
    var option = $('<option>', {
      text: worlds[i],
      value: worlds[i]
    });
    $('#worlds').append(option);
  }

  var allOption = $('<option>',{
    text: "All Worlds",
    value: "All"
  });

  $('#worlds').append(allOption);
};

var getWorldsInAct = function(event){
  var selectedAct = this.value;
  var ajax = $.ajax({
    url: "/acts/" + selectedAct + "/worlds",
    type: 'GET'
  });

  ajax.done(updateWorldsDropdown);
};


