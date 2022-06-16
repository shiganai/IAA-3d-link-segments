classdef vizapp_1link_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        ZSlider       matlab.ui.control.Slider
        ZSliderLabel  matlab.ui.control.Label
        YSlider       matlab.ui.control.Slider
        YSliderLabel  matlab.ui.control.Label
        XSlider       matlab.ui.control.Slider
        XSliderLabel  matlab.ui.control.Label
        UIAxes        matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
        func_seg1_corners
        l1
        p_corners
        theta1_vec
    end
    
    methods (Access = private)
        
        function update_points(app)
            xyz_corners = app.func_seg1_corners( app.l1, app.theta1_vec(1), app.theta1_vec(2), app.theta1_vec(3) );

            app.p_corners.XData = xyz_corners(:,:,1);
            app.p_corners.YData = xyz_corners(:,:,2);
            app.p_corners.ZData = xyz_corners(:,:,3);
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, l1, func_seg1_corners)
            app.l1 = l1;
            app.func_seg1_corners = func_seg1_corners;

            range = [-1.1, 1.1] * app.l1;
            app.UIAxes.XLim = range;
            app.UIAxes.YLim = range;
            app.UIAxes.ZLim = range;

            app.theta1_vec = [0, 0, 0];

            xyz_corners = app.func_seg1_corners( app.l1, app.theta1_vec(1), app.theta1_vec(2), app.theta1_vec(3) );

            app.p_corners = plot3(app.UIAxes, xyz_corners(:, :, 1), xyz_corners(:, :, 2), xyz_corners(:, :, 3), '-ro');

            update_points(app)

            daspect(app.UIAxes, [1,1,1])
        end

        % Value changing function: XSlider
        function XSliderValueChanging(app, event)
            changingValue = event.Value;
            
            app.theta1_vec(1) = deg2rad( changingValue );

            update_points(app)
        end

        % Value changing function: YSlider
        function YSliderValueChanging(app, event)
            changingValue = event.Value;
            
            app.theta1_vec(2) = deg2rad( changingValue );

            update_points(app)
        end

        % Value changing function: ZSlider
        function ZSliderValueChanging(app, event)
            changingValue = event.Value;
            
            app.theta1_vec(3) = deg2rad( changingValue );

            update_points(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 674 503];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [34 96 364 312];

            % Create XSliderLabel
            app.XSliderLabel = uilabel(app.UIFigure);
            app.XSliderLabel.HorizontalAlignment = 'right';
            app.XSliderLabel.Position = [443 365 25 22];
            app.XSliderLabel.Text = 'X';

            % Create XSlider
            app.XSlider = uislider(app.UIFigure);
            app.XSlider.Limits = [0 360];
            app.XSlider.ValueChangingFcn = createCallbackFcn(app, @XSliderValueChanging, true);
            app.XSlider.Position = [489 374 150 3];

            % Create YSliderLabel
            app.YSliderLabel = uilabel(app.UIFigure);
            app.YSliderLabel.HorizontalAlignment = 'right';
            app.YSliderLabel.Position = [444 306 25 22];
            app.YSliderLabel.Text = 'Y';

            % Create YSlider
            app.YSlider = uislider(app.UIFigure);
            app.YSlider.Limits = [0 360];
            app.YSlider.ValueChangingFcn = createCallbackFcn(app, @YSliderValueChanging, true);
            app.YSlider.Position = [490 315 150 3];

            % Create ZSliderLabel
            app.ZSliderLabel = uilabel(app.UIFigure);
            app.ZSliderLabel.HorizontalAlignment = 'right';
            app.ZSliderLabel.Position = [444 243 25 22];
            app.ZSliderLabel.Text = 'Z';

            % Create ZSlider
            app.ZSlider = uislider(app.UIFigure);
            app.ZSlider.Limits = [0 360];
            app.ZSlider.ValueChangingFcn = createCallbackFcn(app, @ZSliderValueChanging, true);
            app.ZSlider.Position = [490 252 150 3];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = vizapp_1link_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

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