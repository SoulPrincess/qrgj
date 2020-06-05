<?php
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="customer-create">
    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
