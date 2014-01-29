<?php
/* @var $this StreamController */
/* @var $model Stream */

$this->breadcrumbs=array(
	'Streams'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Stream', 'url'=>array('index')),
	array('label'=>'Create Stream', 'url'=>array('create')),
	array('label'=>'Update Stream', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Stream', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Stream', 'url'=>array('admin')),
);
?>

<h1>View Stream #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'keyword',
		'is_phrase',
		'is_profile',
		'is_twitter',
		'is_facebook',
		'is_gplus',
		'status',
		'created_date',
		'modified_date',
	),
)); ?>
