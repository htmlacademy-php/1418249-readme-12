
<?php
function Text_lop ($text,$long)
{
    if (is_null($long))
    {
        $long = 300;
    }
    $words = explode(' ', $text);
    $stump='';
    $index=0;
    while (strlen($stump) < $long)
    {
        $stump = $stump.' '.$words[$index];
        $index ++;
    }
    $stump=$stump.' ...';
    return $stump;
}
