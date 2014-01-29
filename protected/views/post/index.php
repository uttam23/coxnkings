<?php
/* @var $this PostController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
    'Posts'=>array('index'),
    'Moderate',
);

$this->menu=array(
	array('label'=>'Create Stream', 'url'=>array('create')),
);
?>

<h1>Moderate Posts</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
