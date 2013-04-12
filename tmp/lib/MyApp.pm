package MyApp;
use lib '../lib';
use base 'Kelp';
use Moose;
use Plack::Middleware::ContentLength;

has color => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;
        return $self->mode;
    }
);

sub build {
    my $self = shift;
    $self->routes->add("/test", "test");
}

sub test {
    my $self = shift;
    return $self->name;
}

sub run {
    my $self = shift;
    my $app = $self->SUPER::run(@_);
    Plack::Middleware::ContentLength->wrap($app);
}


1;
