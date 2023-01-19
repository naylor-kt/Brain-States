% ALFF function 
function fs_ALFF(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        infile = varargin{1};
        outfile = varargin{2};
        eval(sprintf('!imcp %s %s',infile,outfile))
    elseif nargin<=3
        infile = varargin{1};
        operator = varargin{2};
        outfile = varargin{3};

        [inpth,innam,inext] = ffileparts(infile);
        if isempty(inext)
            inext = 'mgz'; 
        elseif ~any(strcmp(inext,{'mgh' 'mgz'}))
            error('Input file must be either .mgh or .mgz')            
        end
        mri = MRIread(fullfile(inpth,[innam '.' inext]));

        [outpth,outnam] = ffileparts(outfile); outext = 'mgz';

        if strcmp(operator,'STD')
            mri.vol = std(mri.vol,1,4);
            mri.nframes = 1;
        elseif ~any(strcmp(operator,{'STD'}))
             error('Invalid Operator')     
        end

        MRIwrite(mri,fullfile(outpth,[outnam '.' outext]));
    elseif nargin<=4
        infile = varargin{1};
        operator = varargin{2};
        operand = varargin{3}; 
        outfile = varargin{4};

        [inpth,innam,inext] = ffileparts(infile);
        if isempty(inext)
            inext = 'mgz'; 
        elseif ~any(strcmp(inext,{'mgh' 'mgz'}))
            error('Input file must be either .mgh or .mgz')            
        end
        mri = MRIread(fullfile(inpth,[innam '.' inext]));

        if ischar(operand)
            [oppth,opnam,opext] = ffileparts(operand);
            if isempty(opext)
                opext = 'mgz'; 
            elseif ~any(strcmp(opext,{'mgh' 'mgz'}))
                error('Operand file must be either .mgh or .mgz')            
            end
            tmp = MRIread(fullfile(oppth,[opnam '.' opext]));
            operand = tmp.vol; clear tmp
        end
        [outpth,outnam] = ffileparts(outfile); outext = 'mgz';        
    end
end

function [pth,nam,ext] = ffileparts(file)
        
    idx = strfind(file,filesep);

    if ~isempty(idx)
        pth = file(1:idx(end)-1);
        file = file(idx(end)+1:end);
    else
        pth = '';
    end

    idx = strfind(file,'.');
    if ~isempty(idx)
        nam = file(1:idx(end)-1);
        ext = file(idx(end)+1:end);
    else
        nam = file;
        ext = '';
    end
end






        
        
        
        
