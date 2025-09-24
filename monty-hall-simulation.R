# Usage from terminal:
#   Rscript monty-hall-simulation.R [num_trials] [seed]
# Examples:
#   Rscript monty-hall-simulation.R
#   Rscript monty-hall-simulation.R 100000 42

simulate_monty_hall <- function(num_trials = 100000, random_seed = NULL) {
  if (!is.null(random_seed)) {
    set.seed(as.integer(random_seed))
  }

  # Randomly place prize and contestant's initial pick
  prize_door_by_trial <- sample.int(3, num_trials, replace = TRUE)
  initial_pick_by_trial <- sample.int(3, num_trials, replace = TRUE)

  # Staying wins iff initial pick is the prize
  stay_wins_logical <- initial_pick_by_trial == prize_door_by_trial
  switch_wins_logical <- !stay_wins_logical  # In classic Monty Hall, switching wins exactly when staying loses

  stay_win_rate <- mean(stay_wins_logical)
  switch_win_rate <- mean(switch_wins_logical)

  list(
    trials = num_trials,
    stay_win_rate = stay_win_rate,
    switch_win_rate = switch_win_rate
  )
}

print_results <- function(result) {
  cat(sprintf("Trials: %d\n", result$trials))
  cat(sprintf("Stay win rate:   %.4f\n", result$stay_win_rate))
  cat(sprintf("Switch win rate: %.4f\n", result$switch_win_rate))

  # Simple verification message
  if (result$switch_win_rate > result$stay_win_rate) {
    cat("\nSwitching performs better than staying, as expected.\n")
  } else {
    cat("\nUnexpected result: staying performed as well as or better than switching.\n")
  }

  # For sufficiently large trials, switching should be near 2/3
  if (result$trials >= 10000) {
    difference_from_two_thirds <- abs(result$switch_win_rate - (2/3))
    cat(sprintf("Difference from 2/3 for switching: %.4f\n", difference_from_two_thirds))
  }
}

run_cli <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  num_trials <- if (length(args) >= 1) as.integer(args[[1]]) else 100000
  random_seed <- if (length(args) >= 2) as.integer(args[[2]]) else NULL

  if (is.na(num_trials) || num_trials <= 0) {
    stop("num_trials must be a positive integer")
  }

  result <- simulate_monty_hall(num_trials = num_trials, random_seed = random_seed)
  print_results(result)

  invisible(result)
}

# Execute when run as a script
if (sys.nframe() == 0) {
  run_cli()
}


