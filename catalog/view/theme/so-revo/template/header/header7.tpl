
<header id="header" class=" variant typeheader-<?php echo isset($typeheader) ? $typeheader : '1'?>">
	<!-- HEADER TOP -->
	<div class="header-top compact-hidden">
		<div class="container">
			<div class="header-top-inner">
				<div class="row">
					<div class="header-top-left  col-lg-6 col-sm-12 col-md-5 hidden-xs">
						<?php echo $header_block1; ?>
					</div>
					<div class="header-top-right collapsed-block col-lg-6 col-sm-12 col-md-7 col-xs-12 ">

						<h5 class="tabBlockTitle hidden-lg hidden-sm hidden-md visible-xs"><?php echo $text_more; ?><a class="expander " href="#TabBlock-1"><i class="fa fa-angle-down"></i></a></h5>
						<div  class="tabBlock" id="TabBlock-1">
							<?php echo $header_block2; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- HEADER CENTER -->
	<div class="header-center compact-hidden">
		<div class="container">
			<div class="row">
				<!-- LOGO -->
				<div class="navbar-logo col-lg-3 col-md-3">
				   <?php  $this->soconfig->get_logo();?>
				</div>
				<div class="header-center-right text-right col-lg-9 col-md-9">
					<div class="header-menu">
						<?php echo $content_menu; ?>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- HEADER BOTTOM -->
	<div class="header-bottom ">
		<div class="container">
			<!-- <div class="header-bottom-inner">
				<?php echo $content_menu; ?>
			</div> -->
		</div>

	</div>

	<!-- Navbar switcher -->
	<?php if (!isset($toppanel_status) || $toppanel_status != 0) : ?>
	<?php if (!isset($toppanel_type) || $toppanel_type != 2 ) :  ?>
	<div class="navbar-switcher-container">
		<div class="navbar-switcher">
			<span class="i-inactive">
				<i class="fa fa-caret-down"></i>
			</span>
			 <span class="i-active fa fa-times"></span>
		</div>
	</div>
	<?php endif; ?>
	<?php endif; ?>
</header>
