<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 2-9-2010 14:43
 */
if (! defined('NV_IS_FILE_ADMIN'))
    die('Stop!!!');

$page_title = $lang_module['groups'];
$table_name = $db_config['prefix'] . '_' . $module_data . '_block_cat';

if ($nv_Request->isset_request('get_alias_title', 'post')) {
    $alias = $nv_Request->get_title('get_alias_title', 'post', '');
    $alias = change_alias($alias);
    die($alias);
}

if ($nv_Request->isset_request('del_block_cat', 'post')) {
    $bid = $nv_Request->get_int('bid', 'post', 0);
    
    $contents = "NO_" . $bid;
    $bid = $db->query("SELECT bid FROM " . $table_name . " WHERE bid=" . intval($bid))->fetchColumn();
    if ($bid > 0) {
        nv_insert_logs(NV_LANG_DATA, $module_name, 'log_del_blockcat', "block_catid " . $bid, $admin_info['userid']);
        $query = "DELETE FROM " . $table_name . " WHERE bid=" . $bid;
        if ($db->exec($query)) {
            $query = "DELETE FROM " . $db_config['prefix'] . "_" . $module_data . "_block WHERE bid=" . $bid;
            $db->query($query);
            nv_fix_block_cat();
            $nv_Cache->delMod($module_name);
            $contents = "OK_" . $bid;
        }
    }
    
    include NV_ROOTDIR . '/includes/header.php';
    echo $contents;
    include NV_ROOTDIR . '/includes/footer.php';
}

$error = '';
$savecat = 0;
$row = array(
    'bid' => 0,
    'image' => '',
    'title' => '',
    'alias' => '',
    'description' => '',
    'keywords' => ''
);
$currentpath = NV_UPLOADS_DIR . '/' . $module_upload;
$row['bid'] = $nv_Request->get_int('bid', 'get', 0);
$savecat = $nv_Request->get_int('savecat', 'post', 0);

if (! empty($savecat)) {
    $row['bid'] = $nv_Request->get_int('bid', 'post', 0);
    $row['title'] = $nv_Request->get_title('title', 'post', '', 1);
    $row['keywords'] = $nv_Request->get_title('keywords', 'post', '', 1);
    $row['alias'] = $nv_Request->get_title('alias', 'post', '');
    $row['description'] = $nv_Request->get_editor('description', '', NV_ALLOWED_HTML_TAGS);
    $row['alias'] = ($row['alias'] == '') ? change_alias($row['title']) : change_alias($row['alias']);
    
    $row['image'] = $nv_Request->get_string('image', 'post', '');
    if (is_file(NV_DOCUMENT_ROOT . $row['image'])) {
        $lu = strlen(NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/');
        $row['image'] = substr($row['image'], $lu);
    } else {
        $row['image'] = '';
    }
    
    if (empty($row['title'])) {
        $error = $lang_module['error_name'];
    } elseif ($row['bid'] == 0) {
        $field_lang = nv_file_table($table_name);
        $listfield = $listvalue = '';
        foreach ($field_lang as $field_lang_i) {
            list ($flang, $fname) = $field_lang_i;
            $listfield .= ', ' . $flang . '_' . $fname;
            $listvalue .= ', :' . $flang . '_' . $fname;
        }
        
        $weight = $db->query("SELECT max(weight) FROM " . $table_name . "")->fetchColumn();
        $weight = intval($weight) + 1;
        
        $sql = "INSERT INTO " . $table_name . " (adddefault, numbers, image, weight, add_time, edit_time" . $listfield . ") VALUES (0, 4, :image, :weight, " . NV_CURRENTTIME . ", " . NV_CURRENTTIME . $listvalue . ")";
        $data_insert = array();
        $data_insert['image'] = $row['image'];
        $data_insert['weight'] = $weight;
        foreach ($field_lang as $field_lang_i) {
            list ($flang, $fname) = $field_lang_i;
            $data_insert[$flang . '_' . $fname] = $row[$fname];
        }
        
        if ($db->insert_id($sql, 'bid', $data_insert)) {
            nv_insert_logs(NV_LANG_DATA, $module_name, 'log_add_blockcat', " ", $admin_info['userid']);
            Header('Location: ' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
            die();
        } else {
            $error = $lang_module['errorsave'];
        }
    } else {
        $stmt = $db->prepare("UPDATE " . $table_name . " SET " . NV_LANG_DATA . "_title= :title, " . NV_LANG_DATA . "_alias = :alias, " . NV_LANG_DATA . "_description= :description, image= :image, " . NV_LANG_DATA . "_keywords= :keywords, edit_time=" . NV_CURRENTTIME . " WHERE bid =" . $row['bid']);
        $stmt->bindParam(':title', $row['title'], PDO::PARAM_STR);
        $stmt->bindParam(':alias', $row['alias'], PDO::PARAM_STR);
        $stmt->bindParam(':description', $row['description'], PDO::PARAM_STR);
        $stmt->bindParam(':image', $row['image'], PDO::PARAM_STR);
        $stmt->bindParam(':keywords', $row['keywords'], PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->execute()) {
            $nv_Cache->delMod($module_name);
            nv_insert_logs(NV_LANG_DATA, $module_name, 'log_edit_blockcat', "blockid " . $row['bid'], $admin_info['userid']);
            Header('Location: ' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op);
            die();
        } else {
            $error = $lang_module['errorsave'];
        }
    }
}

if ($row['bid'] > 0) {
    list ($row['bid'], $row['title'], $row['alias'], $row['description'], $row['image'], $row['keywords']) = $db->query("SELECT bid, " . NV_LANG_DATA . "_title, " . NV_LANG_DATA . "_alias, " . NV_LANG_DATA . "_description, image, " . NV_LANG_DATA . "_keywords FROM " . $table_name . " where bid=" . $row['bid'])->fetch(3);
    $lang_module['add_block_cat'] = $lang_module['edit_block_cat'];
}

if (defined('NV_EDITOR')) {
    require_once NV_ROOTDIR . '/' . NV_EDITORSDIR . '/' . NV_EDITOR . '/nv.php';
}
$row['description'] = htmlspecialchars(nv_editor_br2nl($row['description']));
if (defined('NV_EDITOR') and nv_function_exists('nv_aleditor')) {
    $row['description'] = nv_aleditor('description', '100%', '300px', $row['description'], 'Basic');
} else {
    $row['description'] = '<textarea style="width:100%;height:300px" name="description">' . $row['description'] . '</textarea>';
}

if (! empty($row['image']) and file_exists(NV_UPLOADS_REAL_DIR . "/" . $module_upload . "/" . $row['image'])) {
    $row['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . "/" . $module_upload . "/" . $row['image'];
    $currentpath = dirname($row['image']);
}

$xtpl = new XTemplate('groups.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('GLANG', $lang_global);
$xtpl->assign('MODULE_NAME', $module_name);
$xtpl->assign('MODULE_UPLOAD', $module_upload);
$xtpl->assign('CURRENTPATH', $currentpath);
$xtpl->assign('OP', $op);
$xtpl->assign('ROW', $row);
$xtpl->assign('BLOCK_GROUPS_LIST', nv_show_groups_list());

if (! empty($error)) {
    $xtpl->assign('ERROR', $error);
    $xtpl->parse('main.error');
}

if (empty($row['bid'])) {
    $xtpl->parse('main.auto_get_alias');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';