use 5.010;
use strict;
use warnings;
use Plack::Builder;
use Config::General;
use Mojolicious::Commands;

sub check_pass {
	my( $username, $pass ) = @_;
	return $username eq $pass;
}

my %imagesize = Config::General->new('imagesize.conf')->getall;
$ENV{MOJO_APP} ||= 'Family::Photo';

builder {
	enable 'Session';
	enable 'Auth::Form', authenticator => \&check_pass;
	enable 'ConditionalGET';
	enable 'Image::Scale', size => \%imagesize;
	enable 'Static', path => qr{^/images/};
	Mojolicious::Commands->start;
};