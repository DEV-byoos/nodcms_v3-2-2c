<input name="<?php echo $name; ?>" id="<?php echo $field_id; ?>" data-type="single" data-grid="<?php echo $grid; ?>" data-min="<?php echo $min; ?>" data-max="<?php echo $max; ?>" class="range-input <?php echo $class; ?>" value="<?php echo $default; ?>" type="text" <?php foreach ($attr as $key=>$value){ echo $key.' = "'.$value.'"'; } ?>>
