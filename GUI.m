function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI


% Last Modified by GUIDE v2.5 11-Dec-2024 15:12:13


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);

min=str2double(get(handles.edit3,'String'));
max=str2double(get(handles.edit4,'String'));
b=contrastStretching(img,min,max);

axes(handles.axes3);
imshow(b);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = getimage(handles.axes1);
value=str2double(get(handles.edit1,'String'));
b=brightness(img, 'add', value);
axes(handles.axes3);
imshow(b);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);

b=rgbToGray(img,'average');
axes(handles.axes3);
imshow(b);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);
b=rgbToBinary(img);
axes(handles.axes3);
imshow(b);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);

thre=str2double(get(handles.edit2,'String'));
b=grayToBinary(img,thre);
axes(handles.axes3);
imshow(b);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = getimage(handles.axes1);
b=complement(img);
axes(handles.axes3);
imshow(b);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  img = getimage(handles.axes1);
    
    % Call histogram function to get the histogram data
    hist_data = histogram(img);
    
    % Plot the histogram on the appropriate axes (axes3)
    axes(handles.axes3);  % Make axes3 the current axes
    bar(0:255, hist_data);  % Plot the histogram
    title('Histogram of Grayscale Image');
    xlabel('Pixel Intensity');
    ylabel('Frequency');

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = getimage(handles.axes1);
value=str2double(get(handles.edit1,'String'));
b=brightness(img, 'subtract', value);
axes(handles.axes3);
imshow(b);


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = getimage(handles.axes1);
value=str2double(get(handles.edit1,'String'));
b=brightness(img, 'divide', value);
axes(handles.axes3);
imshow(b);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = getimage(handles.axes1);
value=str2double(get(handles.edit1,'String'));
b=brightness(img, 'multiply', value);
axes(handles.axes3);
imshow(b);


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton70.
function pushbutton70_Callback(hObject, eventdata, handles)

 if isfield(handles, 'OriginalImage') && ~isempty(handles.OriginalImage)
        % Check if the FunctionToRun is set
        if isfield(handles, 'FunctionToRun') && ~isempty(handles.FunctionToRun)
            % Call the point processing function with the original image
            processedImage = handles.FunctionToRun(handles.OriginalImage);
            
            % Display the processed image in the axes (axes2 or whatever axes you use)
            axes(handles.axes3);  % Specify the correct axes handle
              imshow(processedImage);
            
           
            handles.ModifiedImage=processedImage;
            % Update handles structure
            guidata(hObject, handles);
        else
            % Display error if FunctionToRun is not defined
            msgbox('Please set the point processing function first.', 'Error', 'error');
        end
    else
        % Display error if no image is loaded
        msgbox('Please load an image first!', 'Error', 'error');
    end

% hObject    handle to pushbutton70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton69.
function pushbutton69_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton62.
function pushbutton62_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton61.
function pushbutton61_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton64.
function pushbutton64_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton63.
function pushbutton63_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton66.
function pushbutton66_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in applyedge.
function applyedge_Callback(hObject, eventdata, handles)
     if isfield(handles, 'OriginalImage') && ~isempty(handles.OriginalImage)
        % Check if the FunctionToRun is set
        if isfield(handles, 'FunctionToRun') && ~isempty(handles.FunctionToRun)
            % Call the point processing function with the original image
            processedImage = handles.FunctionToRun(handles.OriginalImage);
            
            % Display the processed image in the axes (axes2 or whatever axes you use)
            axes(handles.axes3);  % Specify the correct axes handle
              imshow(processedImage);
            
           
            handles.ModifiedImage=processedImage;
            % Update handles structure
            guidata(hObject, handles);
        else
            % Display error if FunctionToRun is not defined
            msgbox('Please set the point processing function first.', 'Error', 'error');
        end
    else
        % Display error if no image is loaded
        msgbox('Please load an image first!', 'Error', 'error');
    end

    
% hObject    handle to applyedge (see GCBO)

% --- Executes on button press in pushbutton65.
function pushbutton65_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton65 (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton67.
function pushbutton67_Callback(hObject, eventdata, handles)

      if isfield(handles, 'OriginalImage') && ~isempty(handles.OriginalImage)
        % Check if the FunctionToRun is set
        if isfield(handles, 'FunctionToRun') && ~isempty(handles.FunctionToRun)
            % Call the point processing function with the original image
            processedImage = handles.FunctionToRun(handles.OriginalImage);
            
            % Display the processed image in the axes (axes2 or whatever axes you use)
            axes(handles.axes3);  % Specify the correct axes handle
              imshow(processedImage);
            
           
            handles.ModifiedImage=processedImage;
            % Update handles structure
            guidata(hObject, handles);
        else
            % Display error if FunctionToRun is not defined
            msgbox('Please set the point processing function first.', 'Error', 'error');
        end
    else
        % Display error if no image is loaded
        msgbox('Please load an image first!', 'Error', 'error');
    end


% hObject    handle to pushbutton67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton71.
function pushbutton71_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[fileName, filePath] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.jpeg, *.png, *.bmp, *.tif)'}, ...
                                     'Select an Image');
% Check if the user canceled the selection
if isequal(fileName, 0)
    disp('No file selected');
    return;
end


    
    % Construct the full file path
    fullFileName = fullfile(filePath, fileName);
    
    % Read the image
    img = imread(fullFileName);
    
    % Display the image in the axes
    axes(handles.axes1);  % Replace 'axes1' with the tag of your GUI's axes
    imshow(img);
    handles.OriginalImage=img;

    
    % Update the handles structure (if required in your GUI)
    guidata(hObject, handles);



% --- Executes on button press in point.
function point_Callback(hObject, eventdata, handles)
 handles.FunctionToRun = @pointEdgeDetection;
    
    % Update handles structure
    guidata(hObject, handles);

% hObject    handle to point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of point


% --- Executes on button press in radiobutton83.
function radiobutton83_Callback(hObject, eventdata, handles)
 handles.FunctionToRun = @hortizalEdgeDetection;
    
    % Update handles structure
    guidata(hObject, handles);

% hObject    handle to radiobutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton83


% --- Executes on button press in radiobutton84.
function radiobutton84_Callback(hObject, eventdata, handles)
 handles.FunctionToRun = @verticalEdgeDetection;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton84


% --- Executes on button press in radiobutton85.
function radiobutton85_Callback(hObject, eventdata, handles)
 handles.FunctionToRun = @LeftDiagonalEdgeDection;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton85


% --- Executes on button press in radiobutton86.
function radiobutton86_Callback(hObject, eventdata, handles)
 handles.FunctionToRun = @RightDiagonalEdgeDection;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton86


% --- Executes on button press in radiobutton89.
function radiobutton89_Callback(hObject, eventdata, handles)
 handles.FunctionToRun =@PonintSharping;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton89


% --- Executes on button press in radiobutton90.
function radiobutton90_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @HorizontalSharping;
    
    % Update handles structure
    guidata(hObject, handles);

% hObject    handle to radiobutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton90


% --- Executes on button press in radiobutton91.
function radiobutton91_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @verticalSharping;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton91


% --- Executes on button press in radiobutton92.
function radiobutton92_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @DiagonalLeftSharping;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton92


% --- Executes on button press in radiobutton103.
function radiobutton103_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @DiagonalRightSharping;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton103


% --- Executes on button press in radiobutton102.
function radiobutton102_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @boxFilterBlurring;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton102


% --- Executes on button press in radiobutton101.
function radiobutton101_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Max_Blurring_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton101


% --- Executes on button press in radiobutton100.
function radiobutton100_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Min_Blurring_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton100


% --- Executes on button press in radiobutton99.
function radiobutton99_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Median_Blurring_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton99


% --- Executes on button press in radiobutton98.
function radiobutton98_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @idealLowPassFilter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton98


% --- Executes on button press in radiobutton97.
function radiobutton97_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Butterworth_Low_Pass_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton97


% --- Executes on button press in radiobutton96.
function radiobutton96_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Gaussian_Low_Pass_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton96


% --- Executes on button press in radiobutton104.
function radiobutton104_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @High_Pass_Filter;
    
    % Update handles structure
    guidata(hObject, handles);

% hObject    handle to radiobutton104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton104


% --- Executes on button press in radiobutton94.
function radiobutton94_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton94


% --- Executes on button press in radiobutton105.
function radiobutton105_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Butterworth_High_Pass_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton105


% --- Executes on button press in radiobutton106.
function radiobutton106_Callback(hObject, eventdata, handles)
handles.FunctionToRun = @Gaussian_High_Pass_Filter;
    
    % Update handles structure
    guidata(hObject, handles);
% hObject    handle to radiobutton106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton106


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
