import dionysus as d
import numpy as np
import scipy.io

# The followings are input data
filename = "Point.txt" # input a point cloud dataset; 
data = np.genfromtxt(filename, delimiter=' ')
tK = 1; # threshold for simplicial complex K
tL = 1.5; # threshold for simplicial complex L
end = 1.5; # largest threshold for building the Vietoris-Rips complex
q = 2; # dimension for the persistent Laplacian

# Building a Vietoris-Rips complex
f = d.fill_rips(data, q+1, end)
print(f)

count = 0
for s in f:
    count = count + 1
print(count)
shape = (count,count)
Bw = np.zeros(shape, dtype=int)


if q == 0: # If q=0, returns only the 1-boundary matrix
    q1_column_index = []
    q1_row_index = []
    Kind = 0

    for s in f:
        ind = f.index(s)
        dim = s.dimension();
        if (dim == q + 1) and (s.data <= tL):
            q1_column_index.append(ind)
            sign = 1
            for sb in s.boundary():
                rind = f.index(sb)
                Bw[rind,ind] = sign
                sign = -1 * sign
        if (dim == q) and (s.data <= tL):
            q1_row_index.append(ind)
            if s.data <= tK:
                Kind = Kind + 1

    Bq1 = Bw[:,q1_column_index]
    Bq1 = Bq1[q1_row_index,:]
    print(Bq1.shape)
    print(Kind)
    mat = np.matrix(Bq1)
    scipy.io.savemat('q1Boundary.mat', mdict={'Bq1': mat}, do_compression=True)
else:    # If q>0, returns both the q-boundary matrix and the (q+1)-boundary matrix    
    q_column_index = []
    q_row_index = []
    q1_column_index = []
    q1_row_index = []
    Kind = 0

    for s in f:
        ind = f.index(s)
        dim = s.dimension();
        if (dim == q + 1) and (s.data <= tL):
            q1_column_index.append(ind)
            sign = 1
            for sb in s.boundary():
                rind = f.index(sb)
                Bw[rind,ind] = sign
                sign = -1 * sign
        if (dim == q) and (s.data <= tL):
            q1_row_index.append(ind)
            if s.data <= tK:
                q_column_index.append(ind)
                sign = 1
                for sb in s.boundary():
                    rind = f.index(sb)
                    Bw[rind,ind] = sign
                    sign = -1 * sign
                Kind = Kind + 1
        if (dim == q-1) and (s.data <= tK):
            q_row_index.append(ind)

    Bq1 = Bw[:,q1_column_index]
    Bq1 = Bq1[q1_row_index,:]    
    Bq = Bw[:,q_column_index]
    Bq = Bq[q_row_index,:]
    print(Bq.shape)
    print(Bq1.shape)
    print(Kind)
    mat = np.matrix(Bq)
    scipy.io.savemat('qBoundary.mat', mdict={'Bq': mat}, do_compression=True)
    mat = np.matrix(Bq1)
    scipy.io.savemat('q1Boundary.mat', mdict={'Bq1': mat}, do_compression=True)






