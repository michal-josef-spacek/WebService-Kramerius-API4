use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use WebService::Kramerius::API4::Feed;

# Test.
is($WebService::Kramerius::API4::Feed::VERSION, 0.03, 'Version.');
