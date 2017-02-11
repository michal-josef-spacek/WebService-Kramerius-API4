package WebService::Kramerius::API4;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);
use LWP::UserAgent;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Library URL.
	$self->{'library_url'} = undef;

	# Output dispatch.
	$self->{'output_dispatch'} = {};

	# Process params.
	set_params($self, @params);

	# Check library URL.
	if (! defined $self->{'library_url'}) {
		err "Parameter 'library_url' is required.";
	}

	# LWP::UserAgent.
	$self->{'_ua'} = LWP::UserAgent->new;
	$self->{'_ua'}->agent('WebService::Kramerius::API4/'.$VERSION);

	# Object.
	return $self;
}

# Get item.
sub get_item {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id");
}

sub get_item_children {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/children");
}

sub get_item_siblings {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/siblings");
}

sub get_item_streams {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/streams");
}

sub get_item_streams_one {
	my ($self, $item_id, $stream_id) = @_;

	# XXX Hack for bad content type for alto.
	if ($stream_id eq 'alto') {
		$self->{'_force_content_type'} = 'text/xml';
	}

	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/streams/$stream_id");
}

sub get_item_image {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/full");
}

sub get_item_preview {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/preview");
}

sub get_item_thumb {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/thumb");
}

sub get_item_foxml {
	my ($self, $item_id) = @_;
	return $self->_get_data($self->{'library_url'}."search/api/v5.0/item/".
		"uuid:$item_id/foxml");
}

sub _get_data {
	my ($self, $url) = @_;
	my $req = HTTP::Request->new('GET' => $url);
	my $res = $self->{'_ua'}->request($req);
	if (! $res->is_success) {
		err "Cannot get '$url' URL.";
	}
	my $content_type = $res->headers->content_type;

	# XXX Hack for forced content type.
	if (exists $self->{'_force_content_type'}) {
		$content_type = delete $self->{'_force_content_type'};
	}

	my $ret = $res->content;
	if (exists $self->{'output_dispatch'}->{$content_type}) {
		$ret = $self->{'output_dispatch'}->{$content_type}->($ret);
	}
	return $ret;
}

1;

__END__
