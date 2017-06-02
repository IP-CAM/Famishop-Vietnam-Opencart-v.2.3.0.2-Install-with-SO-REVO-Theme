
<div class="next-product">
  <a href="#"><div class="btn-prev" style=""><i class=""></i></div></a>
  <a href="#"><div class="btn-next" style=""><i class=""></i></div></a>
</div>

<div class="col-sm-12">
  <div class="image row">
    <div class="col-sm-6">

    <ul class="thumb-slick">
      <?php
      if (sizeof($images) > 0) {
        $firstimg = array('popup' => $popup,'thumb' => $thumb);
        array_unshift($images, $firstimg);
      }
      if ($images) : ?>
        <?php $i=-1; foreach ($images as $image) :$i++ ?>
        <li class="owl2-item">
          <a data-index="<?php echo $i; ?>" class="img" data-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
          </a>
        </li>
        <?php endforeach; ?>
      <?php endif; ?>
    </ul>

  </div>
  <div class="col-sm-6 title-product">
    <h1><?php echo $heading_title; ?></h1>
  </div>
  </div>

  <div class="row">
    <div class="col-sm-9">
      <?php echo $description; ?>
    </div>
    <div class="col-sm-3">
      <div class="box-contact">
        <div class="info">

        <h4>THÔNG TIN VÀ LIÊN HỆ</h4>
        <p>Tất cả các sản phẩm có thể không có ở mọi quốc gia, vui lòng kiểm tra với nhà phân phối chính thức của GrassRoots.
Để biết thêm thông tin:</p>

</div>
        <a href="/contact" class="btn btn-default" style=" width: 100%; "><i class="fa fa-envelope-o" aria-hidden="true"></i> Liên hệ chúng tôi</a>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$('.thumb-slick').slick({
  autoplay: true,
 autoplaySpeed: 2000,
});

</script>
