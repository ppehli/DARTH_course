# Day 1: Cohort Markov model example

states <- c("Healthy", "Sick", "Dead")
n_cycles <- 20

transition_matrix <- matrix(
  c(0.85, 0.10, 0.05,
    0.00, 0.80, 0.20,
    0.00, 0.00, 1.00),
  nrow = 3,
  byrow = TRUE,
  dimnames = list(states, states)
)

state_trace <- matrix(NA, nrow = n_cycles + 1, ncol = length(states),
                      dimnames = list(0:n_cycles, states))
state_trace[1, ] <- c(1, 0, 0)

for (cycle in 1:n_cycles) {
  state_trace[cycle + 1, ] <- state_trace[cycle, ] %*% transition_matrix
}

costs <- c(Healthy = 500, Sick = 2000, Dead = 0)
utilities <- c(Healthy = 0.90, Sick = 0.60, Dead = 0)

total_costs <- sum(state_trace[-1, ] %*% costs)
total_qalys <- sum(state_trace[-1, ] %*% utilities)

print(state_trace)
print(total_costs)
print(total_qalys)
