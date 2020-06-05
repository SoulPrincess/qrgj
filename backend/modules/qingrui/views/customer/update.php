<?php
use backend\assets\LayuiAsset;
LayuiAsset::register($this);
?>
<div class="customer-update">
    <?=
    $this->render('_form', [
        'model' => $model,
    ])
    ?>

</div>
