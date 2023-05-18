<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2016 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Mon, 09 May 2016 09:18:57 GMT
 */
if (! defined('NV_IS_FILE_ADMIN'))
    die('Stop!!!');
    
    // change status
if ($nv_Request->isset_request('change_status', 'post, get')) {
    $id = $nv_Request->get_int('id', 'post, get', 0);
    $content = 'NO_' . $id;
    
    $query = 'SELECT status FROM ' . $db_config['prefix'] . '_' . $module_data . '_rows WHERE id=' . $id;
    $row = $db->query($query)->fetch();
    if (isset($row['status'])) {
        $status = ($row['status']) ? 0 : 1;
        $query = 'UPDATE ' . $db_config['prefix'] . '_' . $module_data . '_rows SET status=' . intval($status) . ' WHERE id=' . $id;
        $db->query($query);
        $content = 'OK_' . $id;
    }
    $nv_Cache->delMod($module_name);
    include NV_ROOTDIR . '/includes/header.php';
    echo $content;
    include NV_ROOTDIR . '/includes/footer.php';
    exit();
}

if ($nv_Request->isset_request('sort', 'post')) {
    $id = $nv_Request->get_int('id', 'post', 0);
    $new_vid = $nv_Request->get_int('new_vid', 'post', 0);
    $content = 'NO_' . $id;
    
    if ($new_vid > 0) {
        $addtime = $db->query('SELECT addtime FROM ' . $db_config['prefix'] . '_' . $module_data . '_rows WHERE id=' . $id)->fetchColumn();
        $addtime_new = $db->query('SELECT addtime FROM ' . $db_config['prefix'] . '_' . $module_data . '_rows WHERE id=' . $new_vid)->fetchColumn();
        
        $db->query('UPDATE ' . $db_config['prefix'] . '_' . $module_data . '_rows SET addtime=' . $addtime_new . ' WHERE id=' . $id);
        $db->query('UPDATE ' . $db_config['prefix'] . '_' . $module_data . '_rows SET addtime=' . $addtime . ' WHERE id=' . $new_vid);
        
        $content = 'OK_' . $id;
    }
    $nv_Cache->delMod($module_name);
    include NV_ROOTDIR . '/includes/header.php';
    echo $content;
    include NV_ROOTDIR . '/includes/footer.php';
    exit();
}

if ($nv_Request->isset_request('delete_id', 'get') and $nv_Request->isset_request('delete_checkss', 'get')) {
    $id = $nv_Request->get_int('delete_id', 'get');
    $delete_checkss = $nv_Request->get_string('delete_checkss', 'get');
    if ($id > 0 and $delete_checkss == md5($id . NV_CACHE_PREFIX . $client_info['session_id'])) {
        nv_tour_delete($id);
        $nv_Cache->delMod($module_name);
        Header('Location: ' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
        die();
    }
} elseif ($nv_Request->isset_request('delete_list', 'post')) {
    $listall = $nv_Request->get_title('listall', 'post', '');
    $array_id = explode(',', $listall);
    
    if (! empty($array_id)) {
        foreach ($array_id as $id) {
            nv_tour_delete($id);
        }
        $nv_Cache->delMod($module_name);
        die('OK');
    }
    die('NO');
}

$array_data = $array_tour_id = array();
$base_url = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $op;
$per_page = 20;
$page = $nv_Request->get_int('page', 'post,get', 1);
$where = '';

$array_search = array(
    'q' => $nv_Request->get_title('q', 'post,get', ''),
    'sort' => $nv_Request->get_title('sort', 'post,get', 0)
);

if (! empty($array_search['q'])) {
    $base_url .= '&q=' . $array_search['q'];
    $where .= ' AND (code LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_title LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_alias LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_title_custom LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_plan LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_description LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_description_html LIKE "%' . $array_search['q'] . '%"
        OR ' . NV_LANG_DATA . '_note LIKE "%' . $array_search['q'] . '%"
    )';
}

if (! empty($array_search['sort'])) {
    $base_url .= '&sort=1';
}

$db->sqlreset()
    ->select('id')
    ->from($db_config['prefix'] . '_' . $module_data . '_rows')
    ->where('1=1 and grouptour=1' . $where)
    ->order('addtime DESC');

$sth = $db->prepare($db->sql());
$sth->execute();
$num_items = $sth->rowCount();

while (list ($tourid) = $sth->fetch(3)) {
    $array_tour_id[] = $tourid;
}

$db->select('*')
    ->order('addtime DESC')
    ->limit($per_page)
    ->offset(($page - 1) * $per_page);
$sth = $db->prepare($db->sql());
$sth->execute();

while ($row = $sth->fetch()) {
    $array_data[$row['id']] = $row;
}

$xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('OP', $op);
$xtpl->assign('SEARCH', $array_search);
$xtpl->assign('URL_ADD', NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=content');
$xtpl->assign('BASE_URL', $base_url);

if ($array_search['sort']) {
    $xtpl->parse('main.selectbox');
} else {
    $xtpl->parse('main.checkbox');
    $array_action = array(
        'delete_list_id' => $lang_global['delete']
    );
    foreach ($array_action as $key => $value) {
        $xtpl->assign('ACTION', array(
            'key' => $key,
            'value' => $value
        ));
        $xtpl->parse('main.action.loop');
    }
    $xtpl->parse('main.action');
}

if (! empty($array_data)) {
    $number = $page > 1 ? ($per_page * ($page - 1)) + 1 : 1;
    foreach ($array_data as $view) {
        $view['weight'] = $number ++;
        $view['title'] = $view[NV_LANG_DATA . '_title'];
        $view['addtime'] = nv_date('H:i d/m/Y', $view['addtime']);
        $view['ck_status'] = $view['status'] == 1 ? 'checked' : '';
        $view['date_start'] = nv_get_date_start($view['date_start_method'], $view['date_start_config'], $view['date_start']);
        $view['link_edit'] = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=content&amp;id=' . $view['id'];
        $view['link_delete'] = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $op . '&amp;delete_id=' . $view['id'] . '&amp;delete_checkss=' . md5($view['id'] . NV_CACHE_PREFIX . $client_info['session_id']);
        $view['link_images'] = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=images&amp;id=' . $view['id'];
        $view['link_view'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '/' . $array_cat[$view['catid']]['alias'] . '/' . $view[NV_LANG_DATA . '_alias'];
        $view['images_count'] = $db->query('SELECT COUNT(*) FROM ' . $db_config['prefix'] . '_' . $module_data . '_images WHERE rows_id=' . $view['id'])->fetchColumn();
        
        $xtpl->assign('VIEW', $view);
        
        if ($array_search['sort']) {
            foreach ($array_tour_id as $index => $value) {
                $index += 1;
                $xtpl->assign('WEIGHT', array(
                    'key' => $value,
                    'title' => $index,
                    'selected' => ($index == $view['weight']) ? ' selected="selected"' : ''
                ));
                $xtpl->parse('main.loop.selectbox.weight_loop');
            }
            $xtpl->parse('main.loop.selectbox');
        } else {
            $xtpl->parse('main.loop.checkbox');
        }
        
        $xtpl->parse('main.loop');
    }
}

$generate_page = nv_generate_page($base_url, $num_items, $per_page, $page);
if (! empty($generate_page)) {
    $xtpl->assign('NV_GENERATE_PAGE', $generate_page);
    $xtpl->parse('main.generate_page');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

if ($array_search['sort']) {
    $set_active_op = 'tour-sort';
}

$page_title = $lang_module['main'];

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';