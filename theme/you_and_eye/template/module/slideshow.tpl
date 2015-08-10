<style>
input.error{
border-color: red;
}
</style>

<!--<script src="catalog/view/javascript/jquery.validate.min.js" type="text/javascript"></script>-->

<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>

<!--<form name = "filterForm" id = "filterForm" method = "POST" >
<div class="search_box col-lg-3 col-md-6 col-xs-11 col-sm-6">
		<div class="row">
			<div class="form-heading">find uniform for your institue</div>
		</div>
		<div class="row">
			<ul class="radio_holder">
			<?php if(isset($catId['SCHOOL'])) $school = $catId['SCHOOL']; else $school = 0; ?>
			<?php if(isset($catId['COLLEGE'])) $college = $catId['COLLEGE']; else $college = 0;?>
			<?php if(isset($catId['ORGANIZATION'])) $org = $catId['ORGANIZATION']; else $org = 0;?>

				<li>
					<input type="radio" name="filter_type" onchange = "changeVal(this.value)" id="school" value="<?php echo $school; ?>">
					<label for="school">School</label>
				</li>
				<li>
					<input type="radio" name="filter_type" id="college" onchange = "changeVal(this.value)" value="<?php echo $college; ?>">
					<label for="college">College</label>
				</li>
				<li>
					<input type="radio" name="filter_type" id="organization" onchange = "changeVal(this.value)" value="<?php echo $org;?>">
					<label for="organization">Organization</label>
				</li>

			</ul>
		</div>

		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control" name = "type" id = "type" placeholder="School/College/Organization">
			</div>	
		</div>
		
		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control city" placeholder="City" id="city" name = "city">
			</div>	
		</div>
		
		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control" placeholder="Area" id = "area" name = "area">
			</div>	
		</div>
		
		<div class="row pull-right">
			<input type="submit" id="search_now" value="GO" name="go" class="go">
		</div>
    
</div>

</form>-->

<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>

<script type="text/javascript"><!--

/* On Filter Change */
function changeVal(filter_value){
	$('#type').val('');
	$('#city').val('');
	$('#area').val('');
	filter_type = filter_value;
}

if (typeof filter_type == "undefined" || filter_type == null){
/* School/College/Organization Dropdown */
$('input[name=\'type\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=common/home/getType&type=' +  encodeURIComponent(filter_type),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'type\']').val(item['label']);
	}
});

/* City Dropdown */
$('input[name=\'city\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=common/home/getCity&city=' + $('#type').val(),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'city\']').val(item['label']);
	}
});


/* Area Dropdown */
$('input[name=\'area\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=common/home/getArea&area=' + $('#city').val() + '&school=' + $('#type').val(),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'area\']').val(item['label']);
	}
});

}


$(document).ready(function(){
var filter_type = $('input[name=\'filter_type\']').val();
});
//--></script>