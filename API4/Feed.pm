package WebService::Kramerius::API4::Feed;

use strict;
use warnings;

use base qw(WebService::Kramerius::API4::Base);

our $VERSION = 0.02;

sub custom {
	my ($self, $opts_hr) = @_;

	$self->_validate_opts($opts_hr, ['policy', 'type']);

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/feed/custom'.
		$self->_construct_opts($opts_hr));
}

sub mostdesirable {
	my ($self, $opts_hr) = @_;

	$self->_validate_opts($opts_hr, ['limit', 'offset', 'type']);

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/feed/mostdesirable'.
		$self->_construct_opts($opts_hr));
}

sub newest {
	my ($self, $opts_hr) = @_;

	$self->_validate_opts($opts_hr, ['limit', 'offset', 'type']);

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/feed/newest'.
		$self->_construct_opts($opts_hr));
}

1;
