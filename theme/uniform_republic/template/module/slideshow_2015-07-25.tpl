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


<div class="search_box col-lg-3 col-md-6 col-xs-11 col-sm-6">
		<div class="row">
			<div class="form-heading">find unifor for your institue</div>
		</div>
		<div class="row">
			<ul class="radio_holder">
				<li>
					<input type="radio" name="sex" id="school" value="school">
					<label for="school">School</label>
				</li>
				<li>
					<input type="radio" name="sex" id="college" value="college">
					<label for="college">College</label>
				</li>
				<li>
					<input type="radio" name="sex" id="organazation" value="organazation">
					<label for="organazation">organazation</label>
				</li>
			</ul>
		</div>

		<!--<div class="row">
			<div class="select_holder">
				<select name="city" form="cityform" class="drop">
					<option value="mumbai">mumbai</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="select_holder">
				<select name="school" form="cityform" class="drop">
					<option value="vhm">vhm</option>
				</select>
			</div>	
		</div>-->
		
		
		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control city" placeholder="City" id="city">
			</div>	
		</div>
		
		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control" placeholder="School/College/organazation">
			</div>	
		</div>

		<div class="row">
			<div class="select_holder">
				<input type="text" class="form-control"placeholder="Area">
			</div>	
		</div>
		
		
		
		
		<div class="row pull-right">
			<input type="button" id="search_now" value="GO" name="go" class="go">
		</div>
    
</div>

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
$('.city').on('keyup', function() {
	 var city = $('#city');
	 city.click(function() {
            alert(city.val());
        });
	
});
//--></script>