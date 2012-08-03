class ssh_tpt::service {

  service { "ssh":
    ensure     => running,
	enable	   => true,
    hasstatus  => true,
	hasrestart => true
  }
  
}
