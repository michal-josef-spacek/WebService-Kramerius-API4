package WebService::Kramerius::API4::Info;

use strict;
use warnings;

use base qw(WebService::Kramerius::API4::Base);

our $VERSION = 0.02;

sub info {
	my ($self, $lang) = @_;

	my $opts_hr = {
		'language' => $lang,
	};

	return $self->_get_data($self->{'library_url'}.'search/api/v5.0/info'.
		$self->_construct_opts($opts_hr));
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

WebService::Kramerius::API4::Info - Class to info endpoint in Kramerius v4+ API.

=head1 SYNOPSIS

 use WebService::Kramerius::API4::Info;

 my $obj = WebService::Kramerius::API4::Info->new(%params);
 my $info = $obj->info($lang);

=head1 METHODS

=head2 C<new>

 my $obj = WebService::Kramerius::API4::Info->new(%params);

Constructor.

=over 8

=item * C<library_url>

Library URL.

This parameter is required.

Default value is undef.

=item * C<output_dispatch>

Output dispatch hash structure.
Key is content-type and value is subroutine, which converts content to what do you want.

Default value is blank hash array.

=back

Returns instance of object.

=head2 C<info>

 my $info = $obj->info($lang);

Get info about Kramerius system.

Returns string with JSON.

=head1 ERRORS

 new():
         Parameter 'library_url' is required.
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

=head1 EXAMPLE

 use strict;
 use warnings;

 use WebService::Kramerius::API4::Info;

 if (@ARGV < 2) {
         print STDERR "Usage: $0 library_url lang\n";
         exit 1;
 }
 my $library_url = $ARGV[0];
 my $lang = $ARGV[1];

 my $obj = WebService::Kramerius::API4::Info->new(
         'library_url' => $library_url,
 );

 my $item_json = $obj->info($lang);

 print $item_json."\n";

 # Output for 'http://kramerius.mzk.cz/' and 'cs'
 # TODO

=head1 DEPENDENCIES

L<WebService::Kramerius::API4::Base>.

=head1 SEE ALSO

=over

=item L<WebService::Kramerius::API4::Struct>

Class to Kramerius v4+ API, which returns Perl structures instead raw data.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/WebService-Kramerius-API4>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2015-2023

BSD 2-Clause License

=head1 VERSION

0.02

=cut
