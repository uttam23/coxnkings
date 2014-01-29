<?php
/* @var $this StreamController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Streams',
);

$this->menu=array(
	array('label'=>'View Posts', 'url'=>array('post/manage')),
);
?>

<h1>Manage Streams</h1>
<div id="addForm" class="box box-shadow">
    <?php $this->renderPartial('_manage', array('model'=>$model)); ?>
</div>

<div class="streamList">
    <?php $this->widget('zii.widgets.CListView', array(
        'dataProvider'=>$dataProvider,
        'itemView'=>'_view',
    )); ?>
</div>

