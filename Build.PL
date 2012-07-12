use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name       => 'MooseX::Exception::Base',
	license           => 'perl',
	dist_author       => 'Ivan Wills <ivan.wills@gmail.com>',
	dist_version_from => 'lib/MooseX/Exception/Base.pm',
	requires          => {
		'perl'             => 5.008,
	},
	build_requires => {
		'Test::More'       => 0,
		'Test::NoWarnings' => 0,
	},
	add_to_cleanup     => [ 'MooseX-Exception-Base-*' ],
	create_makefile_pl => 'traditional',
	create_license     => 1,
	meta_merge => {
		resources => {
			repository => 'git://github.com/ivanwills/MooseX-Exception-Base.git',
			bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX::Exception::Base',
		},
	},
);

$builder->create_build_script();
