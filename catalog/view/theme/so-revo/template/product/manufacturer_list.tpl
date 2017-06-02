<?php echo $header; ?>

<div class="sub-header">
	<img src="/image/bg_sub_manufacturer.jpg" alt="">
</div>
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
<div class="container">
   <!-- BREADCRUMB -->

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

      <?php if ($categories) { ?>
<div class="row box-manufacturer">
      <?php foreach ($categories as $category) { ?>
      <?php if ($category['manufacturer']) { ?>

      <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>

        <?php foreach ($manufacturers as $manufacturer) { ?>
        <div class="col-sm-3 box-logo">
					<div class="box-info">
						<img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>">
						<div class="description">
							<div class="meta">
								<h4><?php echo $manufacturer['name']; ?></h4>
								<p class="desc"><?php echo $manufacturer['description']; ?></p>
								<a href="<?php echo $manufacturer['href']; ?>" class="btn btn-default"><?php echo $text_read_more; ?>  <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
        <?php } ?>

      <?php } ?>

      <?php } ?>

      <?php } ?>
			</div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
