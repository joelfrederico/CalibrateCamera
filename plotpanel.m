function handles=plotpanel(hObject,handles)
	% axes(handles.mainimage);
	figure(handles.figh);
	
	
	maxval=get(handles.maxLim,'Value');
	minval=get(handles.minLim,'Value');

	display(['Minval is: ' num2str(minval)])
	display(['Maxval is: ' num2str(maxval)])
	display('updated')

	% display(maxval)

	% cmap=custom_cmap();
	% colormap(cmap.wbgyr);

	img=handles.image;

	% if minval == 0
	%         minval = 0.5;
	% end
	imagesc(img,[double(minval),double(maxval)]);
	colorbar
	
end
