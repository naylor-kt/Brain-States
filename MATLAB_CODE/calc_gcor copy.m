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
        
        demeaned_data=load_nii(demeaned_data);
        header_info=demeaned_data.hdr;
        orig_size=size(demeaned_data.img);
       
        U=reshape(demeaned_data.img, [], size(demeaned_data.img, 4));
        % Transpose the data matrix to have timepoints in rows and voxels in columns
        U=U';
        
        % get g (average of all unit variance time series)
        g=mean(U,2);
        
        % GCOR calculation
        GCOR=zeros(M,1);
        for i = 1:M
            GCOR(i) = 1/M * 1/ N * U(:,i)' * g;
        end
        
       % Reshape 1D vector to match original (raw) data dimensions
        demeaned_dims = size(demeaned_data.img);
        reshaped_gcor = reshape(GCOR, demeaned_dims(1), demeaned_dims(2), demeaned_dims(3));
        
        % Create a new NIfTI structure with the new data
        GCOR_map=make_nii(reshaped_gcor, [2 2 2], ...
            [demeaned_data.hdr.hist.qoffset_x demeaned_data.hdr.hist.qoffset_y demeaned_data.hdr.hist.qoffset_z]);
        
        GCOR_map.hdr=demeaned_data.original.hdr;
        GCOR_map.hdr.dime.dim(5) = 1

        % Save the new NIfTI structure with the correct sform and qform
        save_nii(GCOR_map, GCOR_map_out);
    
    end
end