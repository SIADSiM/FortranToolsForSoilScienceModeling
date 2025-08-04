!> @brief Provides simplified soil erosion estimate using USLE factors.
!> @author Jules
!> @date 2025-08-04
!> @version 1.0
!> @reference Wischmeier, W.H., & Smith, D.D. (1978).
!>            Predicting rainfall erosion losses. USDA Agriculture Handbook 537.
module SoilErosionEstimate_mod
  use kind_mod, only: dp
  implicit none
  private
  public :: SoilErosionEstimate

contains

  !> @brief Estimates average annual soil loss using the USLE.
  !> @param[in] R Rainfall-runoff erosivity factor.
  !> @param[in] K Soil erodibility factor.
  !> @param[in] LS Topographic factor (slope length and steepness).
  !> @param[in] C Cover-management factor.
  !> @param[in] P Support practice factor.
  !> @param[out] soil_loss Average annual soil loss (t/ha/yr).
  subroutine SoilErosionEstimate(R, K, LS, C, P, soil_loss)
    real(kind=dp), intent(in) :: R
    real(kind=dp), intent(in) :: K
    real(kind=dp), intent(in) :: LS
    real(kind=dp), intent(in) :: C
    real(kind=dp), intent(in) :: P
    real(kind=dp), intent(out) :: soil_loss

    ! USLE Equation: A = R * K * LS * C * P
    soil_loss = R * K * LS * C * P

  end subroutine SoilErosionEstimate

end module SoilErosionEstimate_mod
