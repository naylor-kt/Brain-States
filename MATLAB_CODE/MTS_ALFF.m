% ALFF function 

function MTS_ALFF(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        error('Not enough input variables')
    elseif nargin<=3
        infile = varargin{1};
        operator = varargin{2};
        outfile = varargin{3};
   
         if strcmp(operator,'ALFF')
                RMTS = readmatrix (infile);
                ALFF = std(RMTS, 1);
                writematrix (ALFF, outfile)
         end

    elseif nargin<=4
        Rinfile = varargin{1};
        Winfile = varargin{2};
        operator = varargin{3};
        outfile = varargin{4};     
         
                
         if strcmp(operator,'fALFF')
                RMTS = readmatrix (Rinfile);
                ALFF = std(RMTS, 1);
                WMTS = readmatrix (Winfile);
                WSD = std(WMTS, 1);
                fALFF = (ALFF/WSD);
                writematrix (fALFF, outfile)
         end
         
    elseif nargin<=5
        Rinfile = varargin{1};
        Winfile = varargin{2};
        operator = varargin{3};
        Aoutfile = varargin{4};     
        Foutfile = varargin{5};  
         
        if strcmp(operator,'ALFF')
                RMTS = readmatrix (Rinfile);
                ALFF = std(RMTS, 1);
                writematrix (ALFF, Aoutfile)
         end
         
         if strcmp(operator,'fALFF')
                RMTS = readmatrix (Rinfile);
                ALFF = std(RMTS, 1);
                WMTS = readmatrix (Winfile);
                WSD = std(WMTS, 1);
                fALFF = (ALFF/WSD)
                writematrix (fALFF, Foutfile)
         end
    end 

