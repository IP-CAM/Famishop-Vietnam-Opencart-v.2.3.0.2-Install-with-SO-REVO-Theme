<div id="banner<?php echo $module; ?>" class="banners owl-carousel banner-block <?php if ($style == 2) { ?> banner_hover <?php } ?>  <?php if ($style == 3) { ?> banner_border <?php } ?>">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">

    <?php if ($style == 2) { ?>
      <a class="titlebanner" href="<?php echo $banner['link']; ?>" alt="<?php echo strip_tags($banner['title']); ?>">
        <span><?php echo $banner['title']; ?></span>
      </a>
    <?php } ?>
    <div class="imagebanner">
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['title']); ?>" class="img-responsive" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['title']); ?>" class="img-responsive" />
      <?php } ?>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--

$('#banner<?php echo $module; ?>').owlCarousel2({
  margin: <?php echo $margin;?>,
  items: <?php echo $column; ?>,
  nav: <?php if ($style == 2) { echo "false";} else { echo "true";} ?>,

  navText: ['<i class=""></i>','<i class=""></i>'],
  autoplay: 400,
  autoWidth: false,
  dots: true,
  responsive: {
    0: 	{ items: 1 } ,
    480: { items:2 },
    768: { items: <?php echo $column; ?> }
  },
});


--></script>
