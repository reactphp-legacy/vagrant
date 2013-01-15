class repository {
  case $::osfamily {
    debian  : { include debian_repository }
    redhat  : { include redhat_repository }
    default : { notice("Unsupported OS family '${::osfamily}'") }
  }
}
