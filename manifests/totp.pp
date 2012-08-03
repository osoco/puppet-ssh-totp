define ssh_totp::totp($secretKey = undef) {

  include ssh_totp
  
  if ($secretKey == undef) {
    fail('ssh_totp::totp secretKey must be defined')
  }

  $totp_scripts_dir = '/opt/totp'
  $check_totp_script = "${totp_scripts_dir}/check_otp"
  $forcecommand="ForceCommand ${check_totp_script} ${secretKey}"
  
  File { 
	owner => 'root', 
	group => 'root'
  }
  
  file { "${totp_scripts_dir}" :
    ensure => directory,
    mode => 0755      
  }
  
  file { "${check_totp_script}" :
    ensure => present,
    mode => 0744,
    content => template("ssh_totp/check_otp.erb"),
    require => File["${totp_scripts_dir}"]
  }

  exec { "config_ssh_forcecommand":
    command => "echo '${forcecommand}' >> ${ssh_totp::params::sshd_config_file}",
    unless => "grep -qx '${forcecommand}' ${ssh_totp::params::sshd_config_file} 2>/dev/null",
    require => File["${check_totp_script}"]
  }

}
