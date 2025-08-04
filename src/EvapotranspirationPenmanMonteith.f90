!> @brief Calculates reference evapotranspiration via FAO-56 Penman-Monteith.
!> @author Jules
!> @date 2025-08-04
!> @version 1.0
!> @reference Allen, R.G., Pereira, L.S., Raes, D., & Smith, M. (1998).
!>            Crop Evapotranspiration — Guidelines for computing crop water requirements.
!>            FAO Irrigation and Drainage Paper 56.
module EvapotranspirationPenmanMonteith_mod
  use kind_mod, only: dp
  implicit none
  private
  public :: EvapotranspirationPenmanMonteith

contains

  !> @brief Calculates reference evapotranspiration (ET_0).
  !> @param[in] net_radiation Net radiation at the crop surface (MJ/m2/day).
  !> @param[in] air_temp Mean daily air temperature (C).
  !> @param[in] wind_speed Wind speed at 2m height (m/s).
  !> @param[in] saturation_vapor_pressure Saturation vapor pressure (kPa).
  !> @param[in] actual_vapor_pressure Actual vapor pressure (kPa).
  !> @param[in] psy_const Psychrometric constant (kPa/C).
  !> @param[in] delta_svp Slope of saturation vapor pressure curve (kPa/C).
  !> @param[out] et0 Reference evapotranspiration (mm/day).
  subroutine EvapotranspirationPenmanMonteith(net_radiation, air_temp, wind_speed, &
                                              saturation_vapor_pressure, actual_vapor_pressure, &
                                              psy_const, delta_svp, et0)
    real(kind=dp), intent(in) :: net_radiation
    real(kind=dp), intent(in) :: air_temp
    real(kind=dp), intent(in) :: wind_speed
    real(kind=dp), intent(in) :: saturation_vapor_pressure
    real(kind=dp), intent(in) :: actual_vapor_pressure
    real(kind=dp), intent(in) :: psy_const
    real(kind=dp), intent(in) :: delta_svp
    real(kind=dp), intent(out) :: et0

    real(kind=dp) :: vapor_pressure_deficit

    vapor_pressure_deficit = saturation_vapor_pressure - actual_vapor_pressure

    ! Placeholder for implementation of the Penman-Monteith equation.
    et0 = 0.0_dp

  end subroutine EvapotranspirationPenmanMonteith

end module EvapotranspirationPenmanMonteith_mod
