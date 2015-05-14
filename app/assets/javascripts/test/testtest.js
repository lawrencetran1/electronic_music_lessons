//
// The below code was to try to set up tutorials to add to the database
$("#submit").click( function() {
 $.post( $("#tutorialForm").attr("action"),
         $("#tutorialForm :input").serializeArray(),
         function(info){ $("#result").html(info);
  });
});

$("#tutorialForm").submit( function() {
  return false;
});

function clearInput() {
    $("#tutorialForm :input").each( function() {
       $(this).val('');
    });
}