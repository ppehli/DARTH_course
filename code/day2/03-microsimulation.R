# Day 2: Simple microsimulation example

set.seed(123)

n_patients <- 1000
n_cycles <- 20
states <- c("Healthy", "Sick", "Dead")

simulate_patient <- function(n_cycles) {
  state <- "Healthy"
  history <- character(n_cycles + 1)
  history[1] <- state

  for (cycle in 1:n_cycles) {
    if (state == "Healthy") {
      state <- sample(states, 1, prob = c(0.85, 0.10, 0.05))
    } else if (state == "Sick") {
      state <- sample(c("Sick", "Dead"), 1, prob = c(0.80, 0.20))
    } else {
      state <- "Dead"
    }
    history[cycle + 1] <- state
  }
  history
}

histories <- replicate(n_patients, simulate_patient(n_cycles))
head(t(histories))
