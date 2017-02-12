use strict;
use warnings;

use WebService::Kramerius::API4::Struct;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($WebService::Kramerius::API4::Struct::VERSION, 0.02, 'Version.');
