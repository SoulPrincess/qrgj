<?php
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="staff-log-create">
    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
