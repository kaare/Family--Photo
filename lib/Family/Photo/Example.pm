package Family::Photo::Example;
use 5.010;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
	my $self = shift;

	say STDERR ref $self->req->uploads;

	for my $upload (@{ $self->req->uploads }) {
		say STDERR $upload->filename if $upload;
	}
	# Render template "example/welcome.html.ep" with message
	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}

1;
