function fsmaths(varargin)

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

        if strcmp(operator,'bin')
            mri.vol = mri.vol>0;
        elseif strcmp(operator,'binv')
            mri.vol = ~(mri.vol>0);
        elseif strcmp(operator,'Tmean')
            mri.vol = mean(mri.vol,4);
            mri.nframes = 1;
        elseif strcmp(operator,'Tmaxn')
            [~,mri.vol] = max(mri.vol,[],4);
            mri.nframes = 1;
        elseif strcmp(operator,'recip')
            mri.vol = 1./mri.vol;
        elseif strcmp(operator,'sqr')
            mri.vol = mri.vol.^2;
        elseif strcmp(operator,'STD')
            mri.vol = std(mri.vol,0,4);
            mri.nframes = 1;
        else % exp, log, sin, cos, tan, atan, abs;
            eval(sprintf('mri.vol = %s(mri.vol);',operator))
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

        switch(operator)
            case('add')
                mri.vol = mri.vol+operand;
            case('sub')
                mri.vol = mri.vol-operand;
            case('mul')
                mri.vol = mri.vol.*operand;
            case('div')
                mri.vol = mri.vol./operand;
            case('rem')
                mri.vol = mod(mri.vol,operand);
            case('thr')
                mri.vol(mri.vol<operand) = 0;
            case('uthr')
                mri.vol(mri.vol>operand) = 0;
            case('max')
                mri.vol = max(mri.vol,operand);
            case('min')
                mri.vol = min(mri.vol,operand);
            case('mas')
                mri.vol = mri.vol.*operand;
        end   

        MRIwrite(mri,fullfile(outpth,[outnam '.' outext]));
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






        
        
        
        
