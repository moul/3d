/*
"place Vandome" anal plug.
by Gnieark https://blog-du-grouik.tinad.fr
License GNU-GPL

This design is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY, We don't know if it is safe. Don't use it on your nose!
*/

cylinder (r=25, h=3);

translate([0,0,2.9]) cylinder (r=12, h=6);
  $fn = 100;

translate([0,0,30]) sphere (25, center=true);
translate([0,0,65]) sphere (18, center=true);
translate([0,0,90]) resize ([16.5,16.5,20]) sphere (20);
