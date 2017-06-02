<div class="box">
<h3><?php echo $heading_title_latest; ?></h3>
<div class="bordered_content">
<?php if(!empty($posts)){ ?>
<div class="grid_holder grid<?php echo $columns; ?>">
<div class="product-grid latest_dieutris m<?php echo $module; ?> <?php if ($carousel) { ?>carousel<?php } ?>">
    <?php foreach ($posts as $dieutri) { ?>
    <div class="item dieutri_post">
        <?php if($dieutri['image'] && $thumb){ ?>
        <div class="image zoom_image_container">
        <a href="<?php echo $dieutri['href']; ?>"><img src="<?php echo $dieutri['image']; ?>" class="zoom_image" alt="<?php echo $dieutri['title']; ?>" title="<?php echo $dieutri['title']; ?>" /></a>
        </div>
        <?php } ?>
        <h4><a href="<?php echo $dieutri['href']; ?>"><?php echo $dieutri['title']; ?></a></h4>
        <div class="dieutri_stats">
        <?php if($date_added_status){ ?>
        <span><i class="icon-calendar"></i> <?php echo $dieutri['date_added_full'];?></span>
        <?php } ?>
        <?php if($comments_count_status){ ?>
        <span><a href="<?php echo $dieutri['href'];?>" title="<?php echo $dieutri['title'];?>"><i class="icon-comment"></i> <?php echo $dieutri['comment_total'];?></a></span>
        <?php } ?>
        </div> <!-- dieutri_stats ends -->
        <?php if(!$characters == '0'){ ?>
        <p><?php echo $dieutri['description']; ?></p>
        <?php } ?>
      </div>
    <?php } ?>
</div>
</div>
<?php } ?>
</div>
</div>
<?php if($carousel) { ?>
<script type="text/javascript">
$(document).ready(function() {
$('.product-grid.latest_dieutris.m<?php echo $module; ?>.carousel').owlCarousel({
itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $columns;?>]],
pagination: false,
navigation:true,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"],
slideSpeed:500,
afterAction: function(){
       this.$owlItems.removeClass('first');
       this.$owlItems.eq(this.currentItem).addClass('first');
     }
}); 
});
</script>
<?php } ?>