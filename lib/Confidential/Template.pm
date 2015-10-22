package Confidential::Template;

use Mojo::Base 'Mojolicious::Controller';
use Path::Tiny;

use Template::Constants qw( :debug );
use Template::Context;

my $dir_templates = path(__FILE__)->parent->parent->parent . '/data/templates';

=head2 get

=cut
 
sub get 
{
	my $self = shift;
	my $file = $self->param('anything');

	my $content = path("$dir_templates/$file")->slurp_utf8;

	$self->render(text => $content);
}

=head2 get_parameters

=cut

sub get_parameters
{
	my $self = shift;
    my $file = $self->param('anything');

    my $content = path("$dir_templates/$file")->slurp_utf8;

	my $context = Template::Context->new(TRACE_VARS => 1);
	my $compiled = $context->template(\$content);
	my $variables = $compiled->variables;	

	$self->render(json => $variables);
}

=head2 render

=cut

=head2 comment
sub render
{
	my $self = shift;
    my $file = $self->param('anything');

    my $content = path("$dir_templates/$file")->slurp_utf8;

#	my $debug_tt = Template->new({
#  		DEBUG => DEBUG_UNDEF,
#		});

	#my $output = '';
	#eval {$debug_tt->process(\$content, $vars, \$output)};

	#if ($debug_tt->error())
	#{
	#	$self->render(text => "Error missing variables");
	#}
	#else
	#{
	#	$self->render(text => "$output");
	#}

	$self->render(text => $content);	
}
=cut

1;
