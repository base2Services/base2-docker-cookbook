name             "base2-docker"
maintainer       "Base2Services"
maintainer_email "itsupport@base2services.com"
license          "All rights reserved"
description      "Installs/Configures base2-docker"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.1.0"
source_url       "https://github.com/base2Services/base2-docker-cookbook"
issues_url       "https://github.com/base2Services/base2-docker-cookbook/issues"

depends "docker"
depends "lvm"
