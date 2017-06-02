<?php
/******************************************************
 * @package	SO Theme Framework for Opencart 2.0.x
 * @author	http://www.magentech.com
 * @license	GNU General Public License
 * @copyright(C) 2008-2015 Magentech.com. All rights reserved.
*******************************************************/
?>
<?php
	/*Product Short Description*/
	$limit = 150;$getColumn='left';
	if(strlen($html_product_shortdesc) >  30){
		$product_description_short = html_entity_decode($html_product_shortdesc, ENT_QUOTES, 'UTF-8');
	}else{
		$full_description = strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8'));
		$product_description_short = "<h3>". $overview."</h3>";
		$product_description_short .= (strlen($full_description) > $limit ? utf8_substr($full_description, 0, $limit) . '...' : $full_description);
	}

	if($column_left && $column_right) $getColumn='3column';
	else if ($column_left)  $getColumn='left';
	else if($column_right)  $getColumn='right';
	else $getColumn='full';
?>

<?php // Header Blocks =========================================?>
<?php echo $header; ?>

<?php // Breadcrumb Blocks =========================================?>
<div class="container ">
	 <!-- BREADCRUMB -->
	<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>

<?php // Content Detail Blocks ========================================= ?>
<div class="container product-detail <?php echo'product-'. $getColumn;?>">
	<div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content" class="<?php echo $class; ?>">
        <div class="row product-view product-info">
		 
      <?php
        if (file_exists(DIR_TEMPLATE . $theme . '/template/soconfig/product2.php')) include(DIR_TEMPLATE.$theme.'/template/soconfig/product2.php');
      ?>



</div>

</div>
</div>
</div>




<?php // Footer Blocks =========================================?>
<?php echo $footer; ?>
