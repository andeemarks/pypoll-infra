node "default" {
        include python
        include django
}

class python {
        package {
                "build-essential": ensure => latest;
                "python": ensure => "2.7.2-7ubuntu2";
                "python-dev": ensure => "2.7.2-7ubuntu2";
                "python-setuptools": ensure => installed;
        }
        exec { 
                "pip":
                command => "sudo easy_install pip",
                path => "/usr/local/bin:/usr/bin:/bin",
                require => Package["python-setuptools"];
        }
}

class django {
        package {
                "django":
                        ensure => "1.4",
                        provider => pip,
                        require => Exec["pip"];
                }
}

