function err = SRM_sim(c, n)
    list     = @(c, n) [c.^(0:n) c.^fliplr(1:n-1)]; 
    sqrtfftm = @(c, n) ifft(sqrt(fft(list(c,n))));
    lg = [(0:n) fliplr(1:n-1)];
    err = sum(sqrtfftm(c, n).^2 .* lg.^2);
end