# Assignment 3:- Collective Communications

## Getting started with MPI
1. the print out of `mpiexec -n 16 ./mpi_hello_world.x` is
```shell
Hello world from processor ece003.ece.local.cmu.edu, rank 1 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 3 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 4 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 6 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 0 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 10 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 15 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 7 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 5 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 8 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 12 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 14 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 2 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 9 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 11 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 13 out of 16 processors
```
2. the print out of `mpiexec -n 16 -f host_names ./mpi_hello_world.x` is
```shell
 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/


 ## This host uses ANDREW.CMU.EDU login credentials ##

https://www.cmu.edu/computing/services/security/identity-access/account/andrewaccount.html
https://userguide.its.cit.cmu.edu/news/ece-clusters-to-use-andrew-cmu-edu-authentication/

Hello world from processor ece004.ece.local.cmu.edu, rank 4 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 3 out of 16 processors
Hello world from processor ece003.ece.local.cmu.edu, rank 11 out of 16 processors
Hello world from processor ece006.ece.local.cmu.edu, rank 6 out of 16 processors
Hello world from processor ece000.ece.local.cmu.edu, rank 0 out of 16 processors
Hello world from processor ece002.ece.local.cmu.edu, rank 2 out of 16 processors
Hello world from processor ece006.ece.local.cmu.edu, rank 14 out of 16 processors
Hello world from processor ece005.ece.local.cmu.edu, rank 5 out of 16 processors
Hello world from processor ece004.ece.local.cmu.edu, rank 12 out of 16 processors
Hello world from processor ece001.ece.local.cmu.edu, rank 9 out of 16 processors
Hello world from processor ece000.ece.local.cmu.edu, rank 8 out of 16 processors
Hello world from processor ece002.ece.local.cmu.edu, rank 10 out of 16 processors
Hello world from processor ece005.ece.local.cmu.edu, rank 13 out of 16 processors
Hello world from processor ece001.ece.local.cmu.edu, rank 1 out of 16 processors
Hello world from processor ece007.ece.local.cmu.edu, rank 15 out of 16 processors
Hello world from processor ece007.ece.local.cmu.edu, rank 7 out of 16 processors
```

## Cost of Collectives

1. For short vector we can use MST algorithm to reduce the alpha term. 
2. For long vector we can use bucket algorithm to reduce the amount of data transferred per round per node. We could choose reduce-scatter + allgather. Since they are dual of each other, they hae the same cost. For reduce-scatter, each node send and receive n / p data and it takes p - 1 round of commnication, so the cost is (p - 1) * alpha + (p - 1) / p * beta. 

