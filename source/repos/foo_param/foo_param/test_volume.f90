program test_volume
  use foo_param
  use utils
  implicit none
  logical :: is_valid

  ! Test with a positive radius
  call assert_almost_equal(calculate_volume(1.0_8), 4.18, "Test 1")

  ! Test with zero radius
  call assert_almost_equal(calculate_volume(0.0_8), 0.0, "Test 2")

  ! Test with negative radius (should be invalid)
  is_valid = validate_radius(-1.0_8)
  if (is_valid) then
    print *, "Test 3 Failed"
  else
    print *, "Test 3 Passed"
  end if

contains
  subroutine assert_almost_equal(actual, expected, test_name)
    real(kind=8), intent(in) :: actual, expected
    character(len=*), intent(in) :: test_name
    real(kind=8), parameter :: tol = 1.0e-5

    if (abs(actual - expected) < tol) then
      print *, test_name, "Passed"
    else
      print *, test_name, "Failed"
    end if
  end subroutine assert_almost_equal

end program test_volume