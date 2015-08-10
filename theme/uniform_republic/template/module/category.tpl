<!--<div class="list-group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>-->

<?php if(isset($subcategories) && !empty($subcategories))  {  ?>
<div class="box child-cat">
  <div class="box-heading"><?php
  
  if(isset($parentdaa) && !empty($parentdaa))
  {
   echo $parentdaa['name']; 
  }else{
   echo $heading_title; 
  }
  
  ?></div>
  <div class="box-content">
    <ul class="box-category">
      <?php foreach ($subcategories as $category) { ?>
      <li>
        <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>

      </li>
      <?php } ?>
    </ul>
  </div>
</div>

<?php } ?>