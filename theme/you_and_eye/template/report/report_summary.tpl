<?php echo $header; ?>

<!-- DataTable Added -->
<link href="catalog/view/javascript/multimerch/datatables/css/jquery.dataTables.css" type="text/css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/multimerch/datatables/js/jquery.dataTables.min.js" type="text/javascript"></script>

<div class="container" class="ms-account-product">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="ms-account-transaction <?php echo $class; ?>"><?php echo $content_top; ?>
    <h1><?php echo $ms_catalog_reports_heading; ?></h1>

    <?php $url = $this->url->link('report/trigger/getInventoryData','', 'SSL'); ?>


  <div class="table-responsive">
          <table border = 1 style = "width:100%" id = "unpublished">
          <thead>
            <tr role = 'row'>
              <th>Status</th>
              <th>Unpublished Product Count</th>
            </tr>
          </thead>
          <tbody>
          <?php if(isset($count) && count($count) > 0){ 

            echo '<tr role = "row">'; 
            echo '<td>Pending</td>';   
            echo '<td>'.$count['pending'].'</td>'; 
            echo '</tr>'; 

            echo '<tr role = "row">';   
            echo '<td>In Process</td>';   
            echo '<td>'.$count['in_process'].'</td>'; 
            echo '</tr>'; 

            echo '<tr role = "row">'; 
            echo '<td>Insection Pending</td>';   
            echo '<td>'.$count['ins_pending'].'</td>';   
            echo '</tr>'; 
              } ?>
          </tbody>
        </table>
  </div>

    <div class="buttons clearfix">
    <div class="pull-left"><a href="<?php echo $button_back['href']; ?>" class="btn btn-default"><?php echo $button_back['text']; ?></a></div>
    <div class="pull-right"><a href="<?php echo $url; ?>" class="btn btn-primary">Export to Excel</a></div>
    </div>
    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>

<script>
$(document).ready(function(){
    $('#unpublished').DataTable({
        "bSort" : false
    });
})
</script>