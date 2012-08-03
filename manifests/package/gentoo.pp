class ssh_totp::package::gentoo {
	package { 'net-misc/openssh':
		ensure => present,
	}
}
