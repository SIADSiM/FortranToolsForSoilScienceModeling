!> @brief Computes soil bulk density from particle density and porosity.
!> @author Jules
!> @date 2025-08-04
!> @version 1.0
!> @reference Hillel, D. (1998). Environmental Soil Physics. Academic Press.
module BulkDensityCalc_mod
  use kind_mod, only: dp
  implicit none
  private
  public :: BulkDensityCalc

contains

  !> @brief Calculates soil bulk density.
  !> @param[in] particle_density Soil particle density (kg/m3).
  !> @param[in] porosity Soil porosity (m3/m3).
  !> @param[out] bulk_density Soil bulk density (kg/m3).
  subroutine BulkDensityCalc(particle_density, porosity, bulk_density)
    real(kind=dp), intent(in) :: particle_density
    real(kind=dp), intent(in) :: porosity
    real(kind=dp), intent(out) :: bulk_density

    ! Bulk Density = Particle Density * (1 - Porosity)
    bulk_density = particle_density * (1.0_dp - porosity)

  end subroutine BulkDensityCalc

end module BulkDensityCalc_mod
