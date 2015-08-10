<?php echo $header; ?>
<link href="catalog/view/theme/uniform_republic/stylesheet/jquery-ui.css" rel="stylesheet">
<link href="catalog/view/theme/uniform_republic/stylesheet/chosen.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/chosen.js" type="text/javascript"></script>

   <script>
/* $(document).ready(function(){
	 var add1= '<?php echo $seller['ms.brand_name'];?>'; 
	  $('#ms').val(add1);
	
}) */
 
  $(function() {
	var data="<?php echo $seller['ms.brand_name'];?>";

//Make an array

var dataarray=data.split(",");

// Set the value

$("#ms").val(dataarray);
	   $('#ms').change(function() {
		   var add=$(this).val();
		   $("#promoNode").val(add);
            console.log($(this).val());
			//alert($(this).val());
        }).multipleSelect({
            width: '100%'
        });
		
    $( ".datepicker" ).datepicker();
  });
  
  console.log(<?php echo $seller['ms.brand_name'];?>);
  </script>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if (isset($error_warning) && $error_warning) { ?>
  <div class="alert alert-danger warning main"><?php echo $error_warning; ?></div>
  <?php } ?>

  <?php if (isset($success) && ($success)) { ?>
		<div class="alert alert-success"><?php echo $success; ?></div>
  <?php } ?>

    <?php if (isset($statustext) && ($statustext)) { ?>
        <div class="alert alert-<?php echo $statusclass; ?>"><?php echo $statustext; ?></div>
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
    <h1><?php echo $ms_account_sellerinfo_heading; ?></h1>

	<form id="ms-sellerinfo" class="ms-form form-horizontal">
		<input type="hidden" name="action" id="ms_action" />
		<!-- todo status check update -->
		<?php if ($seller['ms.seller_status'] == MsSeller::STATUS_DISABLED || $seller['ms.seller_status'] == MsSeller::STATUS_DELETED) { ?>
		<div class="ms-overlay"></div>
		<?php } ?>

		<div class="form-group required">
			<?php if (!$this->config->get('msconf_change_seller_nickname') && !empty($seller['ms.nickname'])) { ?>
				<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_nickname; ?></label>
				<div class="col-sm-10">
					<b><?php echo $seller['ms.nickname']; ?></b>
				</div>
			<?php } else { ?>
				<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_nickname; ?></label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  name="seller[nickname]" value="<?php echo $seller['ms.nickname']; ?>" />
					<p class="ms-note"><?php echo $ms_account_sellerinfo_nickname_note; ?></p>
				</div>
			<?php } ?>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_description; ?></label>
			<div class="col-sm-10">
				<!-- todo strip tags if rte disabled -->
				<textarea name="seller[description]" id="seller_textarea" class="form-control <?php echo $this->config->get('msconf_enable_rte') ? 'ckeditor' : ''; ?>"><?php echo $this->config->get('msconf_enable_rte') ? htmlspecialchars_decode($seller['ms.description']) : strip_tags(htmlspecialchars_decode($seller['ms.description'])); ?></textarea>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_description_note; ?></p>
			</div>
		</div>

		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_company; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[company]" value="<?php echo $seller['ms.company']; ?>" />
			
			</div>
		</div>
<!------Deepali Add extra field--------->
<div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_customer_type; ?></label>
            <div class="col-sm-10">
              <select name="seller[role]" placeholder="<?php echo $entry_customer_type; ?>" class="form-control" />
			  <option value=''>Select Role</option>
			  <option value='brand owner' <?php if($seller['ms.role']=='brand owner'){ echo "selected";}?>>Brand Owner</option>
			  <option value='regional officer' <?php if($seller['ms.role']=='regional officer'){ echo "selected";}?> >Regional Officer</option>
			  <option value='distributor' <?php if($seller['ms.role']=='distributor'){ echo "selected";}?>>Distributor</option>
			 
			  </select>
			
            </div>
          </div>
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_brands; ?></label>
			<input type="hidden" id="promoNode" name="seller[brands]" value="<?php echo $seller['ms.brand_name'];?>">
			<div class="col-sm-10">
			
			<select multiple="multiple"  id="ms">
			<?php foreach ($brands as $brand) { ?>
			
		<option value="<?php echo $brand['manufacturer_id']; ?>" <?php if($brand==$brand['manufacturer_id']){ echo "selected='selected'";}?>><?php echo $brand['name']; ?></option>
	 <?php } ?>
	</select>
			
			</div>
		</div>
		  <div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_license_country; ?></label>
			<div class="col-sm-10">
				<select name="seller[country_license]" class="form-control">
					<option value="" selected="selected"><?php echo $ms_account_sellerinfo_country_dont_display; ?></option>
					<?php foreach ($countries as $country) { ?>
					<option value="<?php echo $country['country_id']; ?>" <?php if ($seller['ms.country_id'] == $country['country_id'] || $country_id == $country['country_id']) { ?>selected="selected"<?php } ?>><?php echo $country['name']; ?></option>
					<?php } ?>
				</select>
				
			</div>
		</div>
		<div class="form-group required">
			<label class="col-sm-2 control-label">Periodicity of License</label>
			<div class="col-sm-10">
			
				<input type="text" class="form-control datepicker"  name="seller[license_date]" value="<?php echo $seller['ms.license_periodicity']; ?>">
				
			</div>
		</div>
		<?php //if ($this->config->get('msconf_enable_seller_certificate')) { ?>
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_certificate; ?></label>
			<div class="col-sm-10">
				<div class="buttons">
					<a name="ms-file-sellercertificate" id="ms-file-sellercertificate" class="btn btn-primary"><span>
					<?php echo $ms_button_select_image; ?></span></a>
				</div>

				<!--<p class="ms-note"><?php echo $ms_account_sellerinfo_certificate_note; ?></p>-->
			<p class="error" id="error_sellerinfo_certificate"></p>

				<div id="sellerinfo_certificate_files">
				<?php if (!empty($seller['license_certificate'])) { ?>
					<div class="ms-image">
						<input type="hidden" name="seller[licensecertificate]" value="<?php echo $seller['license_certificate']; ?>" />
						<img src="<?php echo "image/".$seller['license_certificate']; ?>" />
						<span class="ms-remove"></span>
					</div>
				<?php } ?>
				<p name="seller[licensecertificate1]"></p>
				</div>
				
			</div>
		</div>
		<?php //} ?>
		   <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
			<input type="text" class="form-control"  name="seller[telephone]" value="<?php echo $seller['ms.contact_no']; ?>" />
           
            </div>
			
          </div>
<!-----End----->

		 <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-address-1"><?php echo $ms_account_entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[address_1]" placeholder="<?php echo $ms_account_entry_address_1; ?>" id="input-address-1" class="form-control" value = "<?php echo $seller['ms.address_1']; ?>" />
              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $ms_account_entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[address_2]" placeholder="<?php echo $ms_account_entry_address_2; ?>" id="input-address-2" class="form-control" value = "<?php echo $seller['ms.address_2']; ?>" />
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $ms_account_entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[postcode]" placeholder="<?php echo $ms_account_entry_postcode; ?>" id="input-postcode" class="form-control" maxlength = "6" value = "<?php echo $seller['ms.postcode']; ?>"/>
            </div>
          </div>
		  

		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_country; ?></label>
			<div class="col-sm-10">
				<select name="seller[country]" class="form-control">
					<option value="" selected="selected"><?php echo $ms_account_sellerinfo_country_dont_display; ?></option>
					<?php foreach ($countries as $country) { ?>
					<option value="<?php echo $country['country_id']; ?>" <?php if ($seller['ms.country_id'] == $country['country_id'] || $country_id == $country['country_id']) { ?>selected="selected"<?php } ?>><?php echo $country['name']; ?></option>
					<?php } ?>
				</select>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_country_note; ?></p>
			</div>
		</div>

		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_zone; ?></label>
			<div class="col-sm-10">
				<select name="seller[zone]" class="form-control"></select>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_zone_note; ?></p>
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo 'City'; ?></label>
			<div class="col-sm-10">
				<select name="seller[city]" class="form-control"></select>
				<p class="ms-note"><?php echo 'Please select your city from the list'; ?></p>
			</div>
		</div>

		<!--<div class="form-group">
			<label class="col-sm-2 control-label"><?php //echo $ms_account_sellerinfo_paypal; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[paypal]" value="<?php echo $seller['ms.paypal']; ?>" />
				<p class="ms-note"><?php //echo $ms_account_sellerinfo_paypal_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label"><?php //echo $ms_account_sellerinfo_avatar; ?></label>
			<div class="col-sm-10">
				<input type="file" name="ms-file-selleravatar" id="ms-file-selleravatar" />
				<div class="buttons">
				<?php //if ($this->config->get('msconf_avatars_for_sellers') != 2) { ?>
					<a name="ms-file-selleravatar" id="ms-file-selleravatar" class="btn btn-primary"><span><?php echo $ms_button_select_image; ?></span></a>
				<?php //} ?>
				</div>

				<p class="ms-note"><?php //echo $ms_account_sellerinfo_avatar_note; ?></p>
				<p class="error" id="error_sellerinfo_avatar"></p>

				<div id="sellerinfo_avatar_files">
				<?php //if (!empty($seller['avatar'])) { ?>
					<div class="ms-image">
						<input type="hidden" name="seller[avatar_name]" value="<?php echo $seller['avatar']['name']; ?>" />
						<img src="<?php //echo $seller['avatar']['thumb']; ?>" />
						<span class="ms-remove"></span>
					</div>
				<?php //} ?>
				</div>
			</div>
		</div>-->

		<?php if ($this->config->get('msconf_enable_seller_banner')) { ?>
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_banner; ?></label>
			<div class="col-sm-10">
				<div class="buttons">
					<a name="ms-file-sellerbanner" id="ms-file-sellerbanner" class="btn btn-primary"><span><?php echo $ms_button_select_image; ?></span></a>
				</div>

				<p class="ms-note"><?php echo $ms_account_sellerinfo_banner_note; ?></p>
				<p class="error" id="error_sellerinfo_banner"></p>

				<div id="sellerinfo_banner_files">
				<?php if (!empty($seller['banner'])) { ?>
					<div class="ms-image">
						<input type="hidden" name="seller[banner_name]" value="<?php echo $seller['banner']['name']; ?>" />
						<img src="<?php echo $seller['banner']['thumb']; ?>" />
						<span class="ms-remove"></span>
					</div>
				<?php } ?>
				</div>
			</div>
		</div>
		<?php } ?>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo 'Bank Account No.'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[acct_no]" value="<?php echo $seller['ms.bank_acct_no']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_acct_no_note; ?></p>-->
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo 'Bank Name'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[bank]" value="<?php echo $seller['ms.bank_name']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_name_note; ?></p>-->
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo 'Bank Branch'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[branch]" value="<?php echo $seller['ms.bank_branch']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_branch_note; ?></p>-->
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo 'Bank IFSC Code'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[ifsc]" value="<?php echo $seller['ms.bank_ifsc']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_ifsc_note; ?></p>-->
			</div>
		</div>
		<!------Extra fiedl Deepali--->
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo 'Swift code'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[swift]" value="<?php echo $seller['ms.swift']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_ifsc_note; ?></p>-->
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo 'IBAN No (International Bank Account No)'; ?></label>
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="seller[iban]" value="<?php echo $seller['ms.iban']; ?>" />
				<!--<p class="ms-note"><?php //echo $ms_account_sellerinfo_ifsc_note; ?></p>-->
			</div>
		</div>
		<!---End--->
		<?php if ($ms_account_sellerinfo_terms_note) { ?>
		<div class="form-group required">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_terms; ?></label>
			<div class="col-sm-10">
				<p style="margin-bottom: 0">
					<input type="checkbox" name="seller[terms]" value="1" />
					<?php echo $ms_account_sellerinfo_terms_note; ?>
				</p>
			</div>
		</div>
		<?php } ?>

		<?php if ((!isset($seller['seller_id']) || $seller['ms.seller_status'] == MsSeller::STATUS_INCOMPLETE) && $seller_validation != MsSeller::MS_SELLER_VALIDATION_NONE) { ?>
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_reviewer_message; ?></label>
			<div class="col-sm-10">
				<textarea name="seller[reviewer_message]" id="message_textarea" class="form-control"></textarea>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_reviewer_message_note; ?></p>
			</div>
		</div>
		<?php } ?>
	</form>

		<?php if (isset($group_commissions) && $group_commissions[MsCommission::RATE_SIGNUP]['flat'] > 0) { ?>
			<p class="alert alert-warning ms-commission">
				<?php echo sprintf($this->language->get('ms_account_sellerinfo_fee_flat'),$this->currency->format($group_commissions[MsCommission::RATE_SIGNUP]['flat'], $this->config->get('config_currency')), $this->config->get('config_name')); ?>
				<?php echo $ms_commission_payment_type; ?>
			</p>

			<?php if(isset($payment_form)) { ?><div class="ms-payment-form"><?php echo $payment_form; ?></div><?php } ?>
		<?php } ?>

		<div class="buttons">
			<div class="pull-left"><a href="<?php echo $link_back; ?>" class="btn btn-default"><span><?php echo $button_back; ?></span></a></div>
			<?php if ($seller['ms.seller_status'] != MsSeller::STATUS_DISABLED && $seller['ms.seller_status'] != MsSeller::STATUS_DELETED) { ?>
			<div class="pull-right"><a class="btn btn-primary" id="ms-submit-button"><span><?php echo $ms_button_save; ?></span></a></div>
			<?php } ?>
		</div>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php $timestamp = time(); ?>
<script>
	var msGlobals = {
		timestamp: '<?php echo $timestamp; ?>',
		token : '<?php echo md5($salt . $timestamp); ?>',
		session_id: '<?php echo session_id(); ?>',
		zone_id: '<?php echo $seller['ms.zone_id'] ?>',
		city_id: '<?php echo $seller['ms.city_id'] ?>',
		uploadError: '<?php echo htmlspecialchars($ms_error_file_upload_error, ENT_QUOTES, "UTF-8"); ?>',
		formError: '<?php echo htmlspecialchars($ms_error_form_submit_error, ENT_QUOTES, "UTF-8"); ?>',
		config_enable_rte: '<?php echo $this->config->get('msconf_enable_rte'); ?>',
		zoneSelectError: '<?php echo htmlspecialchars($ms_account_sellerinfo_zone_select, ENT_QUOTES, "UTF-8"); ?>',
		zoneNotSelectedError: '<?php echo htmlspecialchars($ms_account_sellerinfo_zone_not_selected, ENT_QUOTES, "UTF-8"); ?>'
	};
	
	$(document).ready(function(){
		$.ajax({
		url: 'index.php?route=account/account/zone&zone_id=' + msGlobals.zone_id,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'seller[zone]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
		
			html = '<option value="">' + msGlobals.zoneSelectError + '</option>';

			if (json['city'] && json['city'] != '') {
				for (i = 0; i < json['city'].length; i++) {
					html += '<option value="' + json['city'][i]['city_id'] + '"';

					if (json['city'][i]['city_id'] == msGlobals.city_id) {
						html += ' selected="selected"';
					}

					html += '>' + json['city'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected">' + msGlobals.zoneNotSelectedError  + '</option>';
			}

			$('select[name=\'seller[city]\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	})
</script>

<?php echo $footer; ?>