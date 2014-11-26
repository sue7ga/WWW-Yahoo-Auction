use strict;
use warnings;
use Data::Dumper;
use WWW::Yahoo::Auction;
use XML::Simple;

my $yahoo = new WWW::Yahoo::Auction(categoryID => 0);

#print Dumper $yahoo->response;

my $res = eval{
 my $xml = new XML::Simple();
 $xml->XMLin($yahoo->response);
};

print Dumper $res;