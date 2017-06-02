var marker, i;
var map = null;
var markers = [];
var bounds = new google.maps.LatLngBounds();
var GoogleMaps =
{
    locations: [],
    infowindow: null,
    init: function () {
        var divMap = document.getElementById('map');
        map = new google.maps.Map(divMap, {
            zoom: 10,
            scrollwheel: false,
            styles: [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}],
            center: new google.maps.LatLng(parseFloat(divMap.getAttribute("data-lat")), parseFloat(divMap.getAttribute("data-lng"))),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        GoogleMaps.infowindow = new google.maps.InfoWindow();
    },
    setupMarkers: function () {
        GoogleMaps.clearMarkers();
        for (i = 0; i < GoogleMaps.locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(GoogleMaps.locations[i][1], GoogleMaps.locations[i][2]),
                map: map
            });
            markers.push(marker);
            bounds.extend(marker.getPosition());
            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    GoogleMaps.showInforWin(marker, i);
                }
            })(marker, i));
        }
        // Don't zoom in too far on only one marker
        if (bounds.getNorthEast().equals(bounds.getSouthWest())) {
            var extendPoint1 = new google.maps.LatLng(bounds.getNorthEast().lat() + 0.01, bounds.getNorthEast().lng() + 0.01);
            var extendPoint2 = new google.maps.LatLng(bounds.getNorthEast().lat() - 0.01, bounds.getNorthEast().lng() - 0.01);
            bounds.extend(extendPoint1);
            bounds.extend(extendPoint2);
        }
        map.fitBounds(bounds);
    },
    clearMarkers: function () {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers.length = 0;
    },
    showInforWin: function (marker, i) {
        GoogleMaps.infowindow.setContent('<h3>' + GoogleMaps.locations[i][0] + '</h3>' + ' ' + GoogleMaps.locations[i][3] + '</br>' + GoogleMaps.locations[i][6]);
        GoogleMaps.infowindow.open(map, marker);
        // map.setZoom(14);
    }
}