function [x_dot] = dynamics(x, soleus, tibialis)

% Inputs
%  x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
% soleus: soleus muscle (HillTypeModel)
% tibialis: tibialis anterior muscle (HillTypeModel)

% Output
% x_dot: derivative of state vector

soleus_activation = 0.05;
tibialis_activation = 0.4;
ankle_inertia = 90;

soleus_moment_arm = 0.05;
tibialis_moment_arm = 0.03;

%WRITE CODE HERE TO IMPLEMENT THE MODEL

tau_s = fm_s*force_length_tendon(x(3))*soleus_moment_arm;
tau_ta = fm_ta*force_length_tendon(x(4))*tibialis_moment_arm;


x1_dot = x(2);
x2_dot = ()

end