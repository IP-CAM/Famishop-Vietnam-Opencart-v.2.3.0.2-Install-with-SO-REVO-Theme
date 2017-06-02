<?php echo $header; ?>

<div class="sub">
	<div class="title-brand"><h3 class="shortcodeTitle"><?php echo $heading_title; ?></h3><div class="shortcode-content-html"></div></div>
	<div class="container text-center">
		<ul class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	  </ul>
	</div>
</div>
<div class="container contacts">
 
  <div class="main">

    <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
    <?php echo $content_top; ?>
      <div class="info-contact row">

        <div class="col-sm-6 col-xs-12 col-sm-offset-3 contact-form">
           <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend><h2><?php echo $text_contact; ?></h2></legend>
              <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
              <div class="form-group required">
                <div class="col-sm-12">
                  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" placeholder="<?php echo $entry_name; ?>*"/>
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" placeholder="<?php echo $entry_email; ?>*" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <textarea name="enquiry" rows="10" id="input-enquiry" placeholder="<?php echo $entry_enquiry; ?>*" class="form-control"><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
              </div>
              <?php echo $captcha; ?>
            </fieldset>
            <div class="buttons">
              <div class="text-center">
                <button class="btn btn-default" type="submit"><span><?php echo $button_submit; ?></span></button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <br>
    </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<div class="row">
  <div class="map-contact">
  <div id="map" class="map-img" style="width:100%; height:650px" data-lat="14.960043" data-lng="107.874756">

  </div>

  <div class="store">
      <ul class="listitem">
              <li data-stt="0" class="item">
                  <h3>Head Office <a data-stt="0" target="_blank" href="http://maps.google.com/maps?q=10.778250,106.702028" class="view-map">Xem bản đồ</a></h3>

                  <p>
                    61/11 đường Cô Giang, phường Cầu Ông Lãnh, quận 1, TP. Hồ Chí Minh <br>
                    Điện thoại: 08.3838.6706<br>
                    Email: dang-thu.phuong@grassroots.com.vn
                  </p>

              </li>
              <li data-stt="1" class="item">
                  <h3>Brand Office <a data-stt="1" target="_blank" href="http://maps.google.com/maps?q=21.022479,105.8510383" class="view-map">Xem bản đồ</a></h3>

                  <p>
                    Phòng 321, Tầng 2, Tòa nhà 71 Nguyễn Chí Thanh, quận Đống Đa, Hà Nội<br>
                    Điện thoại: 08.3838.6706<br>
                    Email: dang-thu.phuong@grassroots.com.vn
                  </p>

              </li>

      </ul>
  </div>
</div>

</div>


<script src="//maps.google.com/maps/api/js?key=AIzaSyC0R5qXRO_jgesJHdywgyYYG6UKEeGrYAU&libraries=drawing,geometry,places&language=vi"></script>
<script src="/catalog/view/javascript/goolemaps.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            GoogleMaps.locations = [
                    ['Head Office', 10.778250, 106.702028, '19F, 72 Le Thanh Ton Street, Ben Nghe Ward, District 1, Ho Chi Minh City', '', '(84-8) 3936 9425', '(84-8) 3936 9420'],
                    ['Brand Office', 21.022479, 105.8510383, 'Phu Dien Tower, 3th Floor,  83A Ly Thuong Kiet Street, Hoan Kiem District, Ha Noi City, Vietnam', '', '(84-4) 3936 6211', '(84-4) 3936 6211'],

            ];
            GoogleMaps.init();
            GoogleMaps.setupMarkers();
            $(".listitem .item a").click(function (evt) {
                evt.preventDefault();
            		$('.listitem .item').removeClass('select');
            		$(this).parent().parent().addClass('select');
                var stt = parseInt($(this).attr("data-stt"));
                GoogleMaps.showInforWin(markers[stt], stt);
            });
        });

    </script>

<?php echo $footer; ?>
