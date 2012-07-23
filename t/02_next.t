use strict;
use Test::More;
use App::digestarchive;
use FindBin qw($Bin);
use File::Spec;

our $tar_archive = File::Spec->catfile($Bin, "test-archive.tar");

my $app = App::digestarchive->new;
$app->read($tar_archive);
my $f = $app->next;

isa_ok $f, "Archive::Tar::File", "\$f is Archive::Tar::File package" ;
foreach my $method (@App::digestarchive::ADD_ENTRY_METHODS) {
	ok eval { $f->can($method) } , "Archive::Tar::File $method method";
}

done_testing;
