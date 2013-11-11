
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A web framework light, yet rich in nutrients.",
  "AUTHOR" => "Stefan Geneshky <minimal\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Kelp",
  "EXE_FILES" => [
    "bin/Kelp"
  ],
  "LICENSE" => "perl",
  "NAME" => "Kelp",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::Inspector" => 0,
    "Data::Dumper" => 0,
    "Encode" => 0,
    "File::Basename" => 0,
    "File::Path" => 0,
    "File::Slurp" => 0,
    "FindBin" => 0,
    "Getopt::Long" => 0,
    "JSON" => 0,
    "Log::Dispatch" => 0,
    "Plack::Test" => 0,
    "Plack::Util" => 0,
    "Sys::Hostname" => 0,
    "Template::Tiny" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0,
    "Try::Tiny" => 0,
    "feature" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Temp" => 0,
    "HTTP::Request::Common" => 0,
    "IO::File" => 0,
    "Plack::Middleware::Session" => 0,
    "Test::Exception" => 0,
    "Test::Harness" => 0,
    "lib" => 0,
    "utf8" => 0
  },
  "VERSION" => "0.455",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



