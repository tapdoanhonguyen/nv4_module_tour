<?php

/**
 * @Project NUKEVIET 4.x
 * @Author Thinhweb Blog <thinhwebhp@gmail.com>
 * @Copyright (C) 2019 Thinhweb Blog. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Saturday, 28 September 2019 9:59:52 AM GMT+07:00
 */

if (! defined('NV_ADMIN') or ! defined('NV_MAINFILE') or ! defined('NV_IS_MODADMIN'))
    die('Stop!!!');

define('NV_IS_FILE_ADMIN', true);
require_once NV_ROOTDIR . '/modules/' . $module_file . '/location.class.php';

$allow_func = array(
    'main',
    'config',
    'country',
    'province',
    'district',
    'ward'
);

/**
 * nv_location_delete_province()
 *
 * @param integer $provinceid
 * @return
 *
 */
function nv_location_delete_province($provinceid)
{
    global $db, $db_config, $module_data;

    // Xoa Tinh/Thanh pho
    $result = $db->query('DELETE FROM ' . $db_config['prefix'] . '_' . $module_data . '_province WHERE provinceid=' . $provinceid);
    if ($result) {
        // Xoa Quan/Huyen truc thuoc
        $db->query('DELETE FROM ' . $db_config['prefix'] . '_' . $module_data . '_district WHERE provinceid=' . $provinceid);
    }
}