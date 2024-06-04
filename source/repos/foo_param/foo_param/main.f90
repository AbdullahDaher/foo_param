program main
  use foo_param
  use utils
  implicit none

  integer :: choice

  do
    print *, "Select mode: 1 for main program, 2 for test"
    read *, choice

    if (choice == 1) then
      call run_main()
      exit
    else if (choice == 2) then
      call run_tests()
    else
      print *, "Invalid choice"
    end if
  end do

contains

  subroutine run_main()
    real(kind=8) :: radius, volume
    character(len=1) :: cont
    logical :: is_valid

    do
      print *, "Enter the radius of the sphere:"
      read *, radius

      is_valid = validate_radius(radius)
      if (.not. is_valid) exit

      volume = calculate_volume(radius)
      print *, "The volume of the sphere with radius", radius, "is:", volume

      print *, "Do you want to calculate another volume? (y/n)"
      read *, cont
      if (cont /= 'y' .and. cont /= 'Y') exit
    end do
  end subroutine run_main

  subroutine run_tests()
    logical :: cont
    character(len=1) :: cont_char

    do
      call test_volume()

      print *, "Do you want to run the tests again? (y/n)"
      read *, cont_char
      if (cont_char /= 'y' .and. cont_char /= 'Y') then
        cont = .false.
        exit
      else
        cont = .true.
      end if
    end do

    print *, "Do you want to go to the main program? (y/n)"
    read *, cont_char
    if (cont_char == 'y' .or. cont_char == 'Y') then
      call run_main()
    end if
  end subroutine run_tests

end program main