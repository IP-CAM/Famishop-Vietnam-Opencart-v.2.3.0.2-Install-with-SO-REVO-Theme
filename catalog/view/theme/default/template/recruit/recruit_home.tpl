<?php echo $header; ?>
<div class="subheader nopadding">
  <img src="/image/bg_sub_tuyendung.jpg" width="100%" alt="">
  <!-- Button trigger modal -->
  <button type="button" class="btn-modelonline" data-toggle="modal" data-target="#myModal">
  <i class="fa fa-file-text-o" aria-hidden="true"></i> Nộp hồ sơ online
</button>

  <ul class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li>
      <a href="<?php echo $breadcrumb['href']; ?>">
        <?php echo $breadcrumb['text']; ?>
      </a>
    </li>
    <?php } ?>
  </ul>
</div>
<div class="container">

  <div class="row">

    <div class="col-md-3 hidden-xs hidden-sm">
      <?php echo $column_left; ?>
    </div>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <div class="titlesan">
        <h3><?php echo $heading_title; ?></h3>
        <hr>
      </div>


     
      <?php if($recruits){ ?>
      <div class="box">

        <div class="grid_holder grid<?php echo $list_columns; ?>">
          <div class="product-grid latest_recruits <?php if ($list_columns > 1) { echo 'eq_height'; } ?>">

            <div class="panel-group" id="accordion">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
              <b>VỊ TRÍ TUYỂN DỤNG</b>
              <span class="pull-right">THỜI HẠN NỘP HỒ SƠ</span>
            </h4>
                </div>
              </div>
              <?php foreach ($recruits as $recruit) { ?>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#recruit<?php echo $recruit['recruit_id']; ?>" href="#recruit<?php echo $recruit['recruit_id']; ?>"><?php echo $recruit['title']; ?></a>
              <span class="pull-right"><?php echo $recruit['date_timeout']; ?></span>
            </h4>
                </div>
                <div id="recruit<?php echo $recruit['recruit_id']; ?>" class="panel-collapse collapse">
                  <div class="panel-body">
                    <?php echo $recruit['short_description']; ?>
                    <p class="pull-right">
                      <a href="<?php echo $recruit['href']; ?>" class="btn btn-default">
                        <?php echo $text_read_more; ?>
                      </a>
                    </p>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>


            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">NỘP ĐƠN ONLINE</h4>
                  </div>

                  <div class="modal-body">
                    <div id="comment_message"></div>
                    <form id="comment_form">
                      <div class="row">

                        <div class="col-sm-6">


                        <div class="form-group">
                          <div class="row">
                             <label class="col-sm-3" for="name">Họ tên</label>
                             <div class="col-sm-9">
                               <input type="text" name="name" class="form-control" id="name" placeholder="Họ tên của bạn ">
                             </div>
                          </div>
                         </div>

                         <div class="form-group">
                           <div class="row">
                              <label class="col-sm-3" for="email">Email</label>
                              <div class="col-sm-9">
                                <input type="text" name="email" class="form-control" id="email" placeholder="Email của bạn">
                              </div>
                           </div>
                          </div>

                         <div class="form-group">
                           <div class="row">
                              <label class="col-sm-3" for="telephone">Điện thoại</label>
                              <div class="col-sm-9">
                                <input type="text" name="telephone" class="form-control" id="telephone" placeholder="Điện thoại của bạn">
                              </div>
                           </div>
                          </div>

                         <div class="form-group">
                           <div class="row">
                              <label class="col-sm-3" for="address">Địa chỉ</label>
                              <div class="col-sm-9">
                                <input type="text" name="address" class="form-control" id="address" placeholder="Địa chỉ của bạn">
                              </div>
                           </div>
                          </div>
                          <div class="form-group">
                            <div class="row">
                               <label class="col-sm-3" for="gender">Giới tính</label>
                               <div class="col-sm-9">
                                 <label class="radio-inline">
                                   <input type="radio" name="gender" value="1"> Nam
                                 </label>
                                 <label class="radio-inline">
                                   <input type="radio" name="gender" value="2"> Nữ
                                 </label>

                               </div>
                            </div>
                           </div>

                           <div class="form-group">
                             <div class="row">
                                <label class="col-sm-3" for="country">Ngày sinh</label>
                                 <div class="col-sm-9">

                                   <div class="input-group date">
                                     <input type="text" name="date_available" placeholder="Ngày sinh" data-date-format="DD-MM-YYYY" id="input-date-available" class="form-control" />
                                     <span class="input-group-btn">
                                     <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                     </span></div>

                                 </div>
                             </div>
                            </div>

                            <div class="form-group">
                              <div class="row">
                                 <label class="col-sm-3" for="date">Quốc tịch</label>
                                  <div class="col-sm-9">
                                    <select class="country form-control" name="country">
                                      <option value="">-- Chọn quốc gia --</option>
                                      <option value="VN">Việt Nam</option>
                                      	<option value="AF">Afghanistan</option>
                                      	<option value="AX">Åland Islands</option>
                                      	<option value="AL">Albania</option>
                                      	<option value="DZ">Algeria</option>
                                      	<option value="AS">American Samoa</option>
                                      	<option value="AD">Andorra</option>
                                      	<option value="AO">Angola</option>
                                      	<option value="AI">Anguilla</option>
                                      	<option value="AQ">Antarctica</option>
                                      	<option value="AG">Antigua and Barbuda</option>
                                      	<option value="AR">Argentina</option>
                                      	<option value="AM">Armenia</option>
                                      	<option value="AW">Aruba</option>
                                      	<option value="AU">Australia</option>
                                      	<option value="AT">Austria</option>
                                      	<option value="AZ">Azerbaijan</option>
                                      	<option value="BS">Bahamas</option>
                                      	<option value="BH">Bahrain</option>
                                      	<option value="BD">Bangladesh</option>
                                      	<option value="BB">Barbados</option>
                                      	<option value="BY">Belarus</option>
                                      	<option value="BE">Belgium</option>
                                      	<option value="BZ">Belize</option>
                                      	<option value="BJ">Benin</option>
                                      	<option value="BM">Bermuda</option>
                                      	<option value="BT">Bhutan</option>
                                      	<option value="BO">Bolivia, Plurinational State of</option>
                                      	<option value="BQ">Bonaire, Sint Eustatius and Saba</option>
                                      	<option value="BA">Bosnia and Herzegovina</option>
                                      	<option value="BW">Botswana</option>
                                      	<option value="BV">Bouvet Island</option>
                                      	<option value="BR">Brazil</option>
                                      	<option value="IO">British Indian Ocean Territory</option>
                                      	<option value="BN">Brunei Darussalam</option>
                                      	<option value="BG">Bulgaria</option>
                                      	<option value="BF">Burkina Faso</option>
                                      	<option value="BI">Burundi</option>
                                      	<option value="KH">Cambodia</option>
                                      	<option value="CM">Cameroon</option>
                                      	<option value="CA">Canada</option>
                                      	<option value="CV">Cape Verde</option>
                                      	<option value="KY">Cayman Islands</option>
                                      	<option value="CF">Central African Republic</option>
                                      	<option value="TD">Chad</option>
                                      	<option value="CL">Chile</option>
                                      	<option value="CN">China</option>
                                      	<option value="CX">Christmas Island</option>
                                      	<option value="CC">Cocos (Keeling) Islands</option>
                                      	<option value="CO">Colombia</option>
                                      	<option value="KM">Comoros</option>
                                      	<option value="CG">Congo</option>
                                      	<option value="CD">Congo, the Democratic Republic of the</option>
                                      	<option value="CK">Cook Islands</option>
                                      	<option value="CR">Costa Rica</option>
                                      	<option value="CI">Côte d'Ivoire</option>
                                      	<option value="HR">Croatia</option>
                                      	<option value="CU">Cuba</option>
                                      	<option value="CW">Curaçao</option>
                                      	<option value="CY">Cyprus</option>
                                      	<option value="CZ">Czech Republic</option>
                                      	<option value="DK">Denmark</option>
                                      	<option value="DJ">Djibouti</option>
                                      	<option value="DM">Dominica</option>
                                      	<option value="DO">Dominican Republic</option>
                                      	<option value="EC">Ecuador</option>
                                      	<option value="EG">Egypt</option>
                                      	<option value="SV">El Salvador</option>
                                      	<option value="GQ">Equatorial Guinea</option>
                                      	<option value="ER">Eritrea</option>
                                      	<option value="EE">Estonia</option>
                                      	<option value="ET">Ethiopia</option>
                                      	<option value="FK">Falkland Islands (Malvinas)</option>
                                      	<option value="FO">Faroe Islands</option>
                                      	<option value="FJ">Fiji</option>
                                      	<option value="FI">Finland</option>
                                      	<option value="FR">France</option>
                                      	<option value="GF">French Guiana</option>
                                      	<option value="PF">French Polynesia</option>
                                      	<option value="TF">French Southern Territories</option>
                                      	<option value="GA">Gabon</option>
                                      	<option value="GM">Gambia</option>
                                      	<option value="GE">Georgia</option>
                                      	<option value="DE">Germany</option>
                                      	<option value="GH">Ghana</option>
                                      	<option value="GI">Gibraltar</option>
                                      	<option value="GR">Greece</option>
                                      	<option value="GL">Greenland</option>
                                      	<option value="GD">Grenada</option>
                                      	<option value="GP">Guadeloupe</option>
                                      	<option value="GU">Guam</option>
                                      	<option value="GT">Guatemala</option>
                                      	<option value="GG">Guernsey</option>
                                      	<option value="GN">Guinea</option>
                                      	<option value="GW">Guinea-Bissau</option>
                                      	<option value="GY">Guyana</option>
                                      	<option value="HT">Haiti</option>
                                      	<option value="HM">Heard Island and McDonald Islands</option>
                                      	<option value="VA">Holy See (Vatican City State)</option>
                                      	<option value="HN">Honduras</option>
                                      	<option value="HK">Hong Kong</option>
                                      	<option value="HU">Hungary</option>
                                      	<option value="IS">Iceland</option>
                                      	<option value="IN">India</option>
                                      	<option value="ID">Indonesia</option>
                                      	<option value="IR">Iran, Islamic Republic of</option>
                                      	<option value="IQ">Iraq</option>
                                      	<option value="IE">Ireland</option>
                                      	<option value="IM">Isle of Man</option>
                                      	<option value="IL">Israel</option>
                                      	<option value="IT">Italy</option>
                                      	<option value="JM">Jamaica</option>
                                      	<option value="JP">Japan</option>
                                      	<option value="JE">Jersey</option>
                                      	<option value="JO">Jordan</option>
                                      	<option value="KZ">Kazakhstan</option>
                                      	<option value="KE">Kenya</option>
                                      	<option value="KI">Kiribati</option>
                                      	<option value="KP">Korea, Democratic People's Republic of</option>
                                      	<option value="KR">Korea, Republic of</option>
                                      	<option value="KW">Kuwait</option>
                                      	<option value="KG">Kyrgyzstan</option>
                                      	<option value="LA">Lao People's Democratic Republic</option>
                                      	<option value="LV">Latvia</option>
                                      	<option value="LB">Lebanon</option>
                                      	<option value="LS">Lesotho</option>
                                      	<option value="LR">Liberia</option>
                                      	<option value="LY">Libya</option>
                                      	<option value="LI">Liechtenstein</option>
                                      	<option value="LT">Lithuania</option>
                                      	<option value="LU">Luxembourg</option>
                                      	<option value="MO">Macao</option>
                                      	<option value="MK">Macedonia, the former Yugoslav Republic of</option>
                                      	<option value="MG">Madagascar</option>
                                      	<option value="MW">Malawi</option>
                                      	<option value="MY">Malaysia</option>
                                      	<option value="MV">Maldives</option>
                                      	<option value="ML">Mali</option>
                                      	<option value="MT">Malta</option>
                                      	<option value="MH">Marshall Islands</option>
                                      	<option value="MQ">Martinique</option>
                                      	<option value="MR">Mauritania</option>
                                      	<option value="MU">Mauritius</option>
                                      	<option value="YT">Mayotte</option>
                                      	<option value="MX">Mexico</option>
                                      	<option value="FM">Micronesia, Federated States of</option>
                                      	<option value="MD">Moldova, Republic of</option>
                                      	<option value="MC">Monaco</option>
                                      	<option value="MN">Mongolia</option>
                                      	<option value="ME">Montenegro</option>
                                      	<option value="MS">Montserrat</option>
                                      	<option value="MA">Morocco</option>
                                      	<option value="MZ">Mozambique</option>
                                      	<option value="MM">Myanmar</option>
                                      	<option value="NA">Namibia</option>
                                      	<option value="NR">Nauru</option>
                                      	<option value="NP">Nepal</option>
                                      	<option value="NL">Netherlands</option>
                                      	<option value="NC">New Caledonia</option>
                                      	<option value="NZ">New Zealand</option>
                                      	<option value="NI">Nicaragua</option>
                                      	<option value="NE">Niger</option>
                                      	<option value="NG">Nigeria</option>
                                      	<option value="NU">Niue</option>
                                      	<option value="NF">Norfolk Island</option>
                                      	<option value="MP">Northern Mariana Islands</option>
                                      	<option value="NO">Norway</option>
                                      	<option value="OM">Oman</option>
                                      	<option value="PK">Pakistan</option>
                                      	<option value="PW">Palau</option>
                                      	<option value="PS">Palestinian Territory, Occupied</option>
                                      	<option value="PA">Panama</option>
                                      	<option value="PG">Papua New Guinea</option>
                                      	<option value="PY">Paraguay</option>
                                      	<option value="PE">Peru</option>
                                      	<option value="PH">Philippines</option>
                                      	<option value="PN">Pitcairn</option>
                                      	<option value="PL">Poland</option>
                                      	<option value="PT">Portugal</option>
                                      	<option value="PR">Puerto Rico</option>
                                      	<option value="QA">Qatar</option>
                                      	<option value="RE">Réunion</option>
                                      	<option value="RO">Romania</option>
                                      	<option value="RU">Russian Federation</option>
                                      	<option value="RW">Rwanda</option>
                                      	<option value="BL">Saint Barthélemy</option>
                                      	<option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
                                      	<option value="KN">Saint Kitts and Nevis</option>
                                      	<option value="LC">Saint Lucia</option>
                                      	<option value="MF">Saint Martin (French part)</option>
                                      	<option value="PM">Saint Pierre and Miquelon</option>
                                      	<option value="VC">Saint Vincent and the Grenadines</option>
                                      	<option value="WS">Samoa</option>
                                      	<option value="SM">San Marino</option>
                                      	<option value="ST">Sao Tome and Principe</option>
                                      	<option value="SA">Saudi Arabia</option>
                                      	<option value="SN">Senegal</option>
                                      	<option value="RS">Serbia</option>
                                      	<option value="SC">Seychelles</option>
                                      	<option value="SL">Sierra Leone</option>
                                      	<option value="SG">Singapore</option>
                                      	<option value="SX">Sint Maarten (Dutch part)</option>
                                      	<option value="SK">Slovakia</option>
                                      	<option value="SI">Slovenia</option>
                                      	<option value="SB">Solomon Islands</option>
                                      	<option value="SO">Somalia</option>
                                      	<option value="ZA">South Africa</option>
                                      	<option value="GS">South Georgia and the South Sandwich Islands</option>
                                      	<option value="SS">South Sudan</option>
                                      	<option value="ES">Spain</option>
                                      	<option value="LK">Sri Lanka</option>
                                      	<option value="SD">Sudan</option>
                                      	<option value="SR">Suriname</option>
                                      	<option value="SJ">Svalbard and Jan Mayen</option>
                                      	<option value="SZ">Swaziland</option>
                                      	<option value="SE">Sweden</option>
                                      	<option value="CH">Switzerland</option>
                                      	<option value="SY">Syrian Arab Republic</option>
                                      	<option value="TW">Taiwan, Province of China</option>
                                      	<option value="TJ">Tajikistan</option>
                                      	<option value="TZ">Tanzania, United Republic of</option>
                                      	<option value="TH">Thailand</option>
                                      	<option value="TL">Timor-Leste</option>
                                      	<option value="TG">Togo</option>
                                      	<option value="TK">Tokelau</option>
                                      	<option value="TO">Tonga</option>
                                      	<option value="TT">Trinidad and Tobago</option>
                                      	<option value="TN">Tunisia</option>
                                      	<option value="TR">Turkey</option>
                                      	<option value="TM">Turkmenistan</option>
                                      	<option value="TC">Turks and Caicos Islands</option>
                                      	<option value="TV">Tuvalu</option>
                                      	<option value="UG">Uganda</option>
                                      	<option value="UA">Ukraine</option>
                                      	<option value="AE">United Arab Emirates</option>
                                      	<option value="GB">United Kingdom</option>
                                      	<option value="US">United States</option>
                                      	<option value="UM">United States Minor Outlying Islands</option>
                                      	<option value="UY">Uruguay</option>
                                      	<option value="UZ">Uzbekistan</option>
                                      	<option value="VU">Vanuatu</option>
                                      	<option value="VE">Venezuela, Bolivarian Republic of</option>

                                      	<option value="VG">Virgin Islands, British</option>
                                      	<option value="VI">Virgin Islands, U.S.</option>
                                      	<option value="WF">Wallis and Futuna</option>
                                      	<option value="EH">Western Sahara</option>
                                      	<option value="YE">Yemen</option>
                                      	<option value="ZM">Zambia</option>
                                      	<option value="ZW">Zimbabwe</option>
                                    </select>


                                  </div>
                              </div>
                             </div>



                        </div>
                        <div class="col-sm-6">

                          <div class="form-group">
                            <div class="row">
                               <label class="col-sm-4" for="vitri">Vị trí ứng tuyển</label>
                               <div class="col-sm-8">
                                 <select class="vitri form-control" name="vitri">
                                   <option value="">-- Chọn vị trí --</option>
                                   <?php foreach ($recruits as $recruit) { ?>
                                     <option value="<?php echo $recruit['title']; ?>"><?php echo $recruit['title']; ?></option>
                                     <?php } ?>
                                 </select>

                               </div>

                            </div>
                           </div>
                          <div class="form-group">
                            <div class="row">
                               <label class="col-sm-4" for="cv">Hồ sơ</label>
                               <div class="col-sm-8">
                                 <button type="button" id="button-upload" data-loading-text="Uploading.." class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo 'Upload'; ?></button>
                                 <input type="hidden" name="cv" value="" id="file"/>

                               </div>
                            </div>
                           </div>
                          <div class="form-group">
                            <div class="row">
                               <label class="col-sm-4" for="file">Thư xin việc</label>
                               <div class="col-sm-8">
                                 <textarea maxlength="300" name="comment" class="form-control" rows="8"></textarea>
                               </div>
                            </div>
                          </div>

                        </div>


                      </div>


                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="submit" id="button-comment" class="btn btn-primary">Gủi hồ sơ</button>
                  </div>
                </div>
              </div>


            </div>
          </div>





        </div>

      </div>

      <?php }else{ ?>
      <p class="box">
        <?php echo $text_no_results; ?>
      </p>
      <?php } ?>

      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>

<?php //require_once('form.tpl') ;?>


<script>
    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
</script>


<script type="text/javascript">
  //<!--

  $('#button-comment').on('click', function() {
    $.ajax({
      url: 'index.php?route=recruit/recruit/write&recruit_id=1',
      type: 'post',
      dataType: 'json',

      data: $("#comment_form").serialize(),
      beforeSend: function() {
        $('#button-comment').button('loading');
      },
      complete: function() {
        $('#button-comment').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('#comment_message').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }

        if (json['success']) {
          $('#comment_message').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

          $('input[name=\'name\']').val('');
          $('input[name=\'email\']').val('');
          $('input[name=\'telephone\']').val('');
          $('input[name=\'address\']').val('');
          $('input[name=\'cv\']').val('');
          $('textarea[name=\'comment\']').val('');
        }
      }
    });
  });

  $('.date').datetimepicker({
    pickTime: false,
    locate: 'vi',
    defaultDate: '30-12-1990'
  });
  //-->
</script>
<?php echo $footer; ?>
