use inc::Module::Install;
use Module::Install::AuthorTests;

name 'perl5-tokuhirom';
all_from 'lib/perl5/tokuhirom.pm';

requires(
	'Data::Printer' => 0,
	'indirect'=> 0,
	'autovivification' => 0,
	'bareword::filehandles' => 0,
);

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More' => 0.96; # done_testing, subtest
author_tests('xt');
WriteAll;
