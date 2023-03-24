function stat_test(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        infile = varargin{1};
        operator = varargin{2};
    
        [inpth,innam,inext] = ffileparts(infile);

            if strcmp(operator, 'ANOVA')
                % Read in the text file from the ALFF/fALFF/ReHo values
                TestStat = readmatrix (infile);

                % Remove the first column (which contains all NaNs)
                TestStat(:,1) = [] ;

                % Check whether the ALFF values are normally distributed 
                kstest_as_TestStat = kstest(TestStat(:,1));
                kstest_ns_TestStat = kstest(TestStat(:,2));
                kstest_vs_TestStat = kstest(TestStat(:,3));

                if (kstest_as_TestStat == 0) && (kstest_ns_TestStat == 0) && (kstest_ns_TestStat == 0)
                    disp ('Test Statistic is normally distribued')
                    [p, tbl, stats] = anova1(TestStat,[],'off')
                    writematrix (p, fullfile(inpth,[innam '-p.' inext]))
                    writecell (tbl, fullfile(inpth,[innam '-tbl.' inext]))
                    writestruct (stats, fullfile(inpth,[innam '-stats.xml']))

                elseif (kstest_as_TestStat == 1) | (kstest_ns_TestStat == 1) | (kstest_ns_TestStat == 1)
                    disp ('Test Statistic is NOT normally distribued')
                    [p, tbl, stats] = kruskalwallis(TestStat, [], 'off')
                    writematrix (p, fullfile(inpth,[innam '-p.' inext]))
                    writecell (tbl, fullfile(inpth,[innam '-tbl.' inext]))
                    writestruct (stats, fullfile(inpth,[innam '-stats.xml']))
                end
            end
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