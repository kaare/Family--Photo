use Plack::Builder;
use Mojolicious::Commands;

sub check_pass {
	my( $username, $pass ) = @_;
	return $username eq $pass;
}

$ENV{MOJO_APP} ||= 'Family::Photo';

builder {
	enable 'Session';
	enable 'Auth::Form', authenticator => \&check_pass;
	Mojolicious::Commands->start;
}