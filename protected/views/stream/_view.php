<?php
/* @var $this StreamController */
/* @var $data Stream */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('title')); ?>:</b>
	<?php echo CHtml::encode($data->title); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('keyword')); ?>:</b>
	<?php echo CHtml::encode($data->keyword); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('is_phrase')); ?>:</b>
	<?php echo CHtml::encode($data->is_phrase); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('is_profile')); ?>:</b>
	<?php echo CHtml::encode($data->is_profile); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('is_twitter')); ?>:</b>
	<?php echo CHtml::encode($data->is_twitter); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('is_facebook')); ?>:</b>
	<?php echo CHtml::encode($data->is_facebook); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('is_gplus')); ?>:</b>
	<?php echo CHtml::encode($data->is_gplus); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_date')); ?>:</b>
	<?php echo CHtml::encode($data->created_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('modified_date')); ?>:</b>
	<?php echo CHtml::encode($data->modified_date); ?>
	<br />

	*/ ?>

</div>