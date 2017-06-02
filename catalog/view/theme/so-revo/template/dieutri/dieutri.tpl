<?php // Header Blocks =========================================?>
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">

  <?php //echo $column_left; ?>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="col-md-3 col-sm-4">
      <?php if ($related_dieutris) { ?>


        <div class="module category-style">
          <div class="mod-content box-category">
            <ul class="accordion" id="accordion-category">
              <?php foreach ($related_dieutris as $dieutri) { ?>
        		<li class="panel">

        			<a href="<?php echo $dieutri['href']; ?>"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $dieutri['title']; ?></a>

        		  </li>
              <?php } ?>
            </ul>
          </div>
        </div>


    <?php } ?>
     <!-- Related Dieutri End -->

    </div>
    <div id="content" class="col-md-9 col-sm-8">
    <?php echo $content_top; ?>
    <div class="dieutri_post">

    <h1 class="title"><?php echo $heading_title; ?></h1>

   <div class="box">
   <div class="padded main">




   <div class="description">
   <?php echo $description; ?>
   </div>


   <div class="dieutri-tabs">
     <!-- Nav tabs -->
     <ul class="nav nav-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#short_description" aria-controls="short_description" role="tab" data-toggle="tab"><?php echo $text_short_description; ?></a></li>
       <li role="presentation"><a href="#before_after" aria-controls="before_after" role="tab" data-toggle="tab"><?php echo $text_before_after; ?></a></li>
       <li role="presentation"><a href="#products" aria-controls="products" role="tab" data-toggle="tab"><?php echo $text_product_related; ?></a></li>
       <li role="presentation"><a href="#faq" aria-controls="faq" role="tab" data-toggle="tab"><?php echo $text_faq; ?></a></li>
     </ul>

     <!-- Tab panes -->
     <div class="tab-content">
       <div role="tabpanel" class="tab-pane fade active in" id="short_description">
         <?php echo $short_description; ?>
       </div>
       <div role="tabpanel" class="tab-pane fade" id="before_after">
         <?php if($image_before){ ?>
           <div class="slider-mask">
            <div id="container" class="AB-slidebar">
              <div class="slider-aft">
                <div class="" style="width: 800px;">
                    <img src="<?php echo $image_before; ?>" alt="">
                </div>

              </div>
              <div class="slider-bef">
                <div class="" style="width: 800px;">
                  <img src="<?php echo $image_after; ?>" alt="">
                </div>

              </div>
              <div class="handle-wrapper">
                <div class="slider-tip hidden">Slide the arrows to the left<br/>and right to reveal images</div>
                <div class="slider-bar"></div>
              </div>
            </div>
          </div>
        <?php } ?>
       </div>
       <div role="tabpanel" class="tab-pane fade" id="products">


         <div class="clearfix module">
     			<div class="products-related">
                 <div class="releate-products">
     				<!-- Products list -->
     				<?php foreach ($products as $product) : ?>
                <div class="product-layout">
     						  <div class="product-item-container">
     								<div class="left-block">
     									<div class="product-image-container ">
     										<a class="preview-image" href="<?php echo $product['href']; ?>">
                          <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-1 img-responsive" />
                        </a>

     									</div>
     								</div>

     								<div class="right-block">
     									<div class="caption">
     									   <h4><a class="preview-image" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
     									</div>

     								</div>
     						  </div>

                             </div>
                  <?php endforeach; ?>
                 </div>
     			</div>
         </div>



       </div>
       <div role="tabpanel" class="tab-pane fade" id="faq"><?php echo $faq; ?></div>
     </div>
   </div>



  </div>

  <?php if ($tags) { ?>
	<div class="bottom_buttons hidden">
    <span class="tag_text"><?php echo $text_tags; ?></span>
	<?php for ($i = 0; $i < count($tags); $i++) { ?>
	<?php if ($i < (count($tags) - 1)) { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
	<?php } else { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
	<?php } ?>
	<?php } ?>
	</div>
	<?php } ?>

  </div>

      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<script type="text/javascript"><!--



jQuery(document).ready(function($) {


    $('a[href="#products"]').on('shown.bs.tab', function () {
          initialize_owl($('.releate-products'));
      });

  function destroy_owl(el) {
    el.data('owlCarousel2').destroy();
  }
  function initialize_owl(el) {

   el.owlCarousel2({
     pagination: false,
     center: false,
     nav: true,
     dots: false,
     loop: true,
     margin: 30,
     navText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
     slideBy: 1,
     responsive:{
       0:{
         items:1
       },
       480:{
         items:2
       },
       768:{
         items:4
       },
       991:{
         items:4
       },
       1200:{
         items:5
       }
     }
   });
}
 });
 </script>

<script type="text/javascript">// <![CDATA[
jQuery(function () {
var before = $('.slider-bef');
var after = $('.slider-after');
var handle = $('.handle-wrapper');
var slider = $('.AB-slidebar');
var tooltip = $('.slider-tip');

var currentWidth = $(before).width(); //get current width of top image
var newTopWidth = '50%'; //calculate new top width -> 2/3 of current width
var slideLeft = newTopWidth * 2/3; //set # of pixels to slide left
var slideRight = newTopWidth; //set # of pixels to slide right


before.width(newTopWidth); //set top image with new width
handle.css('left', newTopWidth); //set left margin for bar

function slideBar(e) {

setTimeout(function () {
var newWidth = parseInt($(handle).css('left'));
// set width of before img div
before.width(newWidth);
}, 30);

e.stopPropagation();
}


handle.draggable({
containment: slider,
axis: 'x'
});

slider.bind('drag', slideBar).bind('mousedown',     function(){
tooltip.fadeOut(10);
});


});
// ]]></script>
<?php echo $footer; ?>
