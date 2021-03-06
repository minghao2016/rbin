#' Create dummy variables
#'
#' Create dummy variables from bins.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param predictor Variable for which dummy variables must be created.
#' @param bins An object of class \code{rbin_manual} or \code{rbin_quantiles} or \code{rbin_equal_length} or \code{rbin_winsorized}.
#'
#' @return \code{data} with dummy variables.
#'
#' @examples
#' k <- rbin_manual(mbank, y, age, c(29, 39, 56))
#' rbin_create(mbank, age, k)
#'
#' @export
#'
rbin_create <- function(data, predictor, bins) {

  pred <- deparse(substitute(predictor))
  data2 <- data[pred]
  colnames(data2) <- c("predictor")

  l_freq <- bins$lower_cut
  u_freq <- bins$upper_cut
  bin_na <- sum(is.na(bins$bins$bin))
  lbins  <- length(bins$bins$bin) - bin_na

  data2$binned <- NA
  dummy_names <- bins$bins$cut_point

  for (i in seq_len(lbins)) {
    data2$binned[data2$predictor >= l_freq[i] & data2$predictor < u_freq[i]] <-
      dummy_names[i]
  }

  data2$binned <- as.factor(data2$binned)
  result <- rbin_factor_create(data2, binned)
  result[c('predictor', 'binned')] <- NULL
  bin_names <- f_bin(u_freq)
  sym_sign  <- c(rep("_<_", (lbins - 1)), "_>=_")
  colnames(result) <- paste0(rep(pred, (lbins - 1)), sym_sign, bin_names)
  cbind(data, result)

}

