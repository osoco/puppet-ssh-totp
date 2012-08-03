class ssh_totp {
	include ssh_totp::package
	include ssh_totp::service
	
	Class['ssh_totp::package'] ~> Class['ssh_totp::service']
}
