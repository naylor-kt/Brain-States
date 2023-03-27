% GCOR function 

function calc_gcor(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        error('Not enough input variables')
    elseif nargin<=3
        error('Not enough input variables')
    elseif nargin<=4
        M = str2double(varargin{1});
        N = str2double(varargin{2});
        demeaned_data = varargin{3};
        GCOR_map_out = varargin{4};
        
        demeaned_data=niftiread(demeaned_data);
        U=reshape(demeaned_data, [], size(demeaned_data, 4));
        % Transpose the data matrix to have timepoints in rows and voxels in columns
        U=U';
        
        % Show the size of the data matrix
        disp(size(U));
        
        % get g (average of all unit variance time series)
        g=mean(U,2);
        
        % GCOR calculation
        for i = 1:M
            GCOR(i) = 1/M * 1/ N * U(:,i)' * g;
        end
        
        %%
        % reshape 1D vector to 3D matrix
        orig_size=size(demeaned_data);
        
        % reshape 1D vector back to 4D matrix with original size
        if numel(GCOR) == prod(orig_size(1:3))
            reshaped_GCOR = reshape(GCOR, orig_size(1), orig_size(2), orig_size(3));
        else
            disp("Number of elements in result vector does not match original data")
        end
        
        
        % verify that the reshaped data has the same size as the original data
        isequal(size(reshaped_GCOR), orig_size);
        
        %% Reshape back to a Nifti file
        GCOR_map=make_nii(reshaped_GCOR);
        save_nii(GCOR_map, GCOR_map_out);

    
    end
end