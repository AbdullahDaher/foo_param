program main
  use foo_param
  use utils
  implicit none
  real(kind=8) :: radius, volume
  character(len=1) :: choice
  logical :: is_valid

  do
    print *, "Enter the radius of the sphere:"
    read *, radius

    is_valid = validate_radius(radius)
    if (.not. is_valid) exit

    volume = calculate_volume(radius)
    print *, "The volume of the sphere with radius", radius  ,"is : ", volume

    print *, "Do you want to calculate another volume? (y/n)"
    read *, choice
    if (choice /= 'y' .and. choice /= 'Y') exit
  end do

end program main