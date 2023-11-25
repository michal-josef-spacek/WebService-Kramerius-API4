package WebService::Kramerius::API4::User;

use strict;
use warnings;

use base qw(WebService::Kramerius::API4::Base);

our $VERSION = 0.02;

sub profile {
	my $self = shift;

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/user/profile');
}

sub user {
	my $self = shift;

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/user');
}

1;
