<?php
/* @var $this StreamController */
/* @var $model Stream */
/* @var $form CActiveForm */
?>

<div class="form">

    <?php $form=$this->beginWidget('CActiveForm', array(
        // Please note: When you enable ajax validation, make sure the corresponding
        // controller action is handling ajax validation correctly.
        // See class documentation of CActiveForm for details on this,
        // you need to use the performAjaxValidation()-method described there.
        'enableAjaxValidation'=>false,
        'id'=>'streamAdd',
        'method'=>'POST',
        'htmlOptions' => array(
            'class'=>'form-horizontal',
        )
    )); ?>
    <?php echo $form->errorSummary($model); ?>
    <div class="control-group">
        <?php echo $form->labelEx($model,'keyword', array('class'=>'control-label')); ?>
        <div class="controls">
            <?php echo $form->textField($model,'keyword',array('class'=>'input-xxlarge','placeholder'=>'Enter Search Term' )); ?>
            <br>
            <label class="checkbox inline">
                <input type="checkbox" id="Stream_is_phrase" value="y" name="Stream[is_phrase]"> Exact Match
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="Stream_is_profile" value="y" name="Stream[is_profile]"> Is Twitter Profile
            </label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Source</label>
        <div class="controls">
            <label class="checkbox inline">
                <input type="checkbox" id="Stream_is_twitter" value="y" name="Stream[is_twitter]" checked="checked"> Twitter
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="Stream_is_facebook" value="y" name="Stream[is_facebook]"> Facebook
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="Stream_is_gplus" value="y" name="Stream[is_gplus]"> Google Plus
            </label>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <?php echo CHtml::submitButton('Add Search Term', array('class'=>'btn btn-primary')); ?>
        </div>
    </div>
    <?php $this->endWidget(); ?>

</div><!-- form -->