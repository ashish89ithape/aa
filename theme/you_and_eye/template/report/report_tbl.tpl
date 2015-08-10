		<table border = 1 style = "width:100%">
			<thead>
				<tr role = 'row'>
					<td class="medium">Seller</td>
					<td class="medium">Pending</td>
					<td class="medium">In Process</td>
					<td class="medium">Inspection Pending</td>
				</tr>
			</thead>
			<tbody>
			<?php if(isset($count) && count($count) > 0){ 
						foreach($count as $val){
							if($val['product_count']['pending'] == 0 && $val['product_count']['in_process'] == 0 && $val['product_count']['ins_pending'] == 0){ } else{
							echo '<tr role = "row">'; 
								echo '<td>' . $val['seller_name'] . '</td>';
								echo '<td>' . $val['product_count']['pending'] . '</td>';
								echo '<td>' . $val['product_count']['in_process'] . '</td>';
								echo '<td>' . $val['product_count']['ins_pending'] . '</td>';
							echo '</tr>'; 
						 } 
						}
					} ?>
			</tbody>
		</table>