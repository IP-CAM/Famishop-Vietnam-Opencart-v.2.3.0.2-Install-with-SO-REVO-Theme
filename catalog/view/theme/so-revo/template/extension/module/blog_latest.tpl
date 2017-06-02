

<div class="box banner-block">
<div class="blogs module">
<?php if(!empty($posts)){ ?>
<div class="grid_holder grid<?php echo $columns; ?>">
<div class="product-grid latest_blogs m<?php echo $module; ?> <?php if ($carousel) { ?>carousel<?php } ?>">
    <?php foreach ($posts as $blog) { ?>
    <div class="item blog_post">

        <?php if($blog['image'] && $thumb){ ?>
        <div class="image zoom_image_container">
        <a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="zoom_image" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
        </div>
        <?php } ?>
            <h4><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h4>
        <div class="desc">

        <?php if(!$characters == '0'){ ?>
        <p><?php echo $blog['description']; ?></p>
        <?php } ?>
        </div>
      <div class="blog_stats">
      <?php if($date_added_status){ ?>
      <span><i class="fa fa-calendar"></i> <?php echo $blog['date_added_full'];?></span>
      <?php } ?>
      <?php if($comments_count_status){ ?>
      <span><a href="<?php echo $blog['href'];?>" title="<?php echo $blog['title'];?>"><i class="icon-comment"></i> <?php echo $blog['comment_total'];?></a></span>
      <?php } ?>
      </div> <!-- blog_stats ends -->

      </div>
    <?php } ?>
</div>
</div>
<?php } ?>
</div>
</div>

<?php if($carousel) { ?>
<script type="text/javascript">
// $(document).ready(function() {
// $('.product-grid.latest_blogs.m<?php echo $module; ?>.carousel').owlCarousel({
// itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $columns;?>]],
// pagination: false,
// navigation:true,
// navigationText: [
// "<div class='owl2-nav'><i></i></div>",
// "<div class='owl2-nav'><i></i></div>"],
// slideSpeed:500,
// afterAction: function(){
//        this.$owlItems.removeClass('first');
//        this.$owlItems.eq(this.currentItem).addClass('first');
//      }
// });
// });


$('.product-grid.latest_blogs.m<?php echo $module; ?>.carousel').owlCarousel2({
  //margin: ,
  items: <?php echo $columns; ?>,
  nav: true,
  margin:50,
  navText: ['<i class=""></i>','<i class=""></i>'],
  autoplay: 400,
  autoWidth: false,
  dots: true,
  loop:true,
  responsive: {
    0: 	{ items: 1 } ,
    480: { items:2 },
    768: { items: <?php echo $columns; ?> }
  },
});


</script>
<?php } ?>
