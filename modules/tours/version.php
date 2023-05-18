<?php

/**
 * @Project NUKEVIET 4.x
 * @Author Thinhweb Blog <thinhwebhp@gmail.com>
 * @Copyright (C) 2019 Thinhweb Blog. All rights reserved
 * @Createdate Friday, September 27, 2019 9:59:52 AM GMT+07:00
 */

if (! defined('NV_MAINFILE'))
    die('Stop!!!');

$module_version = array(
    'name' => 'Tours',
    'modfuncs' => 'main,detail,search,groups,grouptour,grouptours,inspirations,viewcat,booking,payment,search,tag,ajax',
    'change_alias' => 'main,detail,search,groups,grouptour,inspirations,booking,payment,tag',
    'submenu' => 'groups,inspirations',
    'is_sysmod' => 0,
    'virtual' => 1,
    'version' => '4.3.07',
    'date' => 'Friday, September 27, 2019 9:59:52 AM GMT+07:00',
    'author' => 'Thinhweb Blog <thinhwebhp@gmail.com>',
    'uploads_dir' => array(
        $module_upload,
        $module_upload . '/images'
    ),
    'note' => ''
);
