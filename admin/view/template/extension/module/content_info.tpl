<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-content-info" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><i class="fa fa-recycle"></i> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if(!empty($success)) { ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-content-info" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_name; ?></label>
                <div class="col-md-10">
                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-sm-4 show-title">
                            <label class="control-label" for="input-type"><?php echo $entry_show_title; ?></label>
                            <div>
                                <?php if ($show_title==1) { ?>
                                    <input type="radio" name="show_title" value="1" checked="checked"> <label class="control-label" for="input-type"> <?php echo $entry_yes; ?></label><br>
                                    <input type="radio" name="show_title" value="0"> <label class="control-label" for="input-type"> <?php echo $entry_no; ?></label>
                                <?php }else{  ?>
                                    <input type="radio" name="show_title" value="1"> <label class="control-label" for="input-type"> <?php echo $entry_yes; ?></label><br>
                                    <input type="radio" name="show_title" value="0" checked="checked"> <label class="control-label" for="input-type"> <?php echo $entry_no; ?></label>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label" for="input-type"><?php echo $entry_type; ?></label>
                            <div>
                                <?php if ($type=='list') { ?>
                                    <input type="radio" name="type" value="list" checked="checked"> <label class="control-label" for="input-type"> <?php echo $entry_list; ?></label><br>
                                    <input type="radio" name="type" value="column"> <label class="control-label" for="input-type"> <?php echo $entry_column; ?></label>
                                    <input type="radio" name="type" value="grid"> <label class="control-label" for="input-type"> Nằm ngang</label>
                                <?php }elseif($type == 'column'){  ?>
                                    <input type="radio" name="type" value="list"> <label class="control-label" for="input-type"> <?php echo $entry_list; ?></label><br>
                                    <input type="radio" name="type" value="column" checked="checked"> <label class="control-label" for="input-type"> <?php echo $entry_column; ?></label>
                                    <input type="radio" name="type" value="grid"> <label class="control-label" for="input-type"> Nằm ngang</label>
                                <?php } else{ ?>
                                  <input type="radio" name="type" value="list"> <label class="control-label" for="input-type"> <?php echo $entry_list; ?></label><br>
                                  <input type="radio" name="type" value="column"> <label class="control-label" for="input-type"> <?php echo $entry_column; ?></label>
                                  <input type="radio" name="type" value="grid" checked="checked"><label class="control-label" for="input-type"> Nằm ngang</label>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label><?php echo $entry_class; ?>  (<span style="color: red"><?php echo $entry_des_class; ?></span>)</label>
                            <div>
                                <?php if (empty($class)) { ?>
                                    <input type="text" name="class" class="form-control"><br><?php echo $entry_des_class; ?>
                                <?php }else{  ?>
                                <input type="text" name="class" readonly value="<?php echo $class; ?>" class="form-control">
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2" for="input-type">
                    <span data-toggle="tooltip" data-original-title="<?php echo $entry_remove_field_des; ?>"><?php echo $entry_remove_field; ?></span>
                </label>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-3 <?php if($hidden_name==1) echo 'not-active';?>">
                            <div class="item-move">
                                <input type="checkbox" name="hidden_name" value="1" <?php if($hidden_name==1) echo 'checked="checked"';?>> <?php echo $entry_title; ?>
                            </div>
                        </div>
                        <div class="col-md-3 <?php if($hidden_description==1) echo 'not-active';?>">
                            <div class="item-move">
                            <input type="checkbox" name="hidden_description" value="1" <?php if($hidden_description==1) echo 'checked="checked"';?> > <?php echo $entry_description; ?>
                            </div>
                        </div>
                        <div class="col-md-3 <?php if($hidden_image==1) echo 'not-active';?>">
                            <div class="item-move">
                            <input type="checkbox" name="hidden_image" value="1" <?php if($hidden_image==1) echo 'checked="checked"';?> > <?php echo $entry_image; ?>
                            </div>
                        </div>
                        <div class="col-md-3 <?php if($hidden_link==1) echo 'not-active';?>">
                            <div class="item-move">
                            <input type="checkbox" name="hidden_link" value="1" <?php if($hidden_link==1) echo 'checked="checked"';?> > <?php echo $entry_link; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2" for="input-type"><?php echo $tab_image; ?> (<?php echo $entry_des_img; ?>)</label>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-6">
                           <input type="text" name="width" value="<?php echo  $width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="height" value="<?php echo  $height; ?>"  placeholder="<?php echo $entry_height; ?>" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div id="valule-column" class="form-group <?php if (strcmp($type,'list')==0) { ?>hidden <?php } ?>">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_column_dv; ?></label>
            <div class="col-sm-10">
              <select name="column" id="input-status" class="form-control">
                  <?php for($i=1; $i<=4;$i++){ ?>
                    <?php if ($column==$i) { ?>
                    <option value="<?php echo  $i; ?>" selected="selected"><?php  echo $i; ?> <?php echo $entry_column_select; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo  $i; ?>"><?php  echo $i; ?>  <?php echo $entry_column_select; ?></option>
                    <?php } ?>
                <?php } ?>
              </select>
            </div>
            </div>
            <div id="valule-column" class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_setting_link; ?></label>
            <div class="col-sm-10">
              <select name="setting_link" id="input-status" class="form-control">
                    <?php if ($setting_link=='title') { ?>
                        <option value="title" selected="selected"><?php echo $entry_for_title; ?></option>
                        <option value="icon"><?php echo $entry_for_icon; ?></option>
                        <option value="all"><?php echo $entry_for_item; ?></option>
                     <?php } elseif ($setting_link=='icon') { ?>
                        <option value="title"><?php echo $entry_for_title; ?></option>
                        <option value="icon" selected="selected"><?php echo $entry_for_icon; ?></option>
                        <option value="all"><?php echo $entry_for_item; ?></option>
                     <?php } else { ?>
                        <option value="title"><?php echo $entry_for_title; ?></option>
                        <option value="icon"><?php echo $entry_for_icon; ?></option>
                        <option value="all" selected="selected"><?php echo $entry_for_item; ?></option>
                    <?php } ?>
              </select>
            </div>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
            </div>

            <table class="table table-bordered">
                <thead style="background:#fafafa">
                    <tr>
                        <?php if($hidden_name==0){ ?>
                        <td width="150px"><?php echo $entry_title; ?></td>
                        <?php } ?>
                        <?php if($hidden_description==0){ ?>
                        <td width="0px"><?php echo $entry_description; ?></td>
                        <?php } ?>
                        <?php if($hidden_image==0){ ?>
                        <td>
                            <label class="control-label">
                            <span data-toggle="tooltip" data-original-title="<?php echo $entry_field_image_des; ?>"><?php echo $entry_image; ?></span>
                            </label>
                        </td>
                        <?php } ?>
                        <?php if($hidden_link==0){ ?>
                        <td><?php echo $entry_link; ?></td>
                        <?php } ?>
                        <td style="width:50px"><?php echo $entry_action; ?></td>

                    </tr>
                </thead>
                <tbody id="content-item" >
                    <?php if(!empty($info)){ ?>
                    <?php foreach($info['link'] as $key=>$item){ ?>
                    <tr id="item-id-<?php echo trim($key); ?>">
                        <?php if($hidden_name==0){ ?>
                        <td style="vertical-align:top">
                              <div class="form-group">
                                    <div class="col-md-12">
                                        <ul class="nav nav-tabs">
                                            <?php foreach ($languages as $language) { ?>
                                            <li data-toggle="tooltip"  data-original-title="<?php echo $language['name']; ?>"><a href="#name-item-<?php echo $key.'-'.$language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a></li>
                                            <?php } ?>
                                        </ul>
                                        <div class="tab-content">
                                            <?php foreach ($languages as $language) { ?>
                                            <div class="tab-pane" id="name-item-<?php echo $key.'-'.$language['language_id']; ?>">
                                                  <input type="text" name="info[name][<?php echo $language['language_id']; ?>][<?php echo $key; ?>]" placeholder="<?php echo $entry_title; ?>" value="<?php echo isset($info['name'][$language['language_id']][$key]) ? $info['name'][$language['language_id']][$key] : ''; ?>" class="form-control" />
                                            </div>
                                            <?php } ?>
                                        </div>
                                        <?php if ($error_name) { ?>
                                        <div class="text-danger"><?php echo $error_name; ?></div>
                                        <?php } ?>
                                    </div>
                              </div>
                        </td>
                        <?php } ?>
                        <?php if($hidden_description==0){ ?>
                        <td style="vertical-align:top">
                            <div class="tab-pane">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs">
                                      <?php foreach ($languages as $language) { ?>
                                      <li data-toggle="tooltip"  data-original-title="<?php echo $language['name']; ?>"><a href="#language-<?php echo $key.'-'.$language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a></li>
                                      <?php } ?>
                                    </ul>
                                    <div class="tab-content">
                                      <?php foreach ($languages as $language) { ?>
                                      <div class="tab-pane" id="language-<?php echo $key.'-'.$language['language_id']; ?>">
                                        <div class="form-group">
                                            <input type="text" name="info[title][<?php echo $language['language_id']; ?>][<?php echo $key; ?>]" placeholder="<?php echo $entry_title_des; ?>"  value="<?php echo isset($info['title'][$language['language_id']][$key]) ? $info['title'][$language['language_id']][$key] : ''; ?>" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <textarea name="info[description][<?php echo $language['language_id']; ?>][<?php echo $key; ?>]" placeholder="<?php echo $entry_description; ?>"  class="form-control"><?php echo isset($info['description'][$language['language_id']][$key]) ? $info['description'][$language['language_id']][$key] : ''; ?></textarea>
                                        </div>
                                      </div>
                                      <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <?php } ?>
                        <?php if($hidden_image==0){ ?>
                        <td style="vertical-align:top">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs">
                                        <li data-toggle="tooltip"  data-original-title="<?php echo $tab_image; ?>" class="<?php if(!empty($info['image'][0][$key])) echo 'active'; ?>">
                                          <a href="#image_<?php echo $key; ?>_1" data-toggle="tab"><i class="fa fa-file-image-o"></i></a>
                                      </li>
                                      <li data-toggle="tooltip"  data-original-title="<?php echo $tab_icon; ?>"  class="<?php if(!empty($info['image'][1][$key])) echo 'active'; ?>">
                                          <a href="#image_<?php echo $key; ?>_2" data-toggle="tab"><i class="fa fa-font"></i></a>
                                      </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="text-center tab-pane <?php if(!empty($info['image'][0][$key])) echo 'active'; ?>" id="image_<?php echo $key; ?>_1">
                                            <a href="" id="thumb-image-<?php echo $key; ?>" data-toggle="image" class="img-thumbnail-get img-thumbnail-<?php echo $key; ?>"><img src="<?php if(!empty($thumb['image'][0][$key])){ echo $thumb['image'][0][$key];  } else { echo $placeholder; }  ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                            <input style="display: initial;" type="hidden" name="info[image][0][<?php echo $key; ?>]" value="<?php if(!empty($info['image'][0][$key])) echo $info['image'][0][$key] ?>" id="input-image-<?php echo $key; ?>" class="form-control" />
                                        </div>
                                        <div class="item-icon text-center tab-pane <?php if(!empty($info['image'][1][$key])) echo 'active'; ?>" style="position:relative" id="image_<?php echo $key; ?>_2">
                                            <input style="display: initial;" type="text" name="info[image][1][<?php echo $key; ?>]" value="<?php if(!empty($info['image'][1][$key])) echo $info['image'][1][$key] ?>" id="input-icon" class="form-control" /><br>
                                            <?php if(!empty($info['image'][1][$key])) { ?>
                                            <div class="add-icon" data-toggle="tooltip" data-original-title="<?php echo $text_tooltip_icon; ?>" style="cursor: pointer; position: absolute; right:1px; top: 1px;background: #23C1F0; padding: 8px 12px;color: #fff; display: inline-block;">
                                                <i class="fa <?php echo $info['image'][1][$key]; ?> fa-lg"></i>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <?php } ?>
                        <?php if($hidden_link==0){ ?>
                        <td>
                            <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="info[link][<?php echo $key; ?>]" value="<?php echo $info['link'][$key] ?>" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control" />
                                    </div>
                            </div>
                        </td>
                        <?php } ?>
                        <td>
                            <div class="form-group"><div class="col-md-12"><button type="button"  data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger remove-item"><i class="fa fa-minus-circle"></i></button></div></div>
                        </td>
                    </tr>
                    <?php } //End Foreach($info) ?>
                    <?php } //End if(!empty($info)) ?>
                </tbody>
            </table>
            <div class="add-item text-right">
                <a href="javascript:;" data-toggle="tooltip" id="add-item" class="btn btn-primary" data-original-title="<?php echo $button_add; ?>">
                    <i class="fa fa-plus"></i> <?php echo $button_add; ?>
                </a>
            </div>
        </form>
      </div>
    </div>
  </div>
  <!--script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script -->
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
$('.nav.nav-tabs').each(function(){
    if($(this).find('.active').length==0){
       $(this).find('a:first').tab('show');
    }
});
//--></script>
</div>
<script type="text/javascript"><!--
var image_row = $("#content-item tr").length;
$(document).on('click','#add-item',function(){
    addItem();
});
$(document).on('click','.remove-item',function(){
   $(this).parents('tr').first().remove();
   image_row--;
});
$(document).on('click','.add-icon',function(){
   $(this).parents('.item-icon').find('input').first().focus();
   $(this).parents('.item-icon').find('input').first().select();
});
$('input:radio').change(function(){
    var val=$(this).val();
    if(val=='column'){
            $('#valule-column').removeClass('hidden');
            $('#valule-column select[name="column"]').val(1);
    }else{
          $('#valule-column').addClass('hidden');
    }
});




function addItem() {
        html  = '<tr id="item-id-'+ image_row + '">';
        <?php if($hidden_name==0){ ?>
        html  += '       <td style="vertical-align:top">';
        html  += '           <div class="form-group">';
        html  += '                  <div class="col-md-12">';
        html  += '                      <ul class="nav nav-tabs" id="name-item">';
                                            <?php foreach ($languages as $language) { ?>
        html  += '                          <li data-toggle="tooltip"  data-original-title="<?php echo $language['name']; ?>"><a href="#name-item-'+ image_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a></li>';
                                            <?php } ?>
        html  += '                      </ul>';
        html  += '                      <div class="tab-content">';
                                            <?php foreach ($languages as $language) { ?>
        html  += '                          <div class="tab-pane" id="name-item-'+ image_row + '-<?php echo $language['language_id']; ?>">';
        html  += '                            <input type="text" name="info[name][<?php echo $language['language_id']; ?>]['+image_row+']" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
        html  += '                          </div>';
                                            <?php } ?>
        html  += '                      </div>';
                                        <?php if ($error_name) { ?>
        html  += '                          <div class="text-danger"><?php echo $error_name; ?></div>';
                                        <?php } ?>
        html  += '                  </div>';
        html  += '            </div>' ;
        html  += '      </td>';
        <?php } ?>
        <?php if($hidden_description==0){ ?>
        html  += '      <td style="vertical-align:top">';
        html  += '          <div class="tab-pane">';
        html  += '              <div class="col-md-12">';
        html  += '                  <ul class="nav nav-tabs">';
                                      <?php foreach ($languages as $language) { ?>
        html  += '                    <li data-toggle="tooltip"  data-original-title="<?php echo $language['name']; ?>"><a href="#language-'+ image_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a></li>';
                                      <?php } ?>
        html  += '                  </ul>';
        html  += '                  <div class="tab-content">';
                                      <?php foreach ($languages as $language) { ?>
        html  += '                  <div class="tab-pane" id="language-'+ image_row + '-<?php echo $language['language_id']; ?>">';
        html  += '                      <div class="form-group">';
        html  += '                          <input type="text" name="info[title][<?php echo $language['language_id']; ?>]['+image_row +']" placeholder="<?php echo $entry_title_des; ?>" class="form-control" />';
        html  += '                      </div>';
        html  += '                      <div class="form-group">';
        html  += '                          <textarea name="info[description][<?php echo $language['language_id']; ?>]['+image_row +']" placeholder="<?php echo $entry_description; ?>" class="form-control"></textarea>';
        html  += '                      </div>';
        html  += '                  </div>';
                                      <?php } ?>
        html  += '                  </div>';
        html  += '              </div>';
        html  += '          </div>';
        html  += '      </td>';
        <?php } ?>
        <?php if($hidden_image==0){ ?>
        html  += '      <td style="vertical-align:top">';
        html  += '          <div class="form-group"> '
        html  += '              <div class="col-md-12">';
        html  += '                  <ul class="nav nav-tabs" id="image">';
        html  += '                    <li data-toggle="tooltip"  data-original-title="image">';
        html  += '                        <a href="#image_' + image_row + '_1" data-toggle="tab"><i class="fa fa-file-image-o"></i></a>';
        html  += '                    </li>';
        html  += '                    <li data-toggle="tooltip"  data-original-title="Icon">';
        html  += '                        <a href="#image_' + image_row + '_2" data-toggle="tab"><i class="fa fa-font"></i></a>';
        html  += '                    </li>';
        html  += '                  </ul>';
        html  += '                  <div class="tab-content">';
        html  += '                      <div class="text-center tab-pane" id="image_' + image_row + '_1">';
        html  += '                      <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
        html  += '                      <input style="display: initial;" type="hidden" name="info[image][0][' + image_row + ']" value="" id="input-image" class="form-control" />';
        html  += '                      </div>';
        html  += '                      <div class="text-center tab-pane" id="image_' + image_row + '_2">';
        html  += '                          <input style="display: initial;" type="text" name="info[image][1][' + image_row + ']" value="" id="input-icon" class="form-control" />';
        html  += '                      </div>';
        html  += '                  </div>';
        html  += '              </div>';
        html  += '          </div>';
        html  += '      </td>';
        <?php } ?>
        <?php if($hidden_link==0){ ?>
        html  += '      <td>';
        html  += '          <div class="form-group">';
        html  += '                  <div class="col-md-12">';
        html  += '                      <input type="text" name="info[link][' + image_row + ']" value="" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control" />';
        html  += '                  </div>';
        html  += '          </div>';
        html  += '      </td>';
        <?php } ?>
        html  += '      <td>';
        html  += '          <div class="form-group"><div class="col-md-12"><button type="button"  data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger remove-item"><i class="fa fa-minus-circle"></i></button></div></div>';
        html  += '      </td>';
        html  += '    </tr>';

	$('tbody#content-item').append(html);
	$('.nav.nav-tabs').each(function(){
		if($(this).find('.active').length==0){
		   $(this).find('a:first').tab('show');
		}
	});
	image_row++;
}
//--></script>
<style type="text/css">
    #content-item .nav-tabs > li.active > a, #content-item .nav-tabs > li.active > a:hover, #content-item .nav-tabs > li.active > a:focus{
        outline: 1px solid #23C1F0!important;
        border:0!important;
        padding: 3px 8px!important;
        text-align: center;
        border-radius: 0px;
        outline-offset: 0px;
        background: #fafafa;
    }
    #content-item .nav > li > a:hover, #content-item .nav > li > a:focus{
        outline: 1px solid #DDDDDD!important;
        border:0!important;
        padding: 3px 8px!important;
        text-align: center;
        border-radius: 0px;
        outline-offset: 0px;
    }
    #content-item .nav > li > a{
        padding: 3px 8px!important;
        outline:1px solid rgb(221, 221, 221);
        border:0!important;
        outline-offset: 0px;
        margin-right: 3px;
        margin-bottom: 1px;
        font-size: 14px;
    }
   #content-item .nav-tabs{
       margin-top: 5px;
   }
   .item-move{
    background: #23C1F0;
    border: 1px solid #20B1DC;
    padding: 10px;
    color: #fff;
    box-shadow: 0 6px 20px -14px #000;
   }
   .item-move input{border:0px; margin-right: 7px;}
   .not-active .item-move{
        background: #19A7D2;
        border: 1px solid #19A7D2;
   }
   a.img-thumbnail-get{ display: inline-block; background: #fafafa; border: 1px solid #eeeeee; }
</style>
<?php echo $footer; ?>
