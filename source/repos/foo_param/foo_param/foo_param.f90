module foo_param
  implicit none
  private
  public :: calculate_volume

contains

  !> Calculate the volume of a sphere given its radius using the Foo et al. parameterization.
  !> @param radius The radius of the sphere
  !> @return The volume of the sphere
  function calculate_volume(radius) result(volume)
    real(kind=8), intent(in) :: radius
    real(kind=8) :: volume
    real(kind=8), parameter :: PI = 4*atan(1.0_8)

    volume = (4.0 / 3.0) * PI* radius**3
  end function calculate_volume

end module foo_param