<?php echo $header; ?>

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
 <br>
<div class="mapslist">

<div class="container contacts">

  <div class="main">

    <div class="row">

      <div id="content" class="col-sm-12">



        <div class="formSystem" id='boxMapSearch'>

    	<div class="formSystem-l">

        <h4>CHỌN LOẠI CỬA HÀNG</h4>
        <div class="" id="cat_id">

         <div class="radio">
            <label>
              <input  name="cat_id" type="radio" value="1">
              TRUNG TÂM DỊCH VỤ KHÁCH HÀNG
            </label>
          </div>
          <div class="radio">
            <label>
              <input name="cat_id" type="radio" value="2">
              ĐẠI LÝ ỦY QUYỀN
            </label>
          </div>
        </div>
          <h4>ĐỊA CHỈ CỦA BẠN</h4>
    		<ul>
    			<li>
    				<select id="city" name="city" class="form-control" onChange="cityChange(this.value)"><option value="" selected>Chọn Thành phố</option>
              <?php foreach ($countries as $country) { ?>
                <?php if ($city == $country['country_id']){ ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                 <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>

              <?php } ?>
            </select>
    			</li>
    			<li>
    				<select id="state" name="state" class="form-control" ><option value="" selected>Chọn Quận/Huyện</option></select>
    			</li>
    		</ul>
    	</div>

      <div class="formSystem-r">
      		<div class="input-group">
      			<input type="text" name="key_search" id="key_search" class="form-control"  placeholder="Nhập tên đường hoặc tên đại lý">
      			  <span class="input-group-btn">
      				<button type="button"  name="btnSearch" id="btnSearch" class="btn btn-search"><span>Tìm đại lý</span></button>
      			  </span>
      		</div>


      		<div class="table-system"  style="display:none">
      			<div class="row-input">


      				<div class="toggle-filter">
      					<h3>
      						<a id="btn_list" href="javascript:void(0);" class=""><span></span></a>
      					</h3>
      					<ul class="list-filters">
      						<li><span><i class="fa fa-clock-o"></i></span>
      							<label>Phục vụ 24h</label>
      							<input type="checkbox" value="1" id="ckUtilities" name="ckUtilities[]" class="ckUtilities" />
      						</li>

      						<li><span><i class="fa fa-car"></i></span>
      							<label>Có chỗ để xe ôtô</label>
      							<input type="checkbox" value="2" id="ckUtilities" name="ckUtilities[]" class="ckUtilities" />
      						</li>

      						<li><span><i class="fa fa-credit-card"></i></span>
      							<label>Thanh toán bằng thẻ ATM</label>
      							<input type="checkbox" value="3" id="ckUtilities" name="ckUtilities[]" class="ckUtilities" />
      						</li>

      						<li><span><i class="fa fa-shield"></i></span>
      							<label>Bảo hành - Hỗ trợ</label>
      							<input type="checkbox" value="4" id="ckUtilities" name="ckUtilities[]" class="ckUtilities" />
      						</li>
      					</ul>
      				</div>


      			</div>
      		</div>
      	</div>

       </div>
       <div class="showresult" id="viewMap">

         <div class="result" >

       		<div id="viewList" class="list-view" >

       				<div class="show-result result-wrapper" id="viewList">
       				<div class="item-view"></div>
       				<div class="page-view pagination"></div>
       			</div>
       		</div>


       		<div id="directions" style="display: none">
       			<div id="directionsContainer">
       				<form id="directionsForm" data-placeholder="Vị trí của bạn" onsubmit="return false;">
       					<ol class="form">
       						<li>
       							<ul id="travel-modes">
       								<li class="driving">
       									<input id="driving-rad" type="radio" name="travelMode" value="DRIVING" checked />
       									<label for="driving-rad" title="Lái xe">Lái xe</label>
       								</li>
       								<li class="transit">
       									<input id="transit-rad" type="radio" name="travelMode" value="TRANSIT" />
       									<label for="transit-rad" title="Chuyển tiếp">Chuyển tiếp</label>
       								</li>
       								<li class="walking">
       									<input id="walking-rad" type="radio" name="travelMode" value="WALKING" />
       									<label for="walking-rad" title="Đi bộ">Đi bộ</label>
       								</li>
       								<li class="bicycling">
       									<input id="bicycling-rad" type="radio" name="travelMode" value="BICYCLING" />
       									<label for="bicycling-rad" title="Đi xe đạp">Đi xe đạp</label>
       								</li>
       							</ul>
       						</li>
       						<li class="origin">
       							<div class="directions-input">
       								<label for="origin">A</label>
       								<input type="text" id="origin" name="origin" placeholder="Nhập vị trí" autocomplete="off" />
       								<p class="error">Không thể tìm thấy vị trí gốc</p>
       							</div>
       						</li>

       						<li class="destination">
       							<div class="directions-input">
       								<label for="destination">B</label>
       								<input type="text" id="destination" name="destination" placeholder="Nhập vị trí" readonly />
       								<input type="hidden" id="destLatLng" name="destLatLng"  value="" />
       								<p class="error">Không thể tìm thấy vị trí đích</p>
       							</div>
       						</li>
       						<li class="noRoute error" style="display:none">Không thể tìm thấy tuyến đường giữa A và B.</li>
       						<li>
       							<div class="div-button">
       								<button type="button" id="getDirections" class="btn-direction">Nhận chỉ đường</button>
       								<button type="button" id="cancelDirections" class="btn-direction">Hủy bỏ</button>
       							</div>
       						</li>
       					</ol>
       				</form>
       				<div id="routes"></div>
       				<div id="directions_waiting" aria-busy="true" class="hide"></div>
       			</div>
       		</div>


         </div>
         <div class="showmap">

       	  <button id="findMe" style="display: inline-block;">findMe</button>
       	  <div id="map"></div>


         </div>
       	<div class="clearfix"></div>

       </div>


      </div>
   <div class="clearfix"></div>
      <div class="row form-contactlocation">
        <div class="col-sm-12">

          <h3 style=" background: #f6f6f6; padding-top: 10px; padding-bottom: 10px; text-align: center; font-size: 18px; font-weight: normal; font-style: italic; ">TÌM CÂU TRẢ LỜI CHO THẮC MẮC CỦA BẠN</h3>

        </div>
      <div class="col-sm-6">
          <?php echo $content_top; ?>
        </div>
        <div class="col-sm-6" style=" border-left: 1px solid #eee; ">
          <?php echo $content_bottom; ?>
        </div>
      </div>

    </div>

  </div>
</div>
</div>



<script type="text/javascript">
 var lang = "vn"
 var LINK_MOD = "index.php?route=information/location";
 var url_ajax = '/catalog/view/javascript/wbc_store/';
 var mapDirImage ="/catalog/view/javascript/wbc_store/images";
 var mapContext = {"keyword":"","catid":"","city":"","state":"","utilities":"","page":"1","center":"","lstPoint":"","zoom":"12","searchType":0,"curID":""};

 var mapType = 0;
 var js_lang=new Array();
 js_lang['view_detail'] = "Xem chi tiết" ;
 js_lang['find_the_way'] =	"Tìm đường" ;
 js_lang['not_found_origin'] =	"Tìm đường" ;
 js_lang['not_found_destination'] =	"Không thể tìm thấy vị trí đích" ;
 js_lang['no_route'] =	"Không thể tìm thấy tuyến đường giữa A và B." ;
</script>

<script type="text/javascript">
 var myControlerObj = null;
 if (window.location.hash != '') {
   var markContext = window.location.hash;
   mapContext = {
     keyword: markContext.getQueryHash('keyword', ''),
     catid: markContext.getQueryHash('cat'),
     brand: markContext.getQueryHash('brand'),
     city: markContext.getQueryHash('city'),
     state: markContext.getQueryHash('state'),
     utilities: markContext.getQueryHash('utilities'),
     lstPoint: markContext.getQueryHash('points'),
     zoom: markContext.getQueryHash('zoom', '10'),
     center: markContext.getQueryHash('center'),
     page: markContext.getQueryHash('page', '1'),
     curID: markContext.getQueryHash('item'),
     searchType: parseInt(markContext.getQueryHash('searchtype', '0'))
   };
 }

 myControlerObj = new MapSearchControler({
   context: mapContext
 });
</script>

<?php echo $footer; ?>
