<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2016 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Wed, 06 Jan 2016 01:50:09 GMT
 */
if (! defined('NV_IS_FILE_ADMIN'))
    die('Stop!!!');

$table_name = $db_config['prefix'] . '_' . $module_data . '_images';

$array_thumb_config = array();
$sql = 'SELECT * FROM ' . NV_UPLOAD_GLOBALTABLE . '_dir ORDER BY dirname ASC';
$result = $db->query($sql);
while ($row = $result->fetch()) {
    $array_dirname[$row['dirname']] = $row['did'];
    if ($row['thumb_type']) {
        $array_thumb_config[$row['dirname']] = $row;
    }
}
unset($array_dirname['']);

if(!empty($array_thumb_config[NV_UPLOADS_DIR . '/' . $module_name])){
    $thumb_config = $array_thumb_config[NV_UPLOADS_DIR . '/' . $module_name];
    $width = $array_thumb_config[NV_UPLOADS_DIR . '/' . $module_name]['thumb_width'];
    $height = $array_thumb_config[NV_UPLOADS_DIR . '/' . $module_name]['thumb_height'];
}else{
    $width = 735;
    $height = 400;
}

if ($nv_Request->isset_request('delete_other_images_tmp', 'post')) {
    $path = $nv_Request->get_title('path', 'post', '');
    $thumb = $nv_Request->get_title('thumb', 'post', '');

    if (empty($path))
        die('NO');

    if (! nv_delete_other_images_tmp(NV_ROOTDIR . '/' . $path))
        die('NO');

    die('OK');
}

if ($nv_Request->isset_request('delete_images', 'post')) {
    $id = $nv_Request->get_title('id', 'post', '');
    $content = 'NO_' . $id;
    if($id > 0){
        $query = 'SELECT * FROM ' . $table_name . ' WHERE id=' . $id;
        $row = $db->query($query)->fetch();
        if (isset($row)) {
            $db->query('DELETE FROM ' . $table_name . ' WHERE id = ' . $id);
            $nv_Cache->delMod($module_name);
            @nv_deletefile(NV_ROOTDIR . '/' . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $row['homeimgfile']);
            @nv_deletefile(NV_ROOTDIR . '/' . NV_ASSETS_DIR . '/' . $module_upload . '/' . $row['homeimgfile']);
            $content = 'OK_' . $id;
        }

    }
    include NV_ROOTDIR . '/includes/header.php';
    echo $content;
    include NV_ROOTDIR . '/includes/footer.php';
}

$array_data = array();
$error = array();
//$array_id_old = array();
$array_id_new = array();

$username_alias = change_alias($admin_info['username']);
$array_structure_image = array();
$array_structure_image[''] = $module_upload;
$array_structure_image['Y'] = $module_upload . '/' . date('Y');
$array_structure_image['Ym'] = $module_upload . '/' . date('Y_m');
$array_structure_image['Y_m'] = $module_upload . '/' . date('Y/m');
$array_structure_image['Ym_d'] = $module_upload . '/' . date('Y_m/d');
$array_structure_image['Y_m_d'] = $module_upload . '/' . date('Y/m/d');
$array_structure_image['username'] = $module_upload . '/' . $username_alias;

$array_structure_image['username_Y'] = $module_upload . '/' . $username_alias . '/' . date('Y');
$array_structure_image['username_Ym'] = $module_upload . '/' . $username_alias . '/' . date('Y_m');
$array_structure_image['username_Y_m'] = $module_upload . '/' . $username_alias . '/' . date('Y/m');
$array_structure_image['username_Ym_d'] = $module_upload . '/' . $username_alias . '/' . date('Y_m/d');
$array_structure_image['username_Y_m_d'] = $module_upload . '/' . $username_alias . '/' . date('Y/m/d');

$structure_upload = isset($array_config['structure_upload']) ? $array_config['structure_upload'] : 'Ym';
$currentpath = isset($array_structure_image[$structure_upload]) ? $array_structure_image[$structure_upload] : '';

$path_thumbnail = NV_ASSETS_DIR . "/" . $currentpath;

if ( ! file_exists ( NV_ROOTDIR . "/" . $path_thumbnail ) ) {
    nv_mkdir( NV_ROOTDIR . "/" . NV_ASSETS_DIR . "/" . $module_upload . "/", $currentpath );
}

if (file_exists(NV_UPLOADS_REAL_DIR . '/' . $currentpath)) {
    $upload_real_dir_page = NV_UPLOADS_REAL_DIR . '/' . $currentpath;
} else {
    $upload_real_dir_page = NV_UPLOADS_REAL_DIR . '/' . $module_upload;
    $e = explode('/', $currentpath);
    if (! empty($e)) {
        $cp = '';
        foreach ($e as $p) {
            if (! empty($p) and ! is_dir(NV_UPLOADS_REAL_DIR . '/' . $cp . $p)) {
                $mk = nv_mkdir(NV_UPLOADS_REAL_DIR . '/' . $cp, $p);
                if ($mk[0] > 0) {
                    $upload_real_dir_page = $mk[2];
                    $db->query("INSERT INTO " . NV_UPLOAD_GLOBALTABLE . "_dir (dirname, time) VALUES ('" . NV_UPLOADS_DIR . "/" . $cp . $p . "', 0)");
                }
            } elseif (! empty($p)) {
                $upload_real_dir_page = NV_UPLOADS_REAL_DIR . '/' . $cp . $p;
            }
            $cp .= $p . '/';
        }
    }
    $upload_real_dir_page = str_replace('\\', '/', $upload_real_dir_page);
}

$currentpath = str_replace(NV_ROOTDIR . '/', '', $upload_real_dir_page);
$uploads_dir_user = NV_UPLOADS_DIR . '/' . $module_upload;
if (! defined('NV_IS_SPADMIN') and strpos($structure_upload, 'username') !== false) {
    $array_currentpath = explode('/', $currentpath);
    if ($array_currentpath[2] == $username_alias) {
        $uploads_dir_user = NV_UPLOADS_DIR . '/' . $module_upload . '/' . $username_alias;
    }
}

$rows_id = $nv_Request->get_int('id', 'get', 0);
$tour_info = $db->query('SELECT ' . NV_LANG_DATA . '_title title FROM ' . $db_config['prefix'] . '_' . $module_data . '_rows WHERE id=' . $rows_id)->fetch();

$result = $db->query('SELECT * FROM ' . $table_name . ' WHERE rows_id=' . $rows_id);
while ($row = $result->fetch()) {
    $array_data[$row['id']] = $row;
}

$row = array();
if ($nv_Request->isset_request('submit', 'post')) {
    $row['rows_id'] = $nv_Request->get_int('rows_id', 'post', 0);
    $row['otherimage'] = $nv_Request->get_array('otherimage', 'post');

    if (empty($row['rows_id'])) {
        $error[] = $lang_module['images_error_rows_empty'];
    }

    if (empty($error)) {
        $field_lang = nv_file_table($table_name);
        $listfield = $listvalue = '';
        foreach ($field_lang as $field_lang_i) {
            list ($flang, $fname) = $field_lang_i;
            $listfield .= ', ' . $flang . '_' . $fname;
            $listvalue .= ', :' . $flang . '_' . $fname;
        }

        foreach ($row['otherimage'] as $otherimage) {
            $array_id_new[] = intval($otherimage['id']);
        }

        foreach ($row['otherimage'] as $otherimage) {
            if ($otherimage['id'] == 0) {
                if (file_exists(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $otherimage['homeimgfile'])) {
                    if(file_exists(NV_ROOTDIR . '/' . $currentpath . '/' . $otherimage['homeimgfile'])){
                        mt_srand((double) microtime() * 1000000);
                        $maxran = 1000000;
                        $random_num = mt_rand(0, $maxran);
                        $random_num = md5($random_num);

                        $nv_pathinfo_filename = nv_pathinfo_filename(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $otherimage['homeimgfile']);
                        $ext = pathinfo(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $otherimage['homeimgfile'], PATHINFO_EXTENSION);
                        $new_name = $nv_pathinfo_filename . '_' . $random_num . '.' . $ext;

                        $rename = nv_renamefile(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $otherimage['homeimgfile'], NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $new_name);
                        if ($rename[0] == 1) {
                            $fileupload = $new_name;
                        } else {
                            $fileupload = $otherimage['homeimgfile'];
                        }
                    }else{
                        $fileupload = $otherimage['homeimgfile'];
                    }

                    // Copy file từ thư mục tmp sang uploads
                    if (@nv_copyfile(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $fileupload, NV_ROOTDIR . '/' . $currentpath . '/' . $fileupload)) {

                        $filename = str_replace(NV_UPLOADS_DIR . '/' . $module_upload . '/', '', $currentpath . '/' . $fileupload);

                        $sth = $db->prepare('INSERT INTO ' . $table_name . '( rows_id, homeimgfile, weight' . $listfield . ' ) VALUES ( :rows_id, :homeimgfile, 0' . $listvalue . ')');
                        $sth->bindParam(':rows_id', $rows_id, PDO::PARAM_INT);
                        $sth->bindParam(':homeimgfile', $filename, PDO::PARAM_STR, strlen($filename));
                        foreach ($field_lang as $field_lang_i) {
                            list ($flang, $fname) = $field_lang_i;
                            $sth->bindParam(':' . $flang . '_' . $fname, $otherimage[$fname], PDO::PARAM_STR, strlen($otherimage[$fname]));
                        }

                        if(file_exists(NV_ROOTDIR . '/' . $currentpath . '/' . $fileupload)){
                            //tạo thumbnail
                            /*$ima = nv_ImageInfo(NV_ROOTDIR . '/' . $currentpath . '/' . $fileupload, $width, true, NV_ROOTDIR . "/" . $path_thumbnail);
                             nv_renamefile(NV_ROOTDIR . '/' . $ima['src'], NV_ROOTDIR . '/' . $path_thumbnail . '/' . $fileupload);*/

                            $image = new NukeViet\Files\Image(NV_ROOTDIR . '/' . $currentpath . '/' . $fileupload, NV_MAX_WIDTH, NV_MAX_HEIGHT);
                            $resize_maxW = $thumb_config['thumb_width'];
                            $resize_maxH = $thumb_config['thumb_height'];
                            if ($thumb_config['thumb_type'] == 4 or $thumb_config['thumb_type'] == 5) {
                                if (($image->fileinfo['width'] / $image->fileinfo['height']) > ($thumb_config['thumb_width'] / $thumb_config['thumb_height'])) {
                                    $resize_maxW = 0;
                                } else {
                                    $resize_maxH = 0;
                                }
                            }

                            if ($image->fileinfo['width'] > $resize_maxW or $image->fileinfo['height'] > $resize_maxH) {
                                /**
                                 * Resize và crop theo kích thước luôn có một trong hai giá trị width hoặc height = 0
                                 * Có nghĩa luôn cho ra ảnh đúng cấu hình mặc cho ảnh gốc có nhỏ hơn ảnh thumb
                                 */
                                $image->resizeXY($resize_maxW, $resize_maxH);
                                if ($thumb_config['thumb_type'] == 4) {
                                    $image->cropFromCenter($thumb_config['thumb_width'], $thumb_config['thumb_height']);
                                } elseif ($thumb_config['thumb_type'] == 5) {
                                    $image->cropFromTop($thumb_config['thumb_width'], $thumb_config['thumb_height']);
                                }

                                $image->save(NV_ROOTDIR . '/' . $path_thumbnail, $fileupload, $thumb_config['thumb_quality']);
                                $create_Image_info = $image->create_Image_info;
                                $error = $image->error;
                                $image->close();
                                /*if (empty($error)) {
                                    return array(
                                        $path_thumbnail . '/' . basename($create_Image_info['src']),
                                        $create_Image_info['width'],
                                        $create_Image_info['height']
                                    );
                                }*/
                            } elseif (nv_copyfile(NV_ROOTDIR . '/' . $currentpath . '/' . $fileupload, NV_ROOTDIR . '/' . $path_thumbnail . '/' . $fileupload)) {
                                /**
                                 * Đối với kiểu resize ảnh khác nếu ảnh gốc nhỏ hơn ảnh resize
                                 * thì ảnh resize chính là ảnh gốc
                                 */
                                $return = array(
                                    $path_thumbnail . '/' . $fileupload,
                                    $image->fileinfo['width'],
                                    $image->fileinfo['height']
                                );
                                $image->close();
                                return $return;
                            }
                        }

                        if ($sth->execute()) {
                            nv_delete_other_images_tmp(NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $fileupload);
                        }
                    }
                }
            } else {
                $sth = $db->prepare('UPDATE ' . $table_name . ' SET ' . NV_LANG_DATA . '_title = :title, ' . NV_LANG_DATA . '_description = :description, homeimgfile = :homeimgfile WHERE id=' . $otherimage['id']);
                $sth->bindParam(':homeimgfile', $otherimage['homeimgfile'], PDO::PARAM_STR, strlen($otherimage['homeimgfile']));
                foreach ($field_lang as $field_lang_i) {
                    list ($flang, $fname) = $field_lang_i;
                    $sth->bindParam(':' . $fname, $otherimage[$fname], PDO::PARAM_STR, strlen($otherimage[$fname]));
                }
                $sth->execute();
            }
        }

        /*foreach ($array_id_old as $id_old) {
            if (! in_array($id_old, $array_id_new)) {
                $rows = $db->query('SELECT * FROM ' . $table_name . ' WHERE id=' . $id_old)->fetch();
                if (! empty($rows)) {
                    $db->query('DELETE FROM ' . $table_name . ' WHERE id = ' . $id_old);
                    @nv_deletefile(NV_ROOTDIR . '/' . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $rows['homeimgfile']);
                }
            }
        }*/

        $nv_Cache->delMod($module_name);
        Header('Location: ' . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=' . $op . '&id=' . $rows_id);
        die();
    }
}

$maxfilesize = min($global_config['nv_max_size'], nv_converttoBytes(ini_get('upload_max_filesize')), nv_converttoBytes(ini_get('post_max_size')));

$check_security = md5( "nv_albums" . session_id() . $global_config['sitekey'] );
$check_rand = md5( NV_CURRENTTIME . rand( 1, 100 ) );

$xtpl = new XTemplate($op . '.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/' . $module_file);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('TEMPLATE', $global_config['module_theme']);
$xtpl->assign('MODULE_FILE', $module_file);
$xtpl->assign('UPLOAD_URL', NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&' . NV_OP_VARIABLE . '=upload&token=' . md5($nv_Request->session_id . $global_config['sitekey']));
$xtpl->assign('ID', $rows_id);
$xtpl->assign('MAXFILESIZE', $maxfilesize);

$i = 0;
if (! empty($array_data)) {
    foreach ($array_data as $data) {
        $data['title'] = $data[NV_LANG_DATA . '_title'];
        $data['description'] = $data[NV_LANG_DATA . '_description'];
        $data['number'] = $i;
        $data['filepath'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $data['homeimgfile'];
        $data['homeimgfile'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $data['homeimgfile'];
        $data['homeimgfile'] = str_replace(NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/', '', $data['homeimgfile']);
        $xtpl->assign('DATA', $data);
        $xtpl->parse('main.data.loop');
        $i ++;
    }
    $xtpl->parse('main.data');
    $xtpl->parse('main.btn_submit');
    $xtpl->parse('main.btn_add_images');
} else {
    $xtpl->parse('main.empty');
}
$xtpl->assign('COUNT', $i);

if ($nv_Request->isset_request('add', 'get')) {
    $xtpl->parse('main.images_add');
} else {
    $xtpl->parse('main.alert_image_add');
}

if (! empty($error)) {
    $xtpl->assign('ERROR', implode('<br />', $error));
    $xtpl->parse('main.error');
}

$xtpl->parse('main');
$contents = $xtpl->text('main');

$page_title = sprintf($lang_module['images_of'], $tour_info['title']);

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';