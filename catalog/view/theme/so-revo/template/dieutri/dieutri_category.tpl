<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
  
  <?php echo $column_left; ?>
    
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

		<h1><?php echo $heading_title; ?></h1>
    	<?php if ($dieutri_category_description) { ?>
        <div class="box"><?php echo $dieutri_category_description; ?></div>
        <?php } ?>

  	<?php if($dieutris){ ?>
		<div class="bordered_content box">
        <div class="bottom_buttons pagination_holder top">
    <div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
  </div>
        <div class="grid_holder grid<?php echo $list_columns; ?>">
		<div class="product-grid latest_dieutris <?php if ($list_columns > 1) { echo 'eq_height'; } ?>">
            
            <?php foreach ($dieutris as $dieutri) { ?>
				<div class="item dieutri_post">
                <?php if($dieutri['image']){ ?>
                <div class="image zoom_image_container">
				<a href="<?php echo $dieutri['href']; ?>"><img src="<?php echo $dieutri['image']; ?>" class="zoom_image" alt="<?php echo $dieutri['title']; ?>" title="<?php echo $dieutri['title']; ?>" /></a>
                </div>
				<?php } ?>
                <div class="information_wrapper">
                <h3><a href="<?php echo $dieutri['href']; ?>"><?php echo $dieutri['title']; ?></a></h3>
                
                <div class="dieutri_stats">
                
                <?php if($date_added_status){ ?>
				<span><i class="icon-calendar"></i> <?php echo $dieutri['date_added_full'];?></span>
                <?php } ?>
                
                <?php if($comments_count_status){ ?>
                <span><a href="<?php echo $dieutri['href'];?>" title="<?php echo $dieutri['title'];?>"><i class="icon-comment"></i> <?php echo $dieutri['comment_total'];?></a></span>
				<?php } ?>

                <?php if($author_status){ ?>
                <span><i class="fa fa-user"></i> <?php echo $text_posted_by; ?> <?php echo $dieutri['author']; ?></span>
                <?php } ?>
                
				<?php if($page_view_status){ ?>
                <span><i class="fa fa-eye"></i> <?php echo $text_read; ?> <?php echo $dieutri['count_read']; ?></span>
                <?php } ?>
                
                </div> <!-- dieutri-stats ends -->
                <p><?php echo $dieutri['short_description']; ?></p>
                <p><a href="<?php echo $dieutri['href']; ?>" class="btn btn-default"><?php echo $text_read_more; ?></a></p>
                </div>
              </div> <!-- item ends -->
			<?php } ?>
           </div>
            </div>
            <div class="bottom_buttons pagination_holder">
    <div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
  </div>
          </div>
		
	<?php }else{ ?>
		<p class="box"><?php echo $text_no_results; ?></p>
	<?php } ?>
    
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 