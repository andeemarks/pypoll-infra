node "default" {
        include python
        include django
        include logging
}

class python {
        package {
                "build-essential":   ensure => latest;
                "python":            ensure => "2.7.3-0ubuntu2";
                "python-dev":        ensure => "2.7.3-0ubuntu2";
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

class logging {
        file { "/var/log/pypoll.log":
                owner => ubuntu,
                group => ubuntu,
                mode => 644,
                ensure => file
        }
}
