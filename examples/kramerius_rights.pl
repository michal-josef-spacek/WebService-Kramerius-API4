#!/usr/bin/env perl

use strict;
use warnings;

use WebService::Kramerius::API4::Rights;

if (@ARGV < 1) {
        print STDERR "Usage: $0 library_url\n";
        exit 1;
}
my $library_url = $ARGV[0];

my $obj = WebService::Kramerius::API4::Rights->new(
        'library_url' => $library_url,
);

my $item_json = $obj->rights;

print $item_json."\n";

# Output for 'http://kramerius.mzk.cz/', pretty print.
# TODO