function err = SRM(c, n)
    w = repmat(1:n, [n, 1]);
    x = kms_sqrtm(c, n).^2 .* (w - w.').^2;
    err = sum(x, "all")/n;
end


function A = kms_sqrtm(p, n)

    %fuctions handler
    eigenv  = @(x) (1 - p^2) ./ (1 - 2 * p * cos(x) + p^2);
    nu      = @(x) 2 * atan(p * sin(x) ./ (1 - p * cos(x)));

    %initialize vectors & matrix
    ei = zeros(1,n);
    V = zeros(n);
    v = (1:n);

    %calculate eigenvalues
    for j = v
        % finding ceros
        b = @(x) (n+1) * x + nu(x) - j*pi;
        x = fzero(b,[(j-1)*pi/(n+1), j*pi/(n+1)]);
        
        % calculating eigenvectors and eigenvalues
        ei(j)     = eigenv(x);
        aux = sin((v .* j * pi)/(n + 1) + (0.5 - v ./(n+1)) * nu(x)).';
        V(:, j)  = aux ./ sqrt(sum(aux.^2));
    end

    D = sqrt(ei);
    ind = (fix(n/2) + 1);
    As = (D .* V(1:ind,:)) * transpose(V); 
    A = [As; As(n-ind:-1:1, end:-1:1)];
end