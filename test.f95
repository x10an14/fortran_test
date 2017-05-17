! Test program

program MAIN

  integer :: nargs, counter
  character(256) :: input_arg_buffer
  character(:), allocatable :: input_arg
  character(:), allocatable :: input_file
  character(:), allocatable :: output_file
  character(:), allocatable ::cols_to_keep
  ! character(:), allocatable ::rows_to_keep

  ! Loop over command line arguments:
  counter = 1
  nargs = command_argument_count()
  do while (counter < nargs)
    ! write(*,*)"Loop iteration: ", counter
    call get_command_argument(counter, input_arg_buffer)
    input_arg = adjustl(trim(input_arg_buffer))

    ! Debug statement to be removed
    ! write(*,*)"input_arg: '", input_arg, "'"

    ! Switch for parsing input
    select case(input_arg)
      ! Input file case:
      case("-i")
        counter = counter + 1
        call get_command_argument(counter, input_arg_buffer)
        input_file = adjustl(trim(input_arg_buffer))
        write(*,*)"The input file given was: '", input_file, "'"

      ! Output file case:
      case("-o")
        counter = counter + 1
        call get_command_argument(counter, input_arg_buffer)
        output_file = adjustl(trim(input_arg_buffer))
        write(*,*)"The output file given was: '", output_file, "'"

      ! Coloumns to keep case:
      case("-s")
        counter = counter + 1
        call get_command_argument(counter, input_arg_buffer)
        cols_to_keep = adjustl(trim(input_arg_buffer))
        write(*,*)"The output file given was: '", cols_to_keep, "'"

      ! Rows to keep case:
      ! case("-w")
      !   counter = counter + 1
      !   call get_command_argument(counter, input_arg_buffer)
      !   rows_to_keep = adjustl(trim(input_arg_buffer))
      !   write(*,*)"The output file given was: '", rows_to_keep, "'"


      case default
        ! Default case if none of the above match...
        write(*,*)"Option '", adjustl(trim(input_arg)), "' not recognized."
    end select

    counter = counter + 1
  end do

end program MAIN
