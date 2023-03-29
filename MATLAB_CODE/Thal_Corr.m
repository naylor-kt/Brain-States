% ALFF function 

function Thal_Corr(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        error('Not enough input variables')
    elseif nargin<=3
        error('Not enough input variables')
    elseif nargin<=4
        infile = varargin{1};
        infile_thal = varargin{2};
        operator = varargin{3};
        outfile = varargin{4};
   
         if strcmp(operator,'corr')
                MTS = readmatrix (infile);
                MTS_thal = readmatrix (infile_thal);
                correlation = corr(MTS, MTS_thal);
                writematrix (correlation, outfile)
         end
    end 


  