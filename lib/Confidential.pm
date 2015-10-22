package Confidential;

use Mojo::Base 'Mojolicious';

use Confidential::Parameter;

# This method will run once at server start
sub startup 
{
  	my $self = shift;

  	# Router
  	my $r = $self->routes;

	
  	$r->get('/parameter/*anything')->to('parameter#get');
	$r->get('/template/*anything')->to('template#get');
	$r->get('/template_parameters/*anything')->to('template#get_parameters');
	$r->get('/template_render/*anything')->to('template#render');
}

1;
