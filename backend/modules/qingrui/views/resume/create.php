<?php
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="resume-create">
    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
