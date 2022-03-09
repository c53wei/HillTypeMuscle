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

tau_s = force_length_tendon(soleus.norm_tendon_length(soleus_length( ...
    x(1)), x(3)))*soleus_moment_arm*soleus.f0M;
tau_ta = force_length_tendon(tibialis.norm_tendon_length( ...
    tibialis_length(x(1)), x(4)))*tibialis_moment_arm*tibialis.f0M;


x1_dot = x(2);
x2_dot = (tau_s-tau_ta+gravity_moment(x(1)))/ankle_inertia;
x3_dot = get_velocity(soleus_activation, x(3), ...
    soleus.norm_tendon_length(soleus_length(x(1)), x(3)));
x4_dot = get_velocity(tibialis_activation, x(4), ...
    tibialis.norm_tendon_length(tibialis_length(x(1)), x(4)));

x_dot = [x1_dot, x2_dot, x3_dot, x4_dot]';



end