<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINASAAS.COM (contact@thuongmaiso.vn)
 * @Copyright (C) 2016 VINASAAS.COM. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sun, 08 May 2016 07:42:57 GMT
 */
if (! defined('NV_IS_MOD_TOURS'))
    die('Stop!!!');

$booking_total = 0;
if ($nv_Request->isset_request('booking', 'post')) {
    $tour_id = $nv_Request->get_int('tour_id', 'post', 0);
    $discounts_id = $nv_Request->get_int('discounts_id', 'post', 0);
    $customerprice = '';
    
    $array_booking = array(
        'contact_fullname' => $nv_Request->get_title('contact_fullname', 'post', ''),
        'contact_address' => $nv_Request->get_title('contact_address', 'post', ''),
        'contact_phone' => $nv_Request->get_title('contact_phone', 'post', ''),
        'contact_email' => $nv_Request->get_title('contact_email', 'post', ''),
        'contact_note' => $nv_Request->get_textarea('contact_note', NV_ALLOWED_HTML_TAGS),
        'payment_method' => $nv_Request->get_int('payment_method', 'post', 0),
        'customerprice' => $nv_Request->get_array('customerprice', 'post', array()),
        'customer' => $nv_Request->get_array('customer', 'post', array()),
        'coupons_code' => $nv_Request->get_title('coupons_code', 'post', '')
    );
    
    if (empty($array_booking['contact_fullname'])) {
        die(nv_booking_result(array(
            'status' => 'error',
            'input' => 'contact_fullname',
            'mess' => $lang_module['error_contact_fullname']
        )));
    }
   
    if (empty($array_booking['contact_address'])) {
        die(nv_booking_result(array(
            'status' => 'error',
            'input' => 'contact_address',
            'mess' => $lang_module['error_contact_address']
        )));
    }
    
    if (empty($array_booking['contact_phone'])) {
        die(nv_booking_result(array(
            'status' => 'error',
            'input' => 'contact_phone',
            'mess' => $lang_module['error_contact_phone']
        )));
    }
    
    if (empty($array_booking['contact_email'])) {
        die(nv_booking_result(array(
            'status' => 'error',
            'input' => 'contact_email',
            'mess' => $lang_module['error_contact_email']
        )));
    }
    
    $checkmail = nv_check_valid_email($array_booking['contact_email']);
    if (! empty($checkmail)) {
        die(nv_booking_result(array(
            'status' => 'error',
            'input' => 'contact_email',
            'mess' => $checkmail
        )));
    }
    
    
    // dinh dang ma booking
    $result = $db->query("SHOW TABLE STATUS WHERE Name='" . $db_config['prefix'] . "_" . $module_data . "_booking'");
    $item = $result->fetch();
    $result->closeCursor();
    $booking_code = vsprintf($array_config['format_booking_code'], $item['auto_increment']);
    $user_id = ! empty($user_info) ? $user_info['userid'] : 0;
    
    
    $array_booking['unit_total'] = $array_config['money_unit'];
    $array_booking['booking_total'] = 0;
    $array_booking['coupons_value'] = 0;
    $array_booking['booking_time'] = NV_CURRENTTIME;
    $checksum = md5($global_config['sitekey'] . '-' . $booking_code . '-' . $array_booking['booking_time']);
    
    $_sql = 'INSERT INTO ' . $db_config['prefix'] . '_' . $module_data . '_booking(
        booking_code, tour_id, lang, contact_fullname, contact_address, contact_phone, 
        contact_email, contact_note, user_id, ip, customerprice, unit_total, 
        booking_time, discounts_id, coupons_id, coupons_value, payment_method, checksum) VALUES(:booking_code, 
        :tour_id, :lang, :contact_fullname, :contact_address, :contact_phone, :contact_email, 
        :contact_note, :user_id, :ip, :customerprice, :unit_total, :booking_time, 
        :discounts_id, :coupons_id, :coupons_value, :payment_method, :checksum)';
    
    $data_insert = array();
    $data_insert['booking_code'] = $booking_code;
    $data_insert['tour_id'] = $tour_id;
    $data_insert['lang'] = NV_LANG_DATA;
    $data_insert['contact_fullname'] = $array_booking['contact_fullname'];
    $data_insert['contact_address'] = $array_booking['contact_address'];
    $data_insert['contact_phone'] = $array_booking['contact_phone'];
    $data_insert['contact_email'] = $array_booking['contact_email'];
    $data_insert['contact_note'] = $array_booking['contact_note'];
    $data_insert['user_id'] = $user_id;
    $data_insert['ip'] = $client_info['ip'];
    $data_insert['customerprice'] = 0;
    $data_insert['unit_total'] = $array_booking['unit_total'];
    $data_insert['booking_time'] = $array_booking['booking_time'];
    $data_insert['discounts_id'] = 0;
    $data_insert['coupons_id'] = 0;
    $data_insert['coupons_value'] = 0;
    $data_insert['payment_method'] = 0;
    $data_insert['checksum'] = $checksum;
    $booking_id = $db->insert_id($_sql, 'booking_id', $data_insert);
    
    if ($booking_id > 0) {
        
        // cap nhat tong tien booking
        $db->query('UPDATE ' . $db_config['prefix'] . '_' . $module_data . '_booking SET booking_total=' . $booking_total . ' WHERE booking_id=' . $booking_id);
        
        // cap nhat so cho con lai
        // nv_update_rest($tour_id, count($array_booking['customer']));
        
        // Gui email thong tin booking cho khach
        if ($array_config['booking_sendmail']) {
            $email_content = nv_theme_tours_info($tour_info, $array_booking, 'sendmail_booking_content');
            
            $xtpl = new XTemplate('sendmail_booking_guest.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file);
            $xtpl->assign('LANG', $lang_module);
            $xtpl->assign('CONTENT', $email_content);
            $xtpl->assign('URL_PAYMENT', NV_MY_DOMAIN . nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $module_info['alias']['payment'] . '/' . $booking_code . '-' . $checksum, true));
            
            $xtpl->parse('main');
            $email_content = $xtpl->text('main');
            
            nv_sendmail(array(
                $global_config['site_name'],
                $global_config['site_email']
            ), $array_booking['contact_email'], sprintf($lang_module['booking_sendmail_title'], $global_config['site_name']), $email_content);
        }
        
        // Gui email thong bao quan tri ve booking moi
        $listmail_admin = nv_listmail_admin();
        if (! empty($listmail_admin)) {
            $email_content = nv_theme_tours_info($tour_info, $array_booking, 'sendmail_booking_content');
            
            $xtpl = new XTemplate('sendmail_booking_admin.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file);
            $xtpl->assign('LANG', $lang_module);
            $xtpl->assign('CONTENT', $email_content);
            $xtpl->assign('URL_DETAIL', NV_MY_DOMAIN . NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=booking-detail&amp;id=' . $booking_id);
            
            $xtpl->parse('main');
            $email_content = $xtpl->text('main');
            
            nv_sendmail(array(
                $global_config['site_name'],
                $global_config['site_email']
            ), $listmail_admin, sprintf($lang_module['booking_sendmail_admin_title'], $booking_code, $global_config['site_name']), $email_content);
        }
        
       
        
        die(nv_booking_result(array(
            'status' => 'success',
            'booking_code' => $booking_code,
            'checksum' => $checksum,
            'mess' => $lang_module['success_send_quick_advice']
        )));
    }
    
    die(nv_booking_result(array(
        'status' => 'error',
        'mess' => $lang_module['error_booking_data']
    )));
}

