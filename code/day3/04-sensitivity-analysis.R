# Day 3: Simple deterministic and probabilistic sensitivity analysis

base_cost <- 1800
base_qaly <- 0.86
comparator_cost <- 1000
comparator_qaly <- 0.75

icer <- (base_cost - comparator_cost) / (base_qaly - comparator_qaly)
print(icer)

# One-way sensitivity analysis on intervention cost
cost_range <- seq(1200, 2500, by = 100)
oway <- data.frame(
  intervention_cost = cost_range,
  icer = (cost_range - comparator_cost) / (base_qaly - comparator_qaly)
)
print(oway)

# Probabilistic sensitivity analysis
set.seed(123)
n_sim <- 1000
psa <- data.frame(
  cost_new = rnorm(n_sim, mean = 1800, sd = 200),
  qaly_new = rbeta(n_sim, shape1 = 86, shape2 = 14),
  cost_old = rnorm(n_sim, mean = 1000, sd = 100),
  qaly_old = rbeta(n_sim, shape1 = 75, shape2 = 25)
)

psa$inc_cost <- psa$cost_new - psa$cost_old
psa$inc_qaly <- psa$qaly_new - psa$qaly_old
psa$icer <- psa$inc_cost / psa$inc_qaly
summary(psa)
