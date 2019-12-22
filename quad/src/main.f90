program main
  use module_gauss_legendre_quadrature
  implicit none

  integer :: i, ng

  real(16),allocatable :: gz(:), we(:)
  
  read(*,*) ng
  
  allocate(gz(ng),we(ng))

  call assemble_gauss(ng,gz,we)

  write(*,*) ng
  write(*,*) "i, node(i), weight(i)"
  do i=1,ng
     write(*,*) i, gz(i), we(i)
  end do
  
  deallocate(gz,we)

end program main
