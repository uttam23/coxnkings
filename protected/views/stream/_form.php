<?php
/* @var $this StreamController */
/* @var $model Stream */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'stream-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>250)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'keyword'); ?>
		<?php echo $form->textField($model,'keyword',array('size'=>60,'maxlength'=>250)); ?>
		<?php echo $form->error($model,'keyword'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_phrase'); ?>
		<?php echo $form->textField($model,'is_phrase',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'is_phrase'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_profile'); ?>
		<?php echo $form->textField($model,'is_profile',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'is_profile'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_twitter'); ?>
		<?php echo $form->textField($model,'is_twitter',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'is_twitter'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_facebook'); ?>
		<?php echo $form->textField($model,'is_facebook',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'is_facebook'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'is_gplus'); ?>
		<?php echo $form->textField($model,'is_gplus',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'is_gplus'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status',array('size'=>8,'maxlength'=>8)); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'created_date'); ?>
		<?php echo $form->textField($model,'created_date'); ?>
		<?php echo $form->error($model,'created_date'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'modified_date'); ?>
		<?php echo $form->textField($model,'modified_date'); ?>
		<?php echo $form->error($model,'modified_date'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->