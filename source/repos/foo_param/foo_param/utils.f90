module utils
  implicit none
contains
  !> Validate the radius input
  !> @param radius The radius to be validated
  !> @return is_valid Logical indicating if the radius is valid
  function validate_radius(radius) result(is_valid)
    implicit none
    real(kind=8), intent(in) :: radius
    logical :: is_valid

    if (radius < 0.0) then
      print *, "Error: Radius cannot be negative"
      is_valid = .false.
    else
      is_valid = .true.
    end if
  end function validate_radius
end module utils