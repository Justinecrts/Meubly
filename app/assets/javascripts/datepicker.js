$(document).ready(function(){
  $('input[name="daterange"]').daterangepicker({
      "startDate": "02/09/2017",
      "endDate": "02/15/2017",
      "opens": "left"
  }, function(start, end, label) {
    console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
  });
 });
