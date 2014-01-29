<?php
/* @var $this StreamController */
/* @var $model Stream */
/* @var $form CActiveForm */
?>



<div class="form">



<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'streamAdd',
    'enableAjaxValidation'=>false,
    'method'=>'POST',
    'htmlOptions' => array(
        'class'=>'form-horizontal',
    )
)); ?>
        <?php echo $form->errorSummary($model); ?>
        <div class="control-group">
            <label class="control-label" for="Stream_keyword">Search Term</label>
            <div class="controls">
                <input class="input-xxlarge" type="text" id="Stream_keyword" placeholder="Enter Search Term..." name="Stream[keyword]">
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
                <button type="submit" class="btn btn-primary">Add Search Term</button>
            </div>
        </div>
<?php $this->endWidget(); ?>
</div>
<!-- form -->