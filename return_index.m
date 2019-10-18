function index = return_index(array,pos)
array = abs(array -pos);
[M,index] = min(array);
end