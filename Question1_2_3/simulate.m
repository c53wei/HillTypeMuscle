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

    function [output] = get_velocity_from_time(T, lm)
        lt = muscle.norm_tendon_length(L, lm);
        if T < 0.5
            output = get_velocity(0, lm, lt);
        else
            output = get_velocity(1, lm, lt);
        end
    end

%%% TASK 3
% the outputs of ode45 must be named "time" and "norm_lm"

options = odeset('RelTol',RelTol,'AbsTol',AbsTol);
[time,norm_lm] = ode45(@get_velocity_from_time, [0 T], 1, options);

%%% TASK 4
% save the estimated forces in a vector called "forces"

[forces] = muscle.get_force(L, norm_lm);

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