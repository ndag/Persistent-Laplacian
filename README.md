The algorithm implemented in this repo was developed by [Facundo Memoli](https://people.math.osu.edu/memolitechera.1/), [Zhengchao Wan](https://math.osu.edu/people/wan.252-0) and [Yusu Wang](http://yusu.belkin-wang.org) in the paper https://arxiv.org/abs/2012.02808.

implementation of idea in ...

# persistent-Laplacian
## persistLap.m
**persistLap.m** is a Matlab implementation of the q-th persistent Laplacian of a simplicial pair via the Schur complement formulation.

**Syntax:**
```
% persistLap - computes the q-th (up) persistent Laplacian of a simplicial pair K in L
%
% [pL,upL] = persistLap(B1,B2,Gind)
%
%	B1 - the (q+1)-th boundary matrix of the large complex L
%	B2 - the q-th boundary matrix of the small complex K
%	Gind - index set of q-simplices of K in the set of q-simplices of L
%
% Returns:
%	pL - q-th persistent Laplacian
%	upL - q-th up persistent Laplacian
```

## example.m
**example.m** is an example computing the 0-, 1- and 2-persistent Laplacians for a simplicial pair coming from the Vietoris-Rips complex of a 35-point point cloud randomly generated from a circle. 

![output](https://github.com/ZhengchaoW/persistent-Laplacian/blob/main/points.jpg?raw=true)
