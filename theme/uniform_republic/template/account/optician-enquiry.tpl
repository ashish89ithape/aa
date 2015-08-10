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
      <h1><?php echo $ms_account_enquiry_optician; ?></h1>
      <p><?php echo $text_account_already; ?></p>
          
      <form id="seller-form" class="form-horizontal">
        <fieldset id="account">
          <legend></legend>
		<div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[company]" placeholder="<?php echo $entry_company; ?>" class="form-control" />
            </div>
          </div>
        
		<div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_contact_person; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[contactperson]" placeholder="<?php echo $entry_contact_person; ?>" class="form-control" />
            </div>
          </div>

		  <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="email" name="seller[email]" placeholder="<?php echo $entry_email; ?>" class="form-control" />
            </div>
          </div>
		  <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller[telephone]" placeholder="<?php echo $entry_telephone; ?>" class="form-control" />
            </div>
          </div>

          <!--<div class="form-group required">
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
          </div>-->

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

        <div class="buttons">
          <div class="pull-right">
            <a class="btn btn-primary" id="ms-submit-button"><span><?php echo $ms_button_submit; ?></span></a>
          </div>
        </div>
      </form>
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>Thank You We will get back to you shortly</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default close" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script>
	var msGlobals = {
		
		formError: '<?php echo htmlspecialchars($ms_error_form_submit_error, ENT_QUOTES, "UTF-8"); ?>'
	};
$(function() {
 var $fancymessage = "<div id='c_confirm'>Thank You<br/>We will get back to you shortly</div>";

 
    $("#ms-submit-button").click(function() {
	
        var button = $(this);

        $.ajax({
            type: "POST",
            dataType: "json",
            url: $('base').attr('href') + 'index.php?route=account/enquiry-optician/jxsavesellerinfo',
            data: $("form#seller-form").serialize(),
            beforeSend: function() {
				
                button.hide();
                $('p.error').remove();
                $('.warning.main').hide();
                $('.form-group').removeClass("has-error");
            },
            complete: function(jqXHR, textStatus) {
				button.show();
                if (textStatus != 'success') {
                    button.show();
                    $(".warning.main").text(msGlobals.formError).show();
                    window.scrollTo(0,0);
                }
				
            },
            success: function(jsonData) {
				button.show();
                if (!jQuery.isEmptyObject(jsonData.errors)) {
                    $('#ms-submit-button').show().prev('span.wait').remove();
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
                } else {
					button.show();
					$("#success").show();
					$('#success').delay(2000).fadeOut();
					$("#seller-form")[0].reset();
					$("#myModal").modal('show');
					
					//$.fancybox($fancymessage);
					//$("#seller-form").val('');
					//$('#').reset();
					//setInterval('autoRefresh1()', 1000);
                   // window.location = jsonData.redirect;
                }
            }
        });
    });
$('.close').click(function()
{
	
	window.location.href = "index.php";
	
});

});
</script>
<?php echo $footer; ?>
