/*
training plug
by Gnieark https://blog-du-grouik.tinad.fr
License GNU-GPL

This design is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY, We don't know if it is safe. Don't use it on your nose!

*/

cylinder (r=15, h=3);

translate([0,0,2.9]) cylinder (r=8, h=20);
  $fn = 100;
hull(){
  translate([0,0,30]) sphere (15, center=true);
  translate([0,0,60]) sphere (5);
}

translate([40,0,0])cylinder (r=15, h=3);

translate([40,0,2.9]) cylinder (r=8, h=20);
  $fn = 100;
hull(){
  translate([40,0,30]) sphere (20, center=true);
  translate([40,0,60]) sphere (5);
}

