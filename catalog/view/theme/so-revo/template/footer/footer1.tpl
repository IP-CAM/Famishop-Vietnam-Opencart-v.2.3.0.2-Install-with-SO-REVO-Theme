
<footer class="footer-container typefooter-<?php echo isset($typefooter) ? $typefooter : '1'?>">
	<!-- FOOTER TOP -->
	<?php if ($footertop) : ?>
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
				<?php echo $footertop; ?>
				</div>
			</div>
		</div>
	</div>
	<?php endif; ?>
	<!-- FOOTER TOP -->
	<?php if ($footerbottom) : ?>
	<div class="footer-center">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
				<?php echo $footerbottom; ?>
				</div>
			</div>
		</div>
	</div>
	<?php endif; ?>
	<!-- FOOTER CENTER -->

	<!-- FOOTER BOTTOM -->
	<div class="footer-bottom ">
		<div class="container">
			<div class="row">
				<?php $col_copyright = ($imgpayment_status) ? 'col-sm-6' : 'col-sm-12'?>
				<div class="<?php echo $col_copyright;?> copyright">
					<?php
					$datetime = new DateTime();
					$cur_year	= $datetime->format('Y');
					echo (!isset($copyright) || !is_string($copyright) ? $powered : str_replace('{year}', $cur_year,html_entity_decode($copyright, ENT_QUOTES, 'UTF-8')));?> Designed by <a href="https://www.webico.vn" target="_blank">WEBICO.VN</a>
				</div>

				<?php if (isset($imgpayment_status) && $imgpayment_status != 0) : ?>
				<div class="col-sm-6 payment text-right">
					<?php
					if ((isset($imgpayment) && $imgpayment != '') ) { ?>
						<img src="image/<?php echo  $imgpayment ?>"  alt="imgpayment">
					<?php } ?>
				</div>
				<?php endif; ?>

			</div>
		</div>
	</div>
</footer>
