function fsmeanALFF(varargin)

if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        error('Not enough input variables')
    elseif nargin<=3
        infile = varargin{1};
        operator = varargin{2};
        outfile = varargin{3};

        mri = MRIread(infile);

        if strcmp(operator,'mean')
            mri.vol(mri.vol == 0) = NaN;
            mean_val = mean(mri.vol, "omitnan");
            writematrix(mean_val, outfile) 
        end
end



