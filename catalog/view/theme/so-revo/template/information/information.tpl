<?php echo $header; ?>
<?php if($information_id!=4){ ?>
<div class="container">
   <!-- BREADCRUMB -->
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
</div>
<?php } ?>
<?php if($information_id == 4){ ?>
	<div class="" id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<?php } ?>
<?php echo $content_top; ?>
<?php if($information_id == 4){ ?>
	</div>
<?php } ?>
<div class="container">
  <div class="<?php echo ($column_left || $column_right ? 'row' : ''); ?>">
      <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = ''; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

        <div class="<?php echo ($column_left || $column_right ? '' : 'container'); ?>">


			<?php echo $description; ?>
        </div>
        <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
