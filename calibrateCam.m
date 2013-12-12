function calibrateCam(pt1, pt2, pt3)
	% maxval=max(max(data.img))
	% imagesc(data.img,[0,maxval/10])

	delx = double( abs( pt1(1)-pt2(1) ));
	dely = double( abs( pt1(2)-pt2(2) ));

	theta=atan(dely/(delx*sqrt(2)));

	h = abs( pt1(2)-pt3(2) )

	w=cos(theta)*h

	res = 2.5*10^3/w

	display(['Resolution is ' num2str(res) ' um/px.']);
end
