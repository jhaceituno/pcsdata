% Octave/Matlab function 'obstacle_gen'
% Produces a noisy uniformly accelerated linear trajectory for an obstacle,
% such that it always begins on a random point of the edge of the working
% space, and it always passes through its center.
% velocity:     desired linear velocity of the obstacle towards the center
% acceleration: desired linear acceleration of the obstacle towards the center
% ws_size:      number of cells per side of the working space
% steps:        size of the observation time window
% noise:        maximum variation of the resulting trajectory
function obstacle = obstacle_gen(velocity,acceleration,ws_size,steps,noise)
  alpha    = rand*2*pi;
  rotation = [cos(alpha) sin(alpha)]
  position = -ws_size*.5
  time     = (-steps+1:0)';
  obstacle = ws_size*.5 + noise*(2*rand(steps,2)-.5) \
           + (position+(velocity+.5*acceleration*time).*time)*rotation
end
