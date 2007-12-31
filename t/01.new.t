use Test::More tests => 9;

BEGIN {
use_ok( 'XML::Atom::App' );
}

diag( "Testing XML::Atom::App $XML::Atom::App::VERSION" );
# use Data::Dumper;my $test = XML::Atom::App->new('particles'=>[{'id'=>1,'content'=>'hello'},{'id'=>2,'content'=>'goodbye'}]);diag(Dumper($test, $test->as_xml));
# $test->create_from_atomic_structure([{'id'=>2,'content'=>'new two'},{'id'=>3,'content'=>'three being the 3rd number'}]);diag(Dumper($test->as_xml));
# $test->create_from_atomic_structure([{'id'=>2,'content'=>'new two'},{'id'=>3,'content'=>'three being the 3rd number'}], 1);diag(Dumper($test->as_xml));
# diag(Dumper($test));

ok( ref XML::Atom::App->new() eq 'XML::Atom::App', 'ref type new()' );

ok( XML::Atom::App->new()->version() eq '1.0', 'Default to Atom 1.0' );
ok( XML::Atom::App->new({'Version'=> '0.3'})->version() eq '0.3', 'Version key in new()' );

ok( XML::Atom::App->new()->{'alert_cant'} eq '', 'no alert_cant key in new()' );
ok( XML::Atom::App->new({'alert_cant' => 'not code'})->{'alert_cant'} eq '', 'invalid alert_cant key in new()' );
ok( ref XML::Atom::App->new({'alert_cant' => sub {} })->{'alert_cant'} eq 'CODE', 'valid alert_cant key in new()' );

ok( XML::Atom::App->new()->{'time_of_last_create_from_atomic_structure'} eq 0, 'no particles' );
ok( XML::Atom::App->new({'particles' => [{'id'=>1,'content'=>'hello'},{'id'=>2,'content'=>'goodbye'}] })->{'time_of_last_create_from_atomic_structure'} > 0, 'particles implies create_from_atomic_structure()' );