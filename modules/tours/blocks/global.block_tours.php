<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sat, 10 Dec 2011 06:46:54 GMT
 */
if (! defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (! nv_function_exists('nv_block_tours')) {

    if (! nv_function_exists('nv_tours_getprice_tmp')) {

        function nv_tours_getprice_tmp($module_name, $module_data, $module_file, $pro_id)
        {
            global $nv_Cache, $db, $db_config, $lang_module, $module_config, $discounts_config, $money_config, $array_config, $site_mods, $lang_global;
            $price = array();
            $array_config = $module_config[$module_name];
            require_once NV_ROOTDIR . '/modules/' . $module_file . '/global.functions.php';
            $price = nv_get_price($pro_id, $array_config['money_unit'], 0, $module_name);
            return $price;
        }
    }

    function nv_block_config_tours($module, $data_block, $lang_block)
    {
        global $site_mods, $global_config;

        $array_type = array(
            $lang_block['type0'],
            $lang_block['type1'],
            $lang_block['type2']
        );

        $array_template = array(
            $lang_block['template0'],
            $lang_block['template1']
        );

        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $site_mods[$module]['module_data'] . '/global.block_tours_list.tpl')) {
            $block_theme = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/modules/' . $site_mods[$module]['module_data'] . '/global.block_tours_list.tpl')) {
            $block_theme = $global_config['site_theme'];
        } else {
            $block_theme = 'default';
        }

        $xtpl = new XTemplate('global.block_tours_list.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/modules/' . $site_mods[$module]['module_data']);
        $xtpl->assign('LANG', $lang_block);
        $xtpl->assign('DATA', $data_block);

        foreach ($array_type as $index => $value) {
            $ck = (isset($data_block['type']) and $index == $data_block['type']) ? 'checked="checked"' : '';
            $xtpl->assign('TYPE', array(
                'index' => $index,
                'value' => $value,
                'checked' => $ck
            ));
            $xtpl->parse('config.type');
        }

        foreach ($array_template as $index => $value) {
            $ck = (isset($data_block['template']) and $index == $data_block['template']) ? 'checked="checked"' : '';
            $xtpl->assign('TEMPLATE', array(
                'index' => $index,
                'value' => $value,
                'checked' => $ck
            ));
            $xtpl->parse('config.template');
        }

        $xtpl->parse('config');
        return $xtpl->text('config');
    }

    function nv_block_config_tours_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config'] = array();
        $return['config']['type'] = $nv_Request->get_int('config_type', 'type', 0);
        $return['config']['template'] = $nv_Request->get_int('config_template', 'post', 0);
        $return['config']['numrow'] = $nv_Request->get_int('config_numrow', 'post', 0);
        $return['config']['title_lenght'] = $nv_Request->get_int('config_title_lenght', 'post', 0);
        return $return;
    }

    function nv_block_tours($block_config)
    {
        global $db_config, $module_array_cat, $module_info, $site_mods, $module_config, $global_config, $nv_Cache, $db, $array_config, $lang_module, $money_config, $module_name, $module_array_vehicle, $module_array_hotels, $my_head, $lang_global, $array_day_week, $array_day_month;

        $module = $block_config['module'];
        $mod_data = $site_mods[$module]['module_data'];
        $mod_file = $site_mods[$module]['module_file'];
        $mod_upload = $site_mods[$module]['module_upload'];
        $array_config = $module_config[$module];

        if ($module != $module_name) {
            $array_config = $module_config[$module];
            require_once NV_ROOTDIR . '/modules/' . $mod_file . '/language/' . NV_LANG_INTERFACE . '.php';
            require_once NV_ROOTDIR . '/modules/' . $mod_file . '/site.functions.php';
        }

        $order = 'id DESC';
        $where = 'status=1';
        if ($block_config['type'] == 1) {
            $order = 'hitstotal DESC';
        } elseif ($block_config['type'] == 2) {
            $where .= ' AND discounts_id > 0';
        }

        $db->sqlreset()
            ->select('id, catid, ' . NV_LANG_DATA . '_title title, ' . NV_LANG_DATA . '_alias alias, homeimgfile, homeimgthumb, ' . NV_LANG_DATA . '_description description, date_start, code, discounts_id, money_unit, show_price, num_day, num_night, date_start_method, date_start_config, date_start, show_price, hotels_info hotels, vehicle')
            ->from($db_config['prefix'] . '_' . $site_mods[$module]['module_data'] . '_rows')
            ->where($where)
            ->order($order)
            ->limit($block_config['numrow']);
        $list = $nv_Cache->db($db->sql(), '', $module);

        if (! empty($list)) {
            $template = 'global.block_tours_list.tpl';
            if ($block_config['template'] == 1) {
                $template = 'global.block_tours_grid.tpl';
            }

            if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/tours/' . $template)) {
                $block_theme = $global_config['module_theme'];
            } else {
                $block_theme = 'default';
            }

            if ($module != $module_name) {
                $my_head .= '<link rel="StyleSheet" href="' . NV_BASE_SITEURL . 'themes/' . $block_theme . '/css/tours.css' . '">';
            }

            $xtpl = new XTemplate($template, NV_ROOTDIR . '/themes/' . $block_theme . '/modules/tours');
            $xtpl->assign('LANG', $lang_module);
            $xtpl->assign('TEMPLATE', $block_theme);
            $home_image_size = explode('x', $array_config['home_image_size']);
            $xtpl->assign('WIDTH', $home_image_size[0]);
            $xtpl->assign('HEIGHT', $home_image_size[1]);

            foreach ($list as $l) {
                $l['title_clean'] = nv_clean60($l['title'], $block_config['title_lenght']);
                $l['date_start'] = nv_get_date_start($l['date_start_method'], $l['date_start_config'], $l['date_start']);
                $l['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $module_array_cat[$l['catid']]['alias'] . '/' . $l['alias'] . $global_config['rewrite_exturl'];
                $l['thumb'] = nv_tour_get_thumb($l['homeimgfile'], $l['homeimgthumb'], $mod_upload);
                $l['num_day'] = nv_tours_get_numday($l['num_day'], $l['num_night']);
                $l['vehicle'] = ! empty($l['vehicle']) ? $module_array_vehicle[$l['vehicle']]['title'] : '';
                $hotel_star = nv_tours_get_hotel_star($l['hotels'], $module_array_hotels);
                if (! empty($hotel_star)) {
                    $l['star'] = $lang_module['hotels_type_' . $hotel_star];
                }

                $xtpl->assign('ROW', $l);

                if ($l['show_price'] == '1') {
                    $price = nv_tours_getprice_tmp($module, $mod_data, $mod_file, $l['id']);
                    $xtpl->assign('PRICE', $price);
                    if ($l['discounts_id'] and $price['discount_percent'] > 0) {
                        $xtpl->parse('main.loop.price.discounts');
                    } else {
                        $xtpl->parse('main.loop.price.no_discounts');
                    }
                    $xtpl->parse('main.loop.price');
                } else {
                    $xtpl->parse('main.loop.contact');
                }

                if (! empty($l['thumb'])) {
                    $xtpl->parse('main.loop.img');
                }

                if ($l['discounts_id'] and $price['discount_percent'] > 0 and $l['show_price']) {
                    $xtpl->parse('main.loop.discounts');
                }

                if (! empty($hotel_star)) {
                    for ($i = 1; $i <= $hotel_star; $i ++) {
                        $xtpl->parse('main.loop.star.loop');
                    }
                    $xtpl->parse('main.loop.star');
                }

                if (! empty($l['vehicle'])) {
                    $xtpl->parse('main.loop.vehicle');
                }

                $xtpl->parse('main.loop');
            }

            $xtpl->parse('main');
            return $xtpl->text('main');
        }
    }
}
if (defined('NV_SYSTEM')) {
    global $site_mods, $module_name, $array_cat, $module_array_cat, $nv_Cache, $db, $array_vehicle, $module_array_vehicle, $array_hotels, $module_array_hotels;
    $module = $block_config['module'];
    if (isset($site_mods[$module])) {
        if ($module == $module_name) {
            $module_array_cat = $array_cat;
            $module_array_vehicle = $array_vehicle;
            $module_array_hotels = $array_hotels;
        } else {
            $module_array_cat = array();
            $_sql = 'SELECT id, parentid, ' . NV_LANG_DATA . '_title title, ' . NV_LANG_DATA . '_alias alias, ' . NV_LANG_DATA . '_custom_title custom_title, ' . NV_LANG_DATA . '_keywords keywords, ' . NV_LANG_DATA . '_description description, ' . NV_LANG_DATA . '_description_html description_html, inhome, numlinks, viewtype, price_method, subprice, lev, numsub, subid, sort, weight, status FROM ' . $db_config['prefix'] . '_' . $site_mods[$module]['module_data'] . '_cat WHERE status=1 ORDER BY sort ASC';
            $list = $nv_Cache->db($_sql, 'id', $module);
            if (! empty($list)) {
                foreach ($list as $l) {
                    $module_array_cat[$l['id']] = $l;
                    $module_array_cat[$l['id']]['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $l['alias'];
                }
            }

            $_sql = 'SELECT id, ' . NV_LANG_DATA . '_title title FROM ' . $db_config['prefix'] . '_' . $site_mods[$module]['module_data'] . '_vehicle WHERE status=1 ORDER BY weight';
            $module_array_vehicle = $nv_Cache->db($_sql, 'id', $module);

            $_sql = 'SELECT id, ' . NV_LANG_DATA . '_title title, star FROM ' . $db_config['prefix'] . '_' . $site_mods[$module]['module_data'] . '_hotels WHERE status=1 ORDER BY id DESC';
            $module_array_hotels = $nv_Cache->db($_sql, 'id', $module);
        }
        $content = nv_block_tours($block_config);
    }
}
