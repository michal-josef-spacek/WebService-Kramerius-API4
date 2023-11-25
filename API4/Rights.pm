package WebService::Kramerius::API4::Rights;

use strict;
use warnings;

use base qw(WebService::Kramerius::API4::Base);

our $VERSION = 0.02;

sub rights {
	my ($self, $opts_hr) = @_;

	$self->_validate_opts($opts_hr, ['actions', 'pid']);

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/rights'.
		$self->_construct_opts($opts_hr));
}

1;
