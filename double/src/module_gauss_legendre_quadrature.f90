module module_gauss_legendre_quadrature
  implicit none

  private
  public assemble_gauss

contains
  !> ガウス積分の分点と重み
  !! \param ng 分点の数
  !! \param gz 分点の座標
  !! \param we 重み
  subroutine assemble_gauss(n,gz,we)
    integer,intent(in) :: n
    real(8),intent(out) :: gz(n), we(n)

    !> 対称三重対角行列の対角成分
    real(8) :: td(n)

    !> 対称三重対角行列の非対角成分
    real(8) :: tl(n-1)

    !> 固有ベクトル
    complex(8) :: q(n,n)
    
    integer :: i, info
    real(8) :: work(2*n-2)
    
    td(:)=0.d0
    do i=1,n-1
       tl(i)=dble(i)/sqrt((2.d0*i-1.0d0)*(2.0*i+1.d0))
    end do

    q(:,:)=cmplx(0.d0,0.d0,kind(1.d0))
    do i=1,n
       q(i,i)=cmplx(1.d0,0.d0,kind(1.d0))
    end do

    call zsteqr("V",n,td,tl,q,n,work,info)

    do i=1,n
       gz(i)=td(i)
       we(i)=2.d0*(real(q(1,i))**2+aimag(q(1,i))**2)
    end do
    
  end subroutine assemble_gauss
  
end module module_gauss_legendre_quadrature
  
