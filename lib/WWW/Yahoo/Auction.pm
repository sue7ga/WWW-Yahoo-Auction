package WWW::Yahoo::Auction;
use 5.008005;
use strict;
use warnings;
use Mouse;
use URI;
use Furl;
use Carp;

our $VERSION = "0.01";

use Config::Pit;
use Data::Dumper;
use constant BASEURL => 'http://auctions.yahooapis.jp/AuctionWebService/V2/search?';

my $config = ();
$config = pit_get("yahoo.auction");

has furl => (
  is => 'rw',
 isa => 'Furl',
 default => sub{
   my $furl = Furl->new(
     agent => 'WWW::Kosoku::API(Perl)',
     timeout => 10,
   );
    $furl;
 },
);

has categoryID => (
 is => 'rw',isa => 'Int'
);

has response => (
   is => 'ro',
   default => sub{
    my $self = shift;
    my $response = $self->furl->get($self->url);

   $response->decoded_content;
  },
);

sub url{
 my ($self,$furigana) = shift;
 my $url = URI->new(BASEURL);
 $url->query_form(
  appid => $config->{appid},
  query => '遊戯王',
 );
 return $url->as_string;
}


1;


__END__

=encoding utf-8

=head1 NAME

WWW::Yahoo::Auction - It's new $module

=head1 SYNOPSIS

    use WWW::Yahoo::Auction;

=head1 DESCRIPTION

WWW::Yahoo::Auction is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

