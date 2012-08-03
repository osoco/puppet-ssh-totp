class ssh_totp::service {

  service { "ssh":
    ensure     => running,
	enable	   => true,
    hasstatus  => true,
	hasrestart => true
  }
  
}
