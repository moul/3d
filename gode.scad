/*
gode
by Gnieark https://blog-du-grouik.tinad.fr
License GNU-GPL 

This design is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY, We don't know if it is safe. Don't use it on your nose!

*/
cylinder (r=20, h=3);
translate([0,0,2.9]) cylinder (r=19, h=160);
  $fn = 100;



  translate([0,0,160]) resize ([0,0,45]) sphere (20, center=true);
	difference(){
		union(){
			translate([10,0,10]) sphere(20);
			translate([-10,0,10]) sphere(20);
		}
		translate([-50,-50,-50])cube([100,100,50]);
	}

resize([41,41,163]) spring(10,12,400,20);

module spring(r1 = 100, r2 = 10, h = 400, hr = 200)
{
	stepsize = 1/16;
	module segment(i1, i2) {
		alpha1 = i1 * 360*r2/hr;
		alpha2 = i2 * 360*r2/hr;
		len1 = sin(acos(i1*2-1))*r2;
		len2 = sin(acos(i2*2-1))*r2;
		if (len1 < 0.01)
			polygon([
				[ cos(alpha1)*r1, sin(alpha1)*r1 ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
		if (len2 < 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*r1, sin(alpha2)*r1 ],
			]);
		if (len1 >= 0.01 && len2 >= 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
	}
	linear_extrude(height = 100, twist = 180*h/hr,
			$fn = (hr/r2)/stepsize, convexity = 5) {
		for (i = [ stepsize : stepsize : 1+stepsize/2 ])
			segment(i-stepsize, min(i, 1));
	}
}
