function powerofncheck(var,n)

if ~all(factor(var) == n)    
  error('%s (%d) is not a power of %d',inputname(1),var,n);
end