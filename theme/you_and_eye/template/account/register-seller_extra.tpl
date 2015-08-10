<?php echo $header; ?>
<div class="container register-seller">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="alert alert-danger warning main"></div>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $ms_account_register_seller; ?></h1>
      <p><?php echo $text_account_already; ?></p>

      <form id="seller-form" class="form-horizontal">
        <fieldset id="account">
          <legend><?php echo $ms_account_register_details; ?></legend>

          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[firstname]" placeholder="<?php echo $entry_firstname; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[lastname]" placeholder="<?php echo $entry_lastname; ?>" class="form-control" />
            </div>
          </div>

		  <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_nickname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[nickname]" placeholder="<?php echo $ms_account_sellerinfo_nickname_note; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="email" name="seller[email]" placeholder="<?php echo $entry_email; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="seller[password]" placeholder="<?php echo $entry_password; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10">
              <input type="password" name="seller[password_confirm]" placeholder="<?php echo $entry_confirm; ?>" class="form-control" />
            </div>
          </div>

			<?php if (isset($seller_terms)) { ?>
			<div class="form-group required">
				<label class="col-sm-2 control-label"><?php echo $ms_account_sellerinfo_terms; ?></label>
				<div class="col-sm-10">
					<p style="margin-bottom: 0">
						<input type="checkbox" name="seller[terms]" value="1" />
						<?php echo $seller_terms; ?>
					</p>
				</div>
			</div>
			<?php } ?>
        </fieldset>

		<fieldset id="address">
          <legend><?php echo $text_your_address; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[company]" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[address_1]" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[address_2]" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[postcode]" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" maxlength = "6"/>
            </div>
          </div>
		  
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="seller[country_id]" id="input-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
		  
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name = "seller[zone_id]" id="input-zone" class="form-control">
              </select>
            </div>
          </div>
		  
		  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <select name = "seller[city]" id="input-city" class="form-control">
              </select>
            </div>
          </div>
        </fieldset>
		
		<fieldset id="bank">
          <legend><?php echo 'Bank Details'; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-acct_no"><?php echo 'Bank Account No'; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[acct_no]" placeholder="Bank Account No" id="input-acct_no" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-bank-1"><?php echo 'Bank'; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[bank]" placeholder="<?php echo 'Bank'; ?>" id="input-bank" class="form-control" />
              
            </div>
          </div>
		    <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-branch-1"><?php echo 'Branch'; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[branch]" placeholder="<?php echo 'Branch'; ?>" id="input-branch" class="form-control" />
              
            </div>
          </div>
		    <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-ifsc-1"><?php echo 'IFSC Code'; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[ifsc]" placeholder="<?php echo 'IFSC Code'; ?>" id="input-ifsc-code" class="form-control" />
             
            </div>
          </div>
		  </fieldset>
		  
        <div class="buttons">
          <div class="pull-right">
            <a class="btn btn-primary" id="ms-submit-button" value="<?php echo $button_continue; ?>"><span><?php echo $button_continue; ?></span></a>
          </div>
        </div>
      </form>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script>
	var msGlobals = {
		formError: '<?php echo htmlspecialchars($ms_error_form_submit_error, ENT_QUOTES, "UTF-8"); ?>'
	};
</script>

<script type="text/javascript"><!--
$('select[name=\'seller[country_id]\']').on('change', function() {

	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'seller[country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'seller[postcode]\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'seller[postcode]\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'seller[zone_id]\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'seller[country_id]\']').trigger('change');



$('select[name=\'seller[zone_id]\']').on('change', function() {

	$.ajax({
		url: 'index.php?route=account/account/zone&zone_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'seller[zone_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			/*if (json['postcode_required'] == '1') {
				$('input[name=\'seller[postcode]\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'seller[postcode]\']').parent().parent().removeClass('required');
			}*/

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['city'] && json['city'] != '') {
				for (i = 0; i < json['city'].length; i++) {
					html += '<option value="' + json['city'][i]['city_id'] + '"';

					if (json['city'][i]['city_id'] == '<?php echo $city_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['city'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'seller[city]\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'seller[zone_id]\']').trigger('change');

//--></script>

<?php echo $footer; ?>