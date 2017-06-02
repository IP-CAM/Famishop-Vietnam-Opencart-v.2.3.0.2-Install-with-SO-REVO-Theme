<div class="content_info <?php echo $class; ?>">
<?php if($show_title){ ?>
    <div class="title"><h3><span><?php echo $name; ?></span></h3></div>
<?php } ?>
<?php if($type=='list' || $column==1) { ?>
<ul class="list">
    <?php foreach($info['link'] as $key=>$item){ ?>
        <li class="item-content">
            <?php if($setting_link=='all' && !empty($info['link'][$key])){ ?>
                <a href="<?php echo $info['link'][$key]?>">
            <?php } ?>
            <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                <a href="<?php echo $info['link'][$key]?>">
            <?php } ?>
                <?php if(!empty($info['image'][0][$key]) && empty($info['image'][1][$key]) || !empty($info['image'][0][$key]) && !empty($info['image'][1][$key])){ ?>
                    <div class="item-image">
                        <img src="<?php echo $thumb['image'][0][$key]; ?>">
                    </div>
                <?php }elseif(!empty($info['image'][1][$key]) && empty($info['image'][0][$key])){ ?>
                    <div class="item-image">
                        <i class="fa <?php echo $info['image'][1][$key]; ?>"></i>
                    </div>
                <?php } ?>
            <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                </a>
            <?php } ?>
            <?php if(!empty($info['name'][$language_current][$key])){ ?>
                <div class="item-title">
                    <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                         <a href="<?php echo $info['link'][$key]?>">
                    <?php } ?>
                    <?php echo html_entity_decode($info['name'][$language_current][$key], ENT_QUOTES, 'UTF-8'); ?>
                    <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                        </a>
                    <?php } ?>
                    <?php if(!empty($info['title'][$language_current][$key])){ ?>
                    <span class="title-child"><?php echo $info['title'][$language_current][$key]; ?></span>
                    <?php } ?>
                </div>
            <?php } ?>
            <?php if(!empty($info['description'][$language_current][$key])){ ?>
                <div class="item-description">
                    <?php echo $info['description'][$language_current][$key]; ?>
                </div>
            <?php } ?>
            <?php if($setting_link=='all'&& !empty($info['link'][$key])){ ?>
                </a>
            <?php } ?>
        </li>
    <?php } ?>
</ul>
<?php }elseif($type=='column'){ ?>
    <div class="row content-column">
        <?php foreach($info['link'] as $key=>$item){ ?>
            <div class="item-content col-md-<?php echo 12/$column; ?>">
                <?php if($setting_link=='all' && !empty($info['link'][$key])){ ?>
                    <a href="<?php echo $info['link'][$key]?>">
                <?php } ?>
                <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                    <a href="<?php echo $info['link'][$key]?>">
                <?php } ?>
                    <?php if(!empty($info['image'][0][$key]) && empty($info['image'][1][$key]) || !empty($info['image'][0][$key]) && !empty($info['image'][1][$key])){ ?>
                        <div class="item-image">
                            <img src="<?php echo $thumb['image'][0][$key]; ?>">
                        </div>
                    <?php }elseif(!empty($info['image'][1][$key]) && empty($info['image'][0][$key])){ ?>
                        <div class="item-image">
                            <i class="fa <?php echo $info['image'][1][$key]; ?>"></i>
                        </div>
                    <?php } ?>
                <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                    </a>
                <?php } ?>
                <?php if(!empty($info['name'][$language_current][$key])){ ?>
                    <div class="item-title">
                        <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                             <a href="<?php echo $info['link'][$key]?>">
                        <?php } ?>
                        <?php echo html_entity_decode($info['name'][$language_current][$key], ENT_QUOTES, 'UTF-8'); ?>
                        <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                            </a>
                        <?php } ?>
                        <?php if(!empty($info['title'][$language_current][$key])){ ?>
                        <span class="title-child"><?php echo $info['title'][$language_current][$key]; ?></span>
                        <?php } ?>
                    </div>
                <?php } ?>
                <?php if(!empty($info['description'][$language_current][$key])){ ?>
                    <div class="item-description">
                        <?php echo $info['description'][$language_current][$key]; ?>
                    </div>
                <?php } ?>
                <?php if($setting_link=='all' && !empty($info['link'][$key])){ ?>
                    </a>
                <?php } ?>
            </div>
        <?php } ?>
    </div>
<?php } else{ ?>
  <ul class="row content-grid">
      <?php foreach($info['link'] as $key=>$item){ ?>
          <li class="item-content">
              <?php if($setting_link=='all' && !empty($info['link'][$key])){ ?>
                  <a href="<?php echo $info['link'][$key]?>">
              <?php } ?>
              <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                  <a href="<?php echo $info['link'][$key]?>">
              <?php } ?>
                  <?php if(!empty($info['image'][0][$key]) && empty($info['image'][1][$key]) || !empty($info['image'][0][$key]) && !empty($info['image'][1][$key])){ ?>
                      <div class="item-image">
                          <img src="<?php echo $thumb['image'][0][$key]; ?>">
                      </div>
                  <?php }elseif(!empty($info['image'][1][$key]) && empty($info['image'][0][$key])){ ?>
                      <div class="item-image">
                          <i class="fa <?php echo $info['image'][1][$key]; ?>"></i>
                      </div>
                  <?php } ?>
              <?php if($setting_link=='icon' && !empty($info['link'][$key])){ ?>
                  </a>
              <?php } ?>
              <?php if(!empty($info['name'][$language_current][$key])){ ?>
                  <div class="item-title">
                      <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                           <a href="<?php echo $info['link'][$key]?>">
                      <?php } ?>
                      <?php echo html_entity_decode($info['name'][$language_current][$key], ENT_QUOTES, 'UTF-8'); ?>
                      <?php if($setting_link=='title' && !empty($info['link'][$key])){ ?>
                          </a>
                      <?php } ?>
                      <?php if(!empty($info['title'][$language_current][$key])){ ?>
                      <span class="title-child"><?php echo $info['title'][$language_current][$key]; ?></span>
                      <?php } ?>
                  </div>
              <?php } ?>
              <?php if(!empty($info['description'][$language_current][$key])){ ?>
                  <div class="item-description">
                      <?php echo $info['description'][$language_current][$key]; ?>
                  </div>
              <?php } ?>
              <?php if($setting_link=='all' && !empty($info['link'][$key])){ ?>
                  </a>
              <?php } ?>
          </li>
      <?php } ?>
  </ul>
<?php } ?>
</div>
