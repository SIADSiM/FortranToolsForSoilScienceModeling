!> @brief Estimates soil water retention curve using the van Genuchten equation.
!> @author Jules
!> @date 2025-08-04
!> @version 1.0
!> @reference van Genuchten, M.T. (1980).
!>            A closed-form equation for predicting the hydraulic conductivity of unsaturated soils.
!>            Soil Science Society of America Journal, 44(5), 892-898.
module SoilWaterRetention_mod
  use kind_mod, only: dp
  implicit none
  private
  public :: SoilWaterRetention

contains

  !> @brief Calculates volumetric water content from pressure head.
  !> @param[in] pressure_head Soil water pressure head (m, negative for unsaturated).
  !> @param[in] theta_r Residual water content (m3/m3).
  !> @param[in] theta_s Saturated water content (m3/m3).
  !> @param[in] alpha Van Genuchten parameter alpha (1/m).
  !> @param[in] n Van Genuchten parameter n (-).
  !> @param[out] water_content Volumetric water content (m3/m3).
  subroutine SoilWaterRetention(pressure_head, theta_r, theta_s, alpha, n, water_content)
    real(kind=dp), intent(in) :: pressure_head
    real(kind=dp), intent(in) :: theta_r
    real(kind=dp), intent(in) :: theta_s
    real(kind=dp), intent(in) :: alpha
    real(kind=dp), intent(in) :: n
    real(kind=dp), intent(out) :: water_content

    real(kind=dp) :: m
    real(kind=dp) :: term, base
    real(kind=dp) :: denominator

    if (pressure_head >= 0.0_dp) then
        water_content = theta_s
        return
    end if

    m = 1.0_dp - (1.0_dp / n)

    base = alpha * abs(pressure_head)

    if (base > 0.0_dp) then
        term = exp(n * log(base))
    else
        term = 0.0_dp
    end if

    denominator = 1.0_dp + term
    water_content = theta_r + (theta_s - theta_r) / exp(m * log(denominator))

  end subroutine SoilWaterRetention

end module SoilWaterRetention_mod
