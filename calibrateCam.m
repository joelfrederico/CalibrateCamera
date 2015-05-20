function calibrateCam(pt1, pt2, spacing,img,clims)
    % maxval=max(max(data.img))
    % imagesc(data.img,[0,maxval/10])

    delx = double( abs( pt1(1)-pt2(1) ));
    dely = double( abs( pt1(2)-pt2(2) ));

    theta=atan(dely/(delx))

    % h = abs( pt2(2)-pt3(2) )

    % w=cos(theta)*h
    % w = cos(theta)*delx
    w = sqrt(delx^2 + dely^2)
    res = spacing/w*1e6;

    restext = ['Resolution is ' num2str(res) ' um/px.'];
    display(restext);
    imagesc(img,clims);
    xlabel(restext);

    % X Vector
    xvec = [pt1(1), pt2(1)];
    yvec = [pt2(2), pt2(2)];

    midpt = [mean(xvec), mean(yvec)];
    line(xvec,yvec,'Color','red');

    % Y Vector
    xvec = [pt1(1), pt1(1)];
    yvec = [pt1(2), pt2(2)];
    line(xvec,yvec,'Color','red');

    % Direct Vector
    xvec = [pt1(1), pt2(1)];
    yvec = [pt1(2), pt2(2)];
    midpt = [mean(xvec), mean(yvec)];
    line(xvec,yvec,'Color','red');

    linetext = ['Direct vector:\npx length: ' num2str(w) '\ntotal length: ' num2str(spacing) ' m'];
    text(midpt(1)+200, midpt(2), sprintf(linetext) ,'Color','red');
end
