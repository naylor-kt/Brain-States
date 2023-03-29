% GCOR function to calculate in grey matter area only

function calc_gcor_gm(varargin)

    if nargin<=1
        error('Not enough input variables')
    elseif nargin<=2
        error('Not enough input variables')
    elseif nargin<=3
        error('Not enough input variables')
    elseif nargin<=4
        error('Not enough input variables')
    elseif nargin<=5
        M = str2double(varargin{1});
        N = str2double(varargin{2});
        demeaned_data_input = varargin{3};
        mask_data=varargin{4};
        GCOR_map_out = varargin{5};
        
        % Load the data
        demeaned_data_info=niftiinfo(demeaned_data_input);
        demeaned_data=niftiread(demeaned_data_input);
        orig_size=size(demeaned_data);

        % Load the mask (GM)
        mask_data_info=niftiinfo(mask_data);
        mask_data=niftiread(mask_data);

        % Get the index where value is 1
        index = find(logical(mask_data(:)));
       
        U=reshape(demeaned_data, [], size(demeaned_data, 4));
        % Transpose the data matrix to have timepoints in rows and voxels in columns
        U=U';
        
        % get g (average of all unit variance time series)
        g=mean(U,2);
        
        % GCOR calculation
        data_reshaped=zeros(M,1);
        for i = 1:numel(index)
            GCOR(i) = 1/M * 1/ N * U(:,index(i))' * g;
        end

        data_reshaped(index) = GCOR;
        
       % Reshape 1D vector to match original (raw) data dimensions
        demeaned_dims = size(demeaned_data);
        reshaped_gcor = reshape(data_reshaped, demeaned_dims(1), demeaned_dims(2), demeaned_dims(3));
        
        % Create a new NIfTI structure with the new data
        GCOR_map=make_nii(data_reshaped, [2 2 2], ...
            [demeaned_data_info.raw.qoffset_x demeaned_data_info.raw.qoffset_y demeaned_data_info.raw.qoffset_z]);
        
        % Load the data with load_untouch_nii to get the header information
        info=load_untouch_nii(demeaned_data_input);
        
        % Copy the header information and modify (if needed)
        GCOR_map.hdr=info.hdr;
        GCOR_map.hdr.dime.dim(5)=1

        % Save the new NIfTI structure with the correct sform and qform
        save_nii(GCOR_map, GCOR_map_out);
    
    end
end