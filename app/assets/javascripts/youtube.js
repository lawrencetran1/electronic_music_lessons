var vidHeight = 400;
var vidWitdh = 600;
var results = 3;
var keyword = "tutorial";

$(document).ready(function(){

  $.get(
    'https://www.googleapis.com/youtube/v3/search', 

    	{
      	part: 'snippet',
      	channelId: 'UCwjiBFz7LuxYvmIRw5kChFA',
      	key: 'AIzaSyC3N_wXv7GRGU2ZPViN3PNW8W9_FyzOtBY',
      	maxResults: results,
      	order: 'viewCount',
      	q: keyword 
      },

      function(data){
        $.each(data.items,function(i, item){
          console.log(item);
          videTitle = item.snippet.title;
          videoId = item.id.videoId;
          output = '<li><iframe height ="'+vidHeight+'" width= "'+vidWitdh+'" src=\"//www.youtube.com/embed/'+videoId+'\"</iframe></li>';
          $('#results').append(output);
        });
      }
  );
});

