<?php
/* @var $this PostController */
/* @var $model Post */

$this->breadcrumbs=array(
	'Posts'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Post', 'url'=>array('index')),
	array('label'=>'Create Post', 'url'=>array('create')),
	array('label'=>'Update Post', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Post', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Post', 'url'=>array('admin')),
);
?>

<h1>View Post #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'stream_id',
		'source',
		'post_id',
		'post_hash',
		'post_text',
		'post_lang',
		'post_source',
		'post_url',
		'post_type',
		'post_story_text',
		'post_picture',
		'post_link',
		'post_name',
		'post_caption',
		'post_description',
		'user_category',
		'user_profile_image',
		'user_name',
		'user_screen_name',
		'user_id',
		'user_lang',
		'user_location',
		'user_followers_count',
		'user_friend_count',
		'user_status_count',
		'post_likes',
		'post_comments',
		'user_url',
		'post_status',
		'date_published',
		'date_published_ts',
		'date_added',
		'date_modified',
	),
)); ?>
