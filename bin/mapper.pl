#!/usr/bin/perl -w
# mapper.pl v1.0

sub process_data {
  my ($input) = @_;
  chomp $input;

  my (@data) = split /\s+/, $input;
  my $ip   = $data[0];
  my $code = $data[8];
  my ($good,$bad) = ( $code == '200' ? (1,0) : (0,1) );

  return ($ip, $good, $bad);
}

sub mapper {
  while (  ) {
    my ($ip, $good, $bad) = process_data ( $_ );
    next unless $good || $bad;

    print $ip, "\t", join(",", $good, $bad), "\n";
  }
}

mapper;
