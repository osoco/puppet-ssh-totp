class ssh_totp::package {
  case $operatingsystem {
    debian,ubuntu: {
	  include nginx::package::debian
    }
    Gentoo: {
      include nginx::package::gentoo
    }
    defult: {
      fail("${operatingsystem} is not supported by this module.")
    }
  }
}
