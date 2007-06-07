% A very simple demo for the classical Kalman filter and smoother
% using the continous Wiener process acceleration (CWPA) model. 
%
% Copyright (C) 2007 Jouni Hartikainen
%
% This software is distributed under the GNU General Public 
% Licence (version 2 or later); please refer to the file 
% Licence.txt, included with the software, for details.

% Transition matrix for the continous-time system.
F = [0 0 1 0 0 0;
     0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     0 0 0 0 0 0;
     0 0 0 0 0 0];

% Noise effect matrix for the continous-time system.
L = [0 0;
     0 0;
     0 0;
     0 0;
     1 0;
     0 1];

% Stepsize
dt = 0.5;

% Process noise variance
q = 0.2;
Qc = diag([q q]);

% Discretization of the continous-time system.
[A,Q] = lti_disc(F,L,Qc,dt);

% Measurement model.
H = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 1 0 0];

% Variance in the measurements.
r = 10;
R = diag([r r r r]);

% Generate the data.
n = 50;
Y = zeros(size(H,1),n);
X_r = zeros(size(F,1),n);
X_r(:,1) = [0 0 0 0 0 0]';
for i = 2:n
   X_r(:,i) = A*X_r(:,i-1) + gauss_rnd(zeros(size(F,1),1), Q);
end

% Generate the measurements.
for i = 1:n
   Y(:,i) = H*X_r(:,i) + gauss_rnd(zeros(size(Y,1),1), R);
end

plot(X_r(1,:), X_r(2,:), Y(1,:),Y(2,:),'.');
legend('Real signal', 'Measurements');
title('Position');
print -dps demo1_f1.ps

% Initial guesses for the state mean and covariance.
m = [0 0 0 0 0 0]';
P = diag([0.1 0.1 0.1 0.1 0.5 0.5]);

%% Space for the estimates.
MM = zeros(size(m,1), size(Y,2));
PP = zeros(size(m,1), size(m,1), size(Y,2));

% Filtering steps.
for i = 1:size(Y,2)
   [m,P] = kf_predict(m,P,A,Q);
   [m,P] = kf_update(m,P,Y(:,i),H,R);
   MM(:,i) = m;
   PP(:,:,i) = P;
end

% Smoothing step.
[SM,SP] = rts_smooth(MM,PP,A,Q);
[SM2,SP2] = fbf_smooth(MM,PP,Y,A,Q,H,R,1);

pause

subplot(1,2,1);
plot(X_r(1,:), X_r(2,:),'--', MM(1,:), MM(2,:),X_r(1,1),X_r(2,1),...
     'o','MarkerSize',12)
legend('Real signal', 'Filtered');
title('Position estimation with Kalman filter.');
xlabel('x_1');
ylabel('x_2');

subplot(1,2,2);
plot(X_r(3,:), X_r(4,:),'--', MM(3,:), MM(4,:));
legend('Real signal', 'Filtered');
title('Velocity estimation with Kalman filter.');
xlabel('x_1');
ylabel('x_2');

pause
subplot(1,2,1);
plot(X_r(1,:), X_r(2,:),'--', SM(1,:), SM(2,:));
legend('Real signal', 'Smoothed');
title('Position estimation with RTS smoother.');
xlabel('x_1');
ylabel('x_2');

subplot(1,2,2);
plot(X_r(3,:), X_r(4,:),'--', SM(3,:), SM(4,:));
legend('Real signal', 'Smoothed');
title('Velocity estimation with RTS smoother.');
xlabel('x_1');
ylabel('x_2');

pause
subplot(1,2,1);
plot(X_r(1,:), X_r(2,:),'--', SM2(1,:), SM2(2,:));
legend('Real signal', 'Smoothed');
title('Position estimation with RTS smoother.');
xlabel('x_1');
ylabel('x_2');

subplot(1,2,2);
plot(X_r(3,:), X_r(4,:),'--', SM2(3,:), SM2(4,:));
legend('Real signal', 'Smoothed');
title('Velocity estimation with RTS smoother.');
xlabel('x_1');
ylabel('x_2');

% Track and animate the filtering result. 
clc
disp(['Filtering result is now displayed sequentially on',...
     'every time step.']);
disp(['The observations are displayed as green dots and',...
     'the real signal as solid blue line.']);
disp(['The filtering result of previous steps is plotted',...
     'as dashed black line.']);
disp(['The covariance in each step is displayed as a green',...
     'ellipse around the mean (black circle) on each step.']);
disp(['The predicted position on next step is displayed as',... 
     'a red circle']);
disp(' ');
disp('Press any to proceed to next step');

clf
EST = [];
for k=1:size(Y,2)
    M = MM(:,k);  
    P = PP(:,:,k);
    EST = [EST M];
    M_pred = kf_predict(M,P,A,Q);
    
    % Confidence ellipse
    tt = (0:0.01:1)*2*pi;
    cc = repmat(M(1:2),1,length(tt)) + ...
	 2*chol(P(1:2,1:2))'*[cos(tt);sin(tt)];

    % Animate
    plot(X_r(1,:),X_r(2,:),'-',...
         Y(1,:), Y(2,:), '.',...
         M(1),M(2),'ko',...
         M_pred(1),M_pred(2),'ro',...
         EST(1,:),EST(2,:),'k--',...
	 cc(1,:),cc(2,:),'g-');
    drawnow;
    pause;
end

% Smoothing result.
clf; clc;
disp(['Smoothing (using RTS smoother) result is now displayed',...
     'sequentially on every time step in reverse order.']);
disp(['The observations are displayed as green dots and the',...
     'real signal as solid blue line.']);
disp(['The smoothing result of previous steps is plotted as',...
     'dashed black line.']);
disp(['The covariance in each step is displayed as a green ellipse',...
     'around the mean (black circle) on each step.']);
disp(' ');
disp('Press any to proceed to next step');

EST = [];
for k=size(Y,2):-1:1
    M = SM(:,k);  
    P = SP(:,:,k);
    EST = [EST M];

    % Confidence ellipse
    tt = (0:0.01:1)*2*pi;
    cc = repmat(M(1:2),1,length(tt)) + ...
	 2*chol(P(1:2,1:2))'*[cos(tt);sin(tt)];

    % Animate
    len = 1.5;
    plot(X_r(1,:),X_r(2,:),'-',...
         Y(1,:),Y(2,:),'.',...         
         M(1),M(2),'ko',...
         EST(1,:),EST(2,:),'k--',...
	 cc(1,:),cc(2,:),'g-');
    drawnow;
    pause;
end

% MSEs of position estimates
MSE_KF1 = mean((X_r(1,:)-MM(1,:)).^2);
MSE_KF2 = mean((X_r(2,:)-MM(2,:)).^2);
MSE_KF = 1/2*(MSE_KF1 + MSE_KF2);

MSE_RTS1 = mean((X_r(1,:)-SM(1,:)).^2);
MSE_RTS2 = mean((X_r(2,:)-SM(2,:)).^2);
MSE_RTS = 1/2*(MSE_RTS1 + MSE_RTS2);

MSE_FBF1 = mean((X_r(1,:)-SM2(1,:)).^2);
MSE_FBF2 = mean((X_r(2,:)-SM2(2,:)).^2);
MSE_FBF = 1/2*(MSE_FBF1 + MSE_FBF2);

clc;
fprintf('Mean square errors of position estimates:\n');
fprintf('KF-RMSE = %.4f\n',MSE_KF);
fprintf('RTS-RMSE = %.4f\n',MSE_RTS);
fprintf('FBF-RMSE = %.4f\n\n',MSE_FBF);


