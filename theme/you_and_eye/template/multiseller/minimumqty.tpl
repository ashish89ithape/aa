<?php echo $header; ?>
<div class="container ms-account-product-form" xmlns="http://www.w3.org/1999/html">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="alert alert-danger warning main" style="display: none"><i class="fa fa-exclamation-circle"></i></div>

  <?php if (isset($success) && ($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?></div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<div id="content" class="ms-product <?php echo $class; ?> ms-account-profile"><?php echo $content_top; ?>
    <h1><?php echo $ms_account_minimumqty_heading; ?></h1>

	<form id="ms-sellerinfo" class="ms-form form-horizontal">
		<input type="hidden" name="action" id="ms_action" />
		<!-- todo status check update -->
	
		 <?php 
		 
		 if (isset($hierarchydata)) {
          foreach ($hierarchydata as $hierarchydatas) { 
		//echo '<pre>'; print_r($hierarchydatas);
		  
		  ?>
		  	
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_minimumqty_title; ?></label>
			<div class="col-sm-10">
                <input type="radio" name="seller[<?php echo $hierarchydatas['brand_id']?>][status]" value="1" <?php if($hierarchydatas['status']=='1') { ?> checked="checked" <?php } else{  echo "checked='checked'"; } ?>/>
                <?php echo $text_yes; ?>
                <input type="radio" name="seller[<?php echo $hierarchydatas['brand_id']?>][status]" value="0" <?php if($hierarchydatas['status']=='0') { ?> checked="checked" <?php }?> />
                <?php echo $text_no; ?>
                </div>
			
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $hierarchydatas['name']; ?></label>
			<div class="col-sm-10">
			<input type="hidden" value="<?php echo $hierarchydatas['brand_id']; ?>" name="seller[<?php echo $hierarchydatas['brand_id']?>][brand_id]">
				
				<input type="text" class="form-control"  name="seller[<?php echo $hierarchydatas['brand_id']?>][qty]" 
				value="<?php if(isset($hierarchydatas['minimum_qty'])) { echo $hierarchydatas['minimum_qty'];} ?>" />
			
			</div>
		</div>
		 <?php } }?>
	</form>
<div class="buttons">
			<div class="pull-left">
			<a href="<?php echo $link_back; ?>" class="btn btn-default"><span><?php echo $button_back; ?></span></a></div>
			<div class="pull-right"><a class="btn btn-primary" id="ms-qtysubmit-button"><span><?php echo $ms_button_save; ?></span></a></div>
			
		</div>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php $timestamp = time(); ?>
<script>
//----------minimum qty----------------//
$(function() {
	$("#ms-qtysubmit-button").click(function() {
		//alert();
		$('.success').remove();
		var button = $(this);
		var id = $(this).attr('id');

        

		$.ajax({
			type: "POST",
			dataType: "json",
			url: $('base').attr('href') + 'index.php?route=seller/minimumqty/jxsavesellerinfo',
			data: $("form#ms-sellerinfo").serialize(),
			beforeSend: function() {
				button.hide();
				$('p.error').remove();
			},
			complete: function(jqXHR, textStatus) {
				if (textStatus != 'success') {
					button.show().prev('span.wait').remove();
					$(".warning.main").text(msGlobals.formError).show();
					window.scrollTo(0,0);
				}
			},
			success: function(jsonData) {
				if (!jQuery.isEmptyObject(jsonData.errors)) {
                    $('#ms-qtysubmit-button').show().prev('span.wait').remove();
                    $('.error').text('');

                    for (error in jsonData.errors) {
                        if ($('#error_' + error).length > 0) {
                            $('#error_' + error).text(jsonData.errors[error]);
                            $('#error_' + error).parents('.form-group').addClass('has-error');
                        } else if ($('[name="'+error+'"]').length > 0) {
                            $('[name="' + error + '"]').parents('.form-group').addClass('has-error');
                            $('[name="' + error + '"]').parents('div:first').append('<p class="error">' + jsonData.errors[error] + '</p>');
                        } else $(".warning.main").append("<p>" + jsonData.errors[error] + "</p>").show();
                    }
                    window.scrollTo(0,0);
				} else if (!jQuery.isEmptyObject(jsonData.data) && jsonData.data.amount) {
					$(".ms-payment-form form input[name='custom']").val(jsonData.data.custom);
					$(".ms-payment-form form input[name='amount']").val(jsonData.data.amount);
					$(".ms-payment-form form").submit();
				} else {
					window.location = jsonData.redirect;
				}
	       	}
		});
	});
	


});
	/*var msGlobals = {
		timestamp: '<?php echo $timestamp; ?>',
		token : '<?php echo md5($salt . $timestamp); ?>',
		session_id: '<?php echo session_id(); ?>',
	
		text_delete: '<?php echo htmlspecialchars($ms_delete, ENT_QUOTES, "UTF-8"); ?>',
		text_none: '<?php echo htmlspecialchars($ms_none, ENT_QUOTES, "UTF-8"); ?>',
		uploadError: '<?php echo htmlspecialchars($ms_error_file_upload_error, ENT_QUOTES, "UTF-8"); ?>',
		formError: '<?php echo htmlspecialchars($ms_error_form_submit_error, ENT_QUOTES, "UTF-8"); ?>',
		formNotice: '<?php echo htmlspecialchars($ms_error_form_notice, ENT_QUOTES, "UTF-8"); ?>',
		
	};*/
</script>
<?php echo $footer; ?>
