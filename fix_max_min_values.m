function fix_max_min_values(tofixstr,handles)
	% Get max and min values
	display('here');
	display(get(handles.maxLim,'Value'))
	minval=int32(get(handles.minLim,'Value'))
	maxval=int32(get(handles.maxLim,'Value'))

	switch tofixstr
	case 'min'
		if maxval <= minval
			% set(handles.minLim,'Value',maxval-1);
			% set(handles.MincountsText,'String',num2str(maxval-1));
		end
	case 'max'
		if maxval <= minval
			% set(handles.maxLim,'Value',minval+1);
			% set(handles.MaxcountsText,'String',num2str(minval+1));
		end
	end
end
