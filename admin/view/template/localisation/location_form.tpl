<?php echo $header; ?>
<script src="//maps.google.com/maps/api/js?key=AIzaSyC0R5qXRO_jgesJHdywgyYYG6UKEeGrYAU&libraries=drawing,geometry,places&language=vi" type="text/javascript"></script>

<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-location" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
          <a href="<?php echo $breadcrumb['href']; ?>">
            <?php echo $breadcrumb['text']; ?>
          </a>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
      <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-location" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger">
                <?php echo $error_name; ?>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="col-sm-7">
            <div class="form-group required">
              <label class="col-sm-3 control-label" for="input-address"><?php echo $entry_address; ?></label>
              <div class="col-sm-9">
                <input type="text" name="address" autocomplete="off" value="<?php echo $address; ?>" id="input-address" placeholder="<?php echo $entry_address; ?>" class="form-control" />
                <?php if ($error_address) { ?>
                <div class="text-danger">
                  <?php echo $error_address; ?>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="input-geocode"><span data-toggle="tooltip" data-container="#content" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
              <div class="col-sm-9">
                <input type="text" name="geocode" value="<?php echo $geocode; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode" class="form-control" />
              </div>
            </div>
          </div>
          <div class="col-sm-5">
            <div id="mapCanvas"></div>
          </div>


          <div class="form-group">

          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger">
                <?php echo $error_telephone; ?>
              </div>
              <?php  } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-country" class="form-control">
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-zone" class="form-control"></select>
            </div>
          </div>


          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-manufacturer">Loại</label>
            <div class="col-sm-10">
              <select name="manufacturer_id" id="input-manufacturer" class="form-control">
                <option value="1">Show Room</option>
                <option value="2">Đại lý</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-open"><span data-toggle="tooltip" data-container="#content" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
            <div class="col-sm-10">
              <textarea name="open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="form-control"><?php echo $open; ?></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-comment"><span data-toggle="tooltip" data-container="#content" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
            <div class="col-sm-10">
              <textarea name="comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
            </div>
          </div>
        </form>

        <style>
          body {
            font-family: arial;
            font-size: 13px;
          }

          #mapCanvas {
            width: 100%;
            height: 300px;
            float: left;
          }

          #infoPanel {
            float: left;
            margin-left: 10px;
          }

          #infoPanel div {
            margin-bottom: 5px;
          }
        </style>



      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
  <!--
  // Manufacturer
  $('input[name=\'manufacturer\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          json.unshift({
            manufacturer_id: 0,
            name: '<?php echo $text_none; ?>'
          });

          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['manufacturer_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'manufacturer\']').val(item['label']);
      $('input[name=\'manufacturer_id\']').val(item['value']);
    }
  });
</script>

<script type="text/javascript">
  <!--


  $('select[name=\'country_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,

      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');

  -->
</script>



<script type="text/javascript">
  var geocoder = new google.maps.Geocoder();

  function geocodePosition(pos) {
    geocoder.geocode({
      latLng: pos
    }, function(responses) {
      if (responses && responses.length > 0) {
        updateMarkerAddress(responses[0].formatted_address.replace(",", "").split(": "));
        //alert(responses[0]);
      } else {
        updateMarkerAddress('Keine Koordinaten gefunden!');
      }
    });
  }


  function updateMarkerPosition(latLng) {
    document.getElementById('input-geocode').value = [
      latLng.lat(),
      latLng.lng()
    ].join(', ');

  }

  function updateMarkerAddress(str) {
    document.getElementById('input-address').value = str;
    //document.getElementById('input-address').addClass = 'djsahd';
  }

  function initialize() {
    var latLng = new google.maps.LatLng(<?php echo $geocode; ?>);
    var map = new google.maps.Map(document.getElementById('mapCanvas'), {
      zoom: 12,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false,
      mapTypeControl: false

    });
    var marker = new google.maps.Marker({
      position: latLng,
      map: map,
      draggable: true,
      title: "Sie können mich per Drag & Drop auf das gewünschte Ziel setzen. Oder im Suche feld den Ort eingeben und auswählen."
    });

    var input = document.getElementById('input-address');
    var autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.bindTo('bounds', map);

    // Update current position info.
    updateMarkerPosition(latLng);
    //geocodePosition(latLng);

    // Add dragging event listeners.
    google.maps.event.addListener(marker, 'dragstart', function() {
      updateMarkerAddress('Đang ké thả...');
    });

    google.maps.event.addListener(marker, 'drag', function() {
      updateMarkerPosition(marker.getPosition());
    });

    google.maps.event.addListener(marker, 'dragend', function() {
      geocodePosition(marker.getPosition());
    });

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      input.className = '';
      var place = autocomplete.getPlace();
      if (!place.geometry) {
        // Inform the user that the place was not found and return.
        input.className = 'notfound';
        return;
      }

      // If the place has a geometry, then present it on a map.
      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17); // Why 17? Because it looks good.
      }
      marker.setPosition(place.geometry.location);
      updateMarkerPosition(marker.getPosition());
      //geocodePosition(marker.getPosition());

    });
  }

  // Onload handler to fire off the app.
  google.maps.event.addDomListener(window, 'load', initialize);
</script>

<?php echo $footer; ?>
