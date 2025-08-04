!> @brief Defines kinds for floating point numbers.
!> @author Jules
!> @date 2025-08-04
module kind_mod
  implicit none
  ! Define a kind for double precision floating point numbers
  ! p=15 gives at least 15 decimal digits of precision
  ! r=307 gives a range of at least 10^-307 to 10^+307
  integer, parameter :: dp = selected_real_kind(p=15, r=307)
end module kind_mod
