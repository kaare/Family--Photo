package Family::Photo;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
	my $self = shift;

	# Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
	$self->plugin('pod_renderer');

	# Plugins
	$self->plugin('xslate_renderer');

	# Routes
	my $r = $self->routes;

	# Normal route to controller
	$r->route('/upload')->to('file#upload');
	$r->route('/view')->to('file#view');
}

1;
# ABSTRACT: Family Photo Album