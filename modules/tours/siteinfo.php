<?php

/**
 * @Project NUKEVIET 4.x
 * @Author Thinhweb Blog <thinhwebhp@gmail.com>
 * @Copyright (C) 2019 Thinhweb Blog. All rights reserved
 * @Createdate Friday, September 27, 2019 9:59:52 AM GMT+07:00
 */

if (! defined('NV_IS_FILE_SITEINFO'))
    die('Stop!!!');

$lang_siteinfo = nv_get_lang_module($mod);

// Tong so bai viet
$number = $db->query( 'SELECT COUNT(*) FROM ' . $db_config['prefix'] . '_' . $mod_data . '_rows where status= 1' )->fetchColumn();
if ( $number > 0 )
{
    $siteinfo[] = array(
        'key' => $lang_siteinfo['siteinfo_publtime'], 'value' => $number
    );
}

