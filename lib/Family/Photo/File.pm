package Family::Photo::File;

use 5.010;
use Mojo::Base 'Mojolicious::Controller';

sub upload {
	my $self = shift;

	for my $upload (@{ $self->req->uploads }) {
		say STDERR $upload->filename if $upload;
	}
	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}

1;
