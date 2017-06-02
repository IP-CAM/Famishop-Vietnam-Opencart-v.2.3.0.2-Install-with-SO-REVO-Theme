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
        <?php if ($description) { ?>
        <div class="margin-b"><?php echo $description; ?></div>
        <?php } ?>

    <?php if($dieutris){ ?>
		<div class="  boxdieutri">

        <div class="grid_holder">
		<div class="product-grid row latest_dieutris <?php if ($list_columns > 1) { echo 'eq_height'; } ?>">
            <?php foreach ($dieutris as $dieutri) { ?>
				<div class="item dieutri_post  col-sm-3">
                <?php if($dieutri['image']){ ?>
                <div class="image zoom_image_container">
				<a href="<?php echo $dieutri['href']; ?>"><img src="<?php echo $dieutri['image']; ?>" class="zoom_image" alt="<?php echo $dieutri['title']; ?>" title="<?php echo $dieutri['title']; ?>" /></a>
                </div>
				<?php } ?>
                <div class="information_wrapper">
                <h3><a href="<?php echo $dieutri['href']; ?>"><?php echo $dieutri['title']; ?></a></h3>


                <p><a href="<?php echo $dieutri['href']; ?>" class="btn btn-default"><?php echo $text_read_more; ?>  <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></p>

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
