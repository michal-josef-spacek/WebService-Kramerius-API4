use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('WebService::Kramerius::API4::Feed');
}

# Test.
require_ok('WebService::Kramerius::API4::Feed');
