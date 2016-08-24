#!/usr/bin/perl -w
# reducer.pl v1.0

my $previp =    0;
my $currip =    0;
my $goodcount = 0;
my $badcount  = 0;

sub output {
  my ($ip, $good, $bad) = @_;
  print $ip, "\t", join(",", $good, $bad), "\n";
}

while ( <> ) {
  chomp;
  my ($ip, $str) = split /\t/, $_;
  my ($good, $bad) = split /,/, $str;

  # new ip ?
  if ( $ip ne $previp ) {
    if ( $previp && ( $goodcount > 0 || $badcount > 0 ) ) {
      output($previp, $goodcount, $badcount);
    }

    # reset 
    $goodcount = 0;
    $badcount  = 0;
    $previp = $ip;
  }

  $goodcount += $good;
  $badcount  += $bad;
  $currip = $ip;
}

# last ip
if ( $currip && ( $goodcount > 0 || $badcount > 0 ) ) {
  output($currip, $goodcount, $badcount);
}
