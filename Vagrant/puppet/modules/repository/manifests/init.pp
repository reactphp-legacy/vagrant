class repository {
  case $::osfamily {
    debian  : { include debian_repository }
    default : { notice("Unsupported OS family '${::osfamily}'") }
  }
}
