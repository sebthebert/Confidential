package Confidential::Parameter;

use Mojo::Base 'Mojolicious::Controller';

sub get 
{
	my $self = shift;
	my $parameter = $self->param('anything');

	$self->render(text => "Getting parameter $parameter");
}

1;
