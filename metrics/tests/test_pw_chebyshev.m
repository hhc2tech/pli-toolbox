classdef test_pw_chebyshev < mtest_case
    % Unit testing of pw_chebyshev
    
    properties
        dim
        X
        Y
    end
    
    methods
        
        function obj = test_pw_chebyshev(d, m, n)
            obj.dim = d;
            obj.X = rand(d, m);
            obj.Y = rand(d, n);            
        end
        
        function test_chebyshev(self)
            D0 = self.safe_dist(self.X, self.Y);
            D = pli_pw_chebyshev(self.X, self.Y);
            assert( mtest_is_approx(D, D0) );          
        end
        
        function test_chebyshev_selfpw(self)
            D0 = self.safe_dist(self.X, self.X);
            D = pli_pw_chebyshev(self.X);
            assert( mtest_is_approx(D, D0) );          
        end
    end
       
    
    methods(Static)
        
        function D = safe_dist(X, Y)
            
            m = size(X, 2);
            n = size(Y, 2);
            
            D = zeros(m, n);
            for j = 1 : n
                for i = 1 : m
                    D(i, j) = max(abs(X(:,i) - Y(:,j)));
                end
            end            
        end
        
    end
    
end