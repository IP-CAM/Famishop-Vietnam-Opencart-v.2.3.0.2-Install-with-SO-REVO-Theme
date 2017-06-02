

<div class="module category-style">
  <h3 class="modtitle"><span><?php echo $heading_title; ?></span></h3>
  <div class="mod-content box-category">
    <ul class="accordion" id="accordion-category">
      <?php $i = 0; foreach ($categories as $category) { $i++; ?>
		<li class="panel">
			<?php if ($category['manufacturer_id'] == $manufacturer_id) { ?>
			<a href="<?php echo $category['href']; ?>" class="active"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $category['name']; ?></a>
			<?php } else { ?>
			<a href="<?php echo $category['href']; ?>"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $category['name']; ?></a>
			<?php } ?>
		  </li>
      <?php } ?>
    </ul>
  </div>
</div>
