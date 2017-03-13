% This function open the nifti file and project it in single subject's
% brain and surface

% make sure that you added the workbench to your path: 
% to add the workbench to your path in terminal type: 

% nano /home/urname/.cshrc

% then add this line at the end and save and exit

% setenv PATH workbenchpath$/workbench/bin_linux64:$PATH

% if you are using img format it the program transform it to nifti

function opennii(varargin)

% Finding the workbench path 
Benchpath=fileparts(which('opennii.m'));

% the path of meshes
Meshpath=fullfile(Benchpath ,'Conte69_32k_fs_LR');

n=0; 
m=0;
if isempty(varargin)
    nii=spm_select();
    m=size(nii,1);
else
    nii=varargin{1};
    m=size(nii,1);
    n=n+1;
end

% N=nifti(nii);

%%% check if the files are nifti
createdNifti=[];
for i=1:size(nii,1)
    Filename=nii(i,:);
    [pth,file,suffix]=fileparts(Filename);
    if strcmpi(suffix,'.img')
        V=spm_vol(Filename);
        ima=spm_read_vols(V);
        V.fname=fullfile(pth,[file '.nii']);
        spm_write_vol(V,ima);
        nii(i,:)=V.fname;
        createdNifti=char(createdNifti,V.fname);
    end
end

%%% showing the overlay on the surface brain
surfout=matwb_project(Meshpath,nii);
if  m>0
    if n>0
        if sum(strcmp(varargin,'NoShow'))>0
            return;
        end
    end
    matwb_view(Meshpath,char(nii,surfout));
else
    disp('Nothing has been selected')
end
return;



