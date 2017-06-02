<div class="box banner-block">
<div class="dieutri module">
<?php if(!empty($posts)){ ?>
<div class="grid_holder grid<?php echo $columns; ?>">
<div class="product-grid latest_dieutris m<?php echo $module; ?> <?php if ($carousel) { ?>carousel<?php } ?>">
    <?php foreach ($posts as $dieutri) { ?>
    <div class="item dieutri_post">
        <h4><a href="<?php echo $dieutri['href']; ?>"><?php echo $dieutri['title']; ?></a></h4>
        <?php if($dieutri['image'] && $thumb){ ?>
        <div class="image zoom_image_container">
        <a href="<?php echo $dieutri['href']; ?>"><img src="<?php echo $dieutri['image']; ?>" class="zoom_image" alt="<?php echo $dieutri['title']; ?>" title="<?php echo $dieutri['title']; ?>" /></a>
        </div>
        <?php } ?>

        <div class="dieutri_stats">
        <?php if($date_added_status){ ?>
        <span><i class="icon-calendar"></i> <?php echo $dieutri['date_added_full'];?></span>
        <?php } ?>
        <?php if($comments_count_status){ ?>
        <span><a href="<?php echo $dieutri['href'];?>" title="<?php echo $dieutri['title'];?>"><i class="icon-comment"></i> <?php echo $dieutri['comment_total'];?></a></span>
        <?php } ?>
        </div> <!-- dieutri_stats ends -->

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
// $('.product-grid.latest_dieutris.m<?php echo $module; ?>.carousel').owlCarousel({
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


$('.product-grid.latest_dieutris.m<?php echo $module; ?>.carousel').owlCarousel2({
  //margin: ,
  items: <?php echo $columns; ?>,
  nav: true,

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
