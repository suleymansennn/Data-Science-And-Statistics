x=matrix(c(11,12,13,14),nrow=2,ncol=2,byrow=T)


#Matrislerde se�im
x=matrix(c(11,12,22,34,45,56,67,88),nrow=2,ncol=4,byrow=T)
x

#[1,] sat�r [,1] s�tun [1,1]

x[1,1]
x[2,4]
x[2,5]

#Matris par�alar� se�me
x[c(1,2),c(2,3,4)]
class(x[c(1,2),c(2,4)])

x[1:2,2:4]