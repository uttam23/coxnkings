<?php
/* @var $this PostController */
/* @var $data Post */
?>

<div class="view list-panel">
    <div id="post-<?=$data->id; ?>" class="item media">
        <input class="pull-left" type="checkbox" name="postId[]" value="<?=$data->id; ?>">
        <a class="pull-left" href="#"><img class="img-polaroid" src="<?=$data->user_profile_image; ?>"></a>
        <div class="media-body pull-left">
            <section>
                <span class="title"><?php echo CHtml::encode($data->user_name); ?></span>
                <?php if ($data->source == 'twitter') { ?>
                <span class="muted">&nbsp;&nbsp;<?='@'.CHtml::encode($data->user_screen_name); ?></span>
                <?php } ?>
            </section>
            <p><?php echo substr( CHtml::encode($data->post_text), 0, 250).' [..]'; ?></p>
            <section class="muted"><i class="<?='icon-'.$data->source; ?>"></i> <a target="_blank" href="<?php echo CHtml::encode($data->post_url); ?>"><?=strtolower(CHtml::encode($data->post_url)); ?></a></section>
        </div>
        <div class="media-action pull-right">
            <span><i class="icon-search"></i> <?=ucfirst($data->source); ?></span>
            <span><i class="icon-calendar"></i> <?=date('r', $data->date_published_ts); ?></span>
            <span class="button-bar">
                <?php $btnType = ($data->post_status == 'approved') ? 'btn-success' : ( ($data->post_status == 'rejected') ? 'btn-danger' : 'btn-warning'); ?>
                <button class="posts-action btn btn-small <?=$btnType; ?>" type="button" data-type="post" data-action="change-status" id="<?=$data->id; ?>" data-value="<?=$data->post_status; ?>" title="Click to Change Status"><?=ucwords($data->post_status); ?></button>
                <a href="javascript:void(0);" class="posts-action btn btn-mini" data-type="post" data-action="delete" id="<?=$data->id; ?>" title="Delete this Post"><i class="icon-trash"></i></a>
            </span>
        </div>
    </div>
</div>