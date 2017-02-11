package WebService::Kramerius::API4::Struct;

use base qw(WebService::Kramerius::API4);
use strict;
use warnings;

use JSON;
use XML::Simple;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, %params) = @_;
	my $xml_callback = sub {
		my $xml = shift;
		return XML::Simple->new->XMLin($xml);
	};
	$params{'output_dispatch'} = {
		'application/json' => sub {
			my $json = shift;
			return JSON->new->decode($json);
		},
		'application/xml' => $xml_callback,
		'text/xml' => $xml_callback,
	};
	return $class->SUPER::new(%params);
}

1;

__END__
