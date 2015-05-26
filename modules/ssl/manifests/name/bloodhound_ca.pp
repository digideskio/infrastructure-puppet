#/etc/puppet/modules/manifests/ssl/name/bloodhound_ca.pp

class ssl::name::bloodhound_ca (

  $sslcertcontents             = '',
  $sslcertname                 = 'bloodhound-ca.crt',
  $sslchaincontent             = '',
  $sslchainname                = '',
  $sslkeycontents              = '',
  $sslkeyname                  = '',
  $sslcombinedcontents         = '',
  $sslcombinedname             = '',
  $sslrootdir                  = '/etc/ssl',
  $sslrootdirgroup             = 'root',
  $sslrootdirowner             = 'root',
  $sslrootdirumask             = '0755',
) {

  file {
    $sslrootdir:
      ensure   =>  directory,
      group    =>  $sslrootdirgroup,
      owner    =>  $sslrootdirowner,
      mode     =>  $sslrootdirumask;
    "${sslrootdir}/certs":
      ensure   =>  directory,
      group    =>  $sslrootdirgroup,
      owner    =>  $sslrootdirowner,
      mode     =>  '0755';
    "${sslrootdir}/certs/${sslcertname}":
      ensure  => present,
      require => File[$sslrootdir],
      content => $sslcertcontents,
      owner   => $sslrootdirowner,
      group   => $sslrootdirgroup,
      mode    => '0644';
  }
}