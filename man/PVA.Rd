% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PVA.R
\name{PVA}
\alias{PVA}
\title{Using imported population and control parameters, run a population viability analysis (PVA) on the target species.}
\usage{
PVA(
  params,
  custom_inits = NULL,
  sens_percent = NULL,
  sens_params = NULL,
  create_plot = FALSE,
  set_plot_y = NULL,
  quiet = FALSE
)
}
\arguments{
\item{params}{A list of initialized population and control parameters to inform the PVA. Parameters should be provided in the form of a named list. We suggest filling in a parameter template, which can be created and loaded using the \code{pva_template()} and \code{load_pva_parameters()} functions.}

\item{custom_inits}{(Optional, invoked by the `rank_uncertainty` function) A vector containing the names of which parameters, if any, should differ from the values provided in \code{pvA_params}. Should be a named list_ Can be be outputs of the \code{init()} function from \code{PVAInvas}.}

\item{sens_percent}{(Optional, invoked by the `rank_uncertainty` function) For the sake of sensitivity analysis, how much should population parameters (i.e. \code{}, \code{}, \code{}, \code{}, \code{}, \code{}, \code{})}

\item{create_plot}{(Optional) Should a ggplot heatmap object also be provided? Default: false. Will return a list with the final entry being the created plot.}
}
\value{
pva
* A named list of PVA outputs, including calculated parameters (from init())
  and outputs of the PVA_
* Calculated outputs from init():
 - `phie`: unfished eggs per recruit at equilibrium,
 - `R_A`: stage-independent maximum survival (alpha parameter of Beverton-Holt recruitment),
 - `R_B`: stage-independent carrying capacity (beta parameter of Beverton-Holt recruitment),
 - `A_s`: stanza-specific maximum survival (alpha parameter of Beverton-Holt recruitment),
 - `B_s`: stanza-specifc carrying capacity (beta parameter of Beverton-Holt recruitment).

* Objects created from PVA simulations
 - `Nt`: 3-dimensional abundance array (dimensions: time-steps, ages, simulations),
 - `Et`: matrix of eggs for each timestep for each year in each simulation,
 - `nest`: !!!!!!!!!!!! estimated numbers for each year in each simulation,
 - `Vfin`: vector of abundance in the final year across simulations,
 - `p_extinct`: vector of proportion of erdicated in each time step,
 - `p_extinct_50`: proportion of simulations where the population is eradicated by the 50th time step,
 - `p_extinct_100`: proportion of simulations where the population is eradicated by the 100th time step,
 - `p_extinct_200`: proportion of simulations where the population is eradicated by the 200th time step,
 - `t_extinct`: minimum number of timesteps needed for eradiction,
 - `yext_seq`:
 - `cost_1`: annual cost of sampling,
 - `cost_T`: total cost of sampling (up to the end of simulation or until 100% eradication),
 - `NPV`: net present value of sampling (taking into account intergenerational discounting),
 - `E_NPV`: expected mean present value (mean of NPV)
 - `NT`: abundance in the final time-step (reported as 5th percentile, mean, and 95 percentile of distributions),
 - `runtime`: time to execute the PVA,
 - `plot`: (Optional) if `create_plot=TRUE`, `plot` is returned as a ggplot object with multiple components. Created by the function `vwReg2.R`.
}
\description{
Using imported population and control parameters, run a population viability analysis (PVA) on the target species.
}
\examples{
# Run a simple PVA, no custom values or sensitivity testing.
pva(pva_params = inputParameterList)
}
