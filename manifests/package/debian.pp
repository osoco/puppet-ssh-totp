class ssh_totp::package::debian {
	package { 'openssh':
		ensure => present,
	}
}
