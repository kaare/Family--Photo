package Family::Photo::File;

use 5.010;
use Mojo::Base 'Mojolicious::Controller';

sub view {
	my $self = shift;

	my $files = [map {my $small = $_; $small =~ s/\.(\w+)$/_small.$1/; {orig => $_, small => $small}} glob 'images/kaare/*' ];
	my $groups = [qw/Sommerhus Filippinerne/];
	$self->render(groups => $groups, files => $files);
}

sub upload {
	my $self = shift;

	for my $upload (@{ $self->req->uploads }) {
		say STDERR $upload->filename if $upload;
	}
	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}

1;
