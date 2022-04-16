package main

// Copyright (C) 2022 - DevAnaZ
// Distributed under terms of the MIT license.

import (
	"fmt"
	"os/exec"
	"sync"
	"flag"
	"io/ioutil"
	"log"
	"net/http"
	"net/http/cookiejar"
	"strings"
	"time"
)

var client http.Client

func init() {
	jar, err := cookiejar.New(nil)
	if err != nil {
		log.Fatalf("Got error while creating cookie jar %s", err.Error())
	}
	client = http.Client{
		Jar: jar,
	}
}

func ad() {
	cmd := exec.Command("qbittorrent-nox", "--profile=./")
	cmd.Run()
}

func as() {
qbusername := flag.String("username", "admin", "Zdefault username")
qbpassword := flag.String("password", "adminadmin", "Zdefault password")



flag.Parse()
// using/printing flags to avoid error

fmt.Println("username:", *qbusername)
fmt.Println("password:", *qbpassword)

	for {
		c := http.Client{Timeout: time.Duration(1) * time.Second}
		resp, err := c.Get("http://127.0.0.1:8080")
		if err != nil {
			continue
		}

		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		responseString := string(body)
		substr := "user"
		if strings.Contains(responseString, substr) {
			fmt.Println("The substring is present in the string.")

			urlx := "http://localhost:8080/api/v2/auth/login"
			methodx := "POST"

			payloadx := strings.NewReader(`username=admin&password=adminadmin`)

			client := &http.Client{}
			reqx, err := http.NewRequest(methodx, urlx, payloadx)

			if err != nil {
				fmt.Println(err)
				return
			}
			reqx.Header.Add("Referer", "http://localhost:8080/")
			reqx.Header.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36")
			reqx.Header.Add("Content-type", "application/x-www-form-urlencoded; charset=UTF-8")

			resx, err := client.Do(reqx)
			if err != nil {
				fmt.Println(err)
				return
			}
			defer resx.Body.Close()

			cookie := resx.Cookies()
			fmt.Println(cookie)

			bodyx, err := ioutil.ReadAll(resx.Body)
			if err != nil {
				fmt.Println(err)
				return
			}
			fmt.Println(string(bodyx))

			//second req starting here ffffffffffffffffffffffffffffffffffffffffffffffffff


			url := "http://localhost:8080/api/v2/app/setPreferences"
			method := "POST"

			payload := strings.NewReader("json=%7B%22torrent_content_layout%22%3A%22Original%22%2C%22start_paused_enabled%22%3Afalse%2C%22auto_delete_mode%22%3Afalse%2C%22preallocate_all%22%3Afalse%2C%22incomplete_files_ext%22%3Afalse%2C%22auto_tmm_enabled%22%3A%22false%22%2C%22torrent_changed_tmm_enabled%22%3A%22true%22%2C%22save_path_changed_tmm_enabled%22%3A%22false%22%2C%22category_changed_tmm_enabled%22%3A%22false%22%2C%22save_path%22%3A%22%2Fhome%2Fdev%2Fq%2FqBittorrent%2Fdownloads%22%2C%22temp_path_enabled%22%3Afalse%2C%22temp_path%22%3A%22%2Fhome%2Fdev%2Fq%2FqBittorrent%2Fdownloads%2Ftemp%22%2C%22export_dir%22%3A%22%22%2C%22export_dir_fin%22%3A%22%22%2C%22scan_dirs%22%3A%7B%7D%2C%22mail_notification_enabled%22%3Afalse%2C%22mail_notification_sender%22%3A%22qBittorrent_notification%40example.com%22%2C%22mail_notification_email%22%3A%22%22%2C%22mail_notification_smtp%22%3A%22smtp.changeme.com%22%2C%22mail_notification_ssl_enabled%22%3Afalse%2C%22mail_notification_auth_enabled%22%3Atrue%2C%22mail_notification_username%22%3A%22%22%2C%22mail_notification_password%22%3A%22%22%2C%22autorun_enabled%22%3Afalse%2C%22autorun_program%22%3A%22%22%2C%22listen_port%22%3A8724%2C%22upnp%22%3Atrue%2C%22max_connec%22%3A500%2C%22max_connec_per_torrent%22%3A100%2C%22max_uploads%22%3A20%2C%22max_uploads_per_torrent%22%3A4%2C%22proxy_type%22%3A0%2C%22proxy_auth_enabled%22%3Afalse%2C%22proxy_ip%22%3A%220.0.0.0%22%2C%22proxy_port%22%3A8080%2C%22proxy_peer_connections%22%3Afalse%2C%22proxy_torrents_only%22%3Afalse%2C%22proxy_username%22%3A%22%22%2C%22proxy_password%22%3A%22%22%2C%22ip_filter_enabled%22%3Afalse%2C%22ip_filter_path%22%3A%22%22%2C%22ip_filter_trackers%22%3Afalse%2C%22banned_IPs%22%3A%22%22%2C%22up_limit%22%3A0%2C%22dl_limit%22%3A0%2C%22alt_up_limit%22%3A10240%2C%22alt_dl_limit%22%3A10240%2C%22bittorrent_protocol%22%3A%220%22%2C%22limit_utp_rate%22%3Atrue%2C%22limit_tcp_overhead%22%3Afalse%2C%22limit_lan_peers%22%3Atrue%2C%22scheduler_enabled%22%3Afalse%2C%22dht%22%3Atrue%2C%22pex%22%3Atrue%2C%22lsd%22%3Atrue%2C%22encryption%22%3A%220%22%2C%22anonymous_mode%22%3Afalse%2C%22queueing_enabled%22%3Afalse%2C%22max_ratio_enabled%22%3Afalse%2C%22max_ratio%22%3A-1%2C%22max_seeding_time_enabled%22%3Afalse%2C%22max_seeding_time%22%3A-1%2C%22max_ratio_act%22%3A0%2C%22add_trackers_enabled%22%3Afalse%2C%22add_trackers%22%3A%22%22%2C%22rss_processing_enabled%22%3Afalse%2C%22rss_refresh_interval%22%3A%2230%22%2C%22rss_max_articles_per_feed%22%3A%2250%22%2C%22rss_auto_downloading_enabled%22%3Afalse%2C%22rss_download_repack_proper_episodes%22%3Atrue%2C%22rss_smart_episode_filters%22%3A%22s(%5C%5Cd%2B)e(%5C%5Cd%2B)%5Cn(%5C%5Cd%2B)x(%5C%5Cd%2B)%5Cn(%5C%5Cd%7B4%7D%5B.%5C%5C-%5D%5C%5Cd%7B1%2C2%7D%5B.%5C%5C-%5D%5C%5Cd%7B1%2C2%7D)%5Cn(%5C%5Cd%7B1%2C2%7D%5B.%5C%5C-%5D%5C%5Cd%7B1%2C2%7D%5B.%5C%5C-%5D%5C%5Cd%7B4%7D)%22%2C%22locale%22%3A%22%22%2C%22web_ui_domain_list%22%3A%22*%22%2C%22web_ui_address%22%3A%22*%22%2C%22web_ui_port%22%3A8080%2C%22web_ui_upnp%22%3Atrue%2C%22use_https%22%3Afalse%2C%22web_ui_https_cert_path%22%3A%22%22%2C%22web_ui_https_key_path%22%3A%22%22%2C%22web_ui_username%22%3A%22" + *qbusername + "%22%2C%22web_ui_password%22%3A%22" + *qbpassword + "%22%2C%22bypass_local_auth%22%3Afalse%2C%22bypass_auth_subnet_whitelist_enabled%22%3Afalse%2C%22bypass_auth_subnet_whitelist%22%3A%22%22%2C%22web_ui_max_auth_fail_count%22%3A%225%22%2C%22web_ui_ban_duration%22%3A%223600%22%2C%22web_ui_session_timeout%22%3A%223600%22%2C%22alternative_webui_enabled%22%3Afalse%2C%22alternative_webui_path%22%3A%22%22%2C%22web_ui_clickjacking_protection_enabled%22%3Atrue%2C%22web_ui_csrf_protection_enabled%22%3Atrue%2C%22web_ui_secure_cookie_enabled%22%3Atrue%2C%22web_ui_host_header_validation_enabled%22%3Atrue%2C%22web_ui_use_custom_http_headers_enabled%22%3Afalse%2C%22web_ui_custom_http_headers%22%3A%22%22%2C%22web_ui_reverse_proxy_enabled%22%3Afalse%2C%22web_ui_reverse_proxies_list%22%3A%22%22%2C%22dyndns_enabled%22%3Afalse%2C%22dyndns_service%22%3A%220%22%2C%22dyndns_domain%22%3A%22changeme.dyndns.org%22%2C%22dyndns_username%22%3A%22%22%2C%22dyndns_password%22%3A%22%22%2C%22current_network_interface%22%3A%22%22%2C%22current_interface_address%22%3A%22%22%2C%22save_resume_data_interval%22%3A%2260%22%2C%22recheck_completed_torrents%22%3Afalse%2C%22resolve_peer_countries%22%3Atrue%2C%22reannounce_when_address_changed%22%3Afalse%2C%22async_io_threads%22%3A%2210%22%2C%22hashing_threads%22%3A%222%22%2C%22file_pool_size%22%3A%225000%22%2C%22checking_memory_use%22%3A%2232%22%2C%22disk_cache%22%3A%22-1%22%2C%22disk_cache_ttl%22%3A%2260%22%2C%22enable_os_cache%22%3Atrue%2C%22enable_coalesce_read_write%22%3Afalse%2C%22enable_piece_extent_affinity%22%3Afalse%2C%22enable_upload_suggestions%22%3Afalse%2C%22send_buffer_watermark%22%3A%22500%22%2C%22send_buffer_low_watermark%22%3A%2210%22%2C%22send_buffer_watermark_factor%22%3A%2250%22%2C%22connection_speed%22%3A%2230%22%2C%22socket_backlog_size%22%3A%2230%22%2C%22outgoing_ports_min%22%3A%220%22%2C%22outgoing_ports_max%22%3A%220%22%2C%22upnp_lease_duration%22%3A%220%22%2C%22peer_tos%22%3A%224%22%2C%22utp_tcp_mixed_mode%22%3A%220%22%2C%22idn_support_enabled%22%3Afalse%2C%22enable_multi_connections_from_same_ip%22%3Afalse%2C%22validate_https_tracker_certificate%22%3Atrue%2C%22ssrf_mitigation%22%3Atrue%2C%22block_peers_on_privileged_ports%22%3Afalse%2C%22enable_embedded_tracker%22%3Afalse%2C%22embedded_tracker_port%22%3A%229000%22%2C%22upload_slots_behavior%22%3A%220%22%2C%22upload_choking_algorithm%22%3A%221%22%2C%22announce_to_all_trackers%22%3Afalse%2C%22announce_to_all_tiers%22%3Atrue%2C%22announce_ip%22%3A%22%22%2C%22max_concurrent_http_announces%22%3A%2250%22%2C%22stop_tracker_timeout%22%3A%225%22%2C%22peer_turnover%22%3A%224%22%2C%22peer_turnover_cutoff%22%3A%2290%22%2C%22peer_turnover_interval%22%3A%22300%22%7D")

			clientx := &http.Client{}
			req, err := http.NewRequest(method, url, payload)

			if err != nil {
				fmt.Println(err)
				return
			}
			//  req.Header.Add("Accept", "text/javascript, text/html, application/xml, text/xml, */*")
			req.Header.Add("Referer", "http://localhost:8080/")
			req.Header.Add("X-Requested-With", "XMLHttpRequest")
			req.Header.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36")
			req.Header.Add("Content-type", "application/x-www-form-urlencoded; charset=UTF-8")

			//  req.AddCookie(cookies)
			for _, c := range cookie {
				req.AddCookie(c)
			}
			//  req.Header.Add("Cookie", cookie)
			res, err := clientx.Do(req)
			if err != nil {
				fmt.Println(err)
				return
			}
			defer res.Body.Close()

			body, err := ioutil.ReadAll(res.Body)
			if err != nil {
				fmt.Println(err)
				return
			}
			fmt.Println(string(body))

			break
			//second reqstarting hereffffffffffffffffffffffffffffffffffffffffffffffffffff

		} else {
			fmt.Println("The substring is not present in the string.")
		}

	}

}

func main() {

	var process sync.WaitGroup

	fmt.Printf("qbittorent started server to env PORT \n")

	process.Add(2)
	go ad()
	go as()

	process.Wait()
	fmt.Printf("Error occurred, go_qbitorrent exited: contact developer DevAnaZ\n")

}
