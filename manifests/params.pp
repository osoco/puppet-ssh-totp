class ssh_totp::params {
  
  $totp_scripts_dir = '/opt/totp'
  $check_totp_scripts_dir = "${totp_scripts_dir}/check_otp'
  $sshd_config_file = '/etc/ssh/sshd_config'

}
