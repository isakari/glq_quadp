program main
  use module_gauss_legendre_quadrature
  implicit none

  integer :: ng

  real(8),allocatable :: gz(:), we(:)
  
  ng=10
  
  allocate(gz(ng),we(ng))

  call assemble_gauss(ng,gz,we)
  write(*,*) ng
  write(*,*) gz
  write(*,*) we
  
  deallocate(gz,we)

end program main
