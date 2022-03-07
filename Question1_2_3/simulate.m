function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

%%% TASK 1
muscle = HillTypeMuscle(f0M, resting_length_muscle, resting_length_tendon);
L = resting_length_tendon + resting_length_muscle;

%%% TASK 2

% nested function
    function [output] = get_velocity_from_time(t, lm)
        lt = muscle.norm_tendon_length(L, lm);
		if t < 0.5
            output = get_velocity(0, lm, lt);
        else
            output = get_velocity(1, lm, lt);
        end
    end

options = odeset('RelTol',RelTol,'AbsTol',AbsTol);
[time,lm] = ode45(@get_velocity_from_time, [0 2], 1, options);

m_force = muscle.get_force(L, lm);


%%% TASK 3
% the outputs of ode45 must be named "time" and "norm_lm"

%%% TASK 4
% save the estimated forces in a vector called "forces"

% Do not alter the rest (it should not be needed)
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end