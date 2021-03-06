// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require activestorage
//= require turbolinks
//= require_tree .
//= require gritter
//= require font_awesome5

 function isChecked(){
 var user_superadmin_role = document.getElementById('user_superadmin_role').checked;
 var user_airline_manager_role = document.getElementById('user_airline_manager_role').checked;
 var user_airport_manager_role = document.getElementById('user_airport_manager_role').checked;
 var user_client_role = document.getElementById('user_client_role').checked;
 
 if(user_superadmin_role==false && user_airline_manager_role == false && user_airport_manager_role==false && user_client_role==false){
 alert('Please select a role!');
 return false;
 }
 else{
 return true;
 }
 } 

// Regular map
        function regular_map() {
            var var_location = new google.maps.LatLng(40.725118, -73.997699);

            var var_mapoptions = {
                center: var_location,
                zoom: 14
            };

            var var_map = new google.maps.Map(document.getElementById("map-container"),
                var_mapoptions);

            var var_marker = new google.maps.Marker({
                position: var_location,
                map: var_map,
                title: "New York"
            });
        }

        // Initialize maps
        google.maps.event.addDomListener(window, 'load', regular_map);

// Carousel options

$('.carousel').carousel({
            interval: 3000,
        })

$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})