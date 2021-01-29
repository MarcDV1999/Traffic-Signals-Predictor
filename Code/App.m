classdef App < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        SelectButton                 matlab.ui.control.Button
        SelectimagetorecognizeLabel  matlab.ui.control.Label
        TrafficSignalDetectorLabel   matlab.ui.control.Label
        Image                        matlab.ui.control.Image
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SelectButton
        function clickButton(app, event)
            main();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            addpath('OtherFunctions');  
            addpath('Segmentation');
            addpath('Features');
            addpath('Data');
            addpath('Predict');
            addpath('Images');

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create SelectButton
            app.SelectButton = uibutton(app.UIFigure, 'push');
            app.SelectButton.ButtonPushedFcn = createCallbackFcn(app, @clickButton, true);
            app.SelectButton.BackgroundColor = [0 0.4706 0.6314];
            app.SelectButton.FontName = 'Futura';
            app.SelectButton.FontSize = 15;
            app.SelectButton.FontColor = [1 1 1];
            app.SelectButton.Position = [106 199 135 33];
            app.SelectButton.Text = 'Select';

            % Create SelectimagetorecognizeLabel
            app.SelectimagetorecognizeLabel = uilabel(app.UIFigure);
            app.SelectimagetorecognizeLabel.FontName = 'Futura';
            app.SelectimagetorecognizeLabel.FontSize = 18;
            app.SelectimagetorecognizeLabel.FontColor = [0 0.4706 0.6314];
            app.SelectimagetorecognizeLabel.Position = [64 265 219 27];
            app.SelectimagetorecognizeLabel.Text = 'Select image to recognize';

            % Create TrafficSignalDetectorLabel
            app.TrafficSignalDetectorLabel = uilabel(app.UIFigure);
            app.TrafficSignalDetectorLabel.HorizontalAlignment = 'center';
            app.TrafficSignalDetectorLabel.FontName = 'Futura';
            app.TrafficSignalDetectorLabel.FontSize = 50;
            app.TrafficSignalDetectorLabel.FontColor = [0 0.4706 0.6314];
            app.TrafficSignalDetectorLabel.Position = [34 363 574 73];
            app.TrafficSignalDetectorLabel.Text = 'Traffic Signal Detector';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [300 43 308 288];
            app.Image.ImageSource = 'traffic-signal.png';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = App

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end