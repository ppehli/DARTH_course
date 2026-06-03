# Day 1: Simple decision tree example

strategy <- c("Usual care", "New intervention")
cost <- c(1000, 1800)
qalys <- c(0.75, 0.86)

results <- data.frame(strategy, cost, qalys)
results$incremental_cost <- results$cost - results$cost[1]
results$incremental_qalys <- results$qalys - results$qalys[1]
results$icer <- results$incremental_cost / results$incremental_qalys

print(results)
