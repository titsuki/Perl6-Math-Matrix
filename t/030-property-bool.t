use Test;
use Math::Matrix;
plan 20;

my $matrixa = Math::Matrix.new([[1,2],[3,4]]);
my $matrixc = Math::Matrix.new([[8,8],[8,8]]);
my $matrixd = Math::Matrix.new([[1,2,3],[4,5,6]]);

my $zero = Math::Matrix.zero(3,4);
my $identity = Math::Matrix.identity(3);
my $diagonal = Math::Matrix.diagonal([1,2,3]);
my $ut = Math::Matrix.new([[1,2,3],[0,5,6],[0,0,6]]);
my $lt = Math::Matrix.new([[1,0,0],[4,5,0],[4,5,0]]);


ok $matrixa.is-square,    "Is a square matrix";
nok $matrixd.is-square,   "Is not a square matrix";

ok $zero.is-zero,         "Is a zero matrix";
nok $identity.is-zero,    "Is not a zero matrix";

ok $diagonal.is-diagonal  "Is a diagonal matrix";
nok $matrixd.is-diagonal  "Is not a diagonal matrix";

ok $ut.is-upper-triangular       "Is an upper triangular matrix";
ok $diagonal.is-upper-triangular "Diagonal are upper triangular";
nok $matrixa.is-upper-triangular "Is not an upper triangular matrix";
nok $lt.is-upper-triangular      "lower is no upper triangular matrix";

ok $lt.is-lower-triangular       "Is an lower triangular matrix";
ok $diagonal.is-lower-triangular "Diagonal are lower triangular";
nok $matrixc.is-lower-triangular "Is not an lower diagonal matrix";
nok $ut.is-lower-triangular      "upper is no lower triangular matrix";

ok $identity.is-identity,  "Is a identity matrix";
nok $diagonal.is-identity, "Is not a identity matrix";

ok $diagonal.is-symmetric, "Is a symmetric matrix";
nok $matrixa.is-symmetric, "Is not a symmetric matrix";

ok $identity.is-orthogonal, "Is a orthogonal matrix";
nok $matrixa.is-orthogonal, "Is not a orthogonal matrix";
